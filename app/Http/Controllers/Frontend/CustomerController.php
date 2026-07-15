<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\TermsAndCondition;
use Illuminate\Http\Request;
use App\Repositories\Interfaces\WebInterface\CustomerRepositoryInterface;
use App\Models\UserLogin;
use App\Models\User;
use App\Models\MonthlyRoutine;
use App\Models\Property;
use App\Models\CustomerPost;
use Illuminate\Support\Facades\Validator;   // ← ADD THIS
use Illuminate\Support\Facades\DB;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;
// use Illuminate\Support\Facades\File;
use Session;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Concerns\EditsProperties;

class CustomerController extends Controller
{
    use EditsProperties;
    private $customerRepository;
    public function __construct(CustomerRepositoryInterface $customerRepository)
    {
        $this->customerRepository = $customerRepository;
    }

    public function dashboard()
    {
        $logged_customer = loggedCustomer();
        $customerDetails = customerDetails();
        $datas = [
            'customerDetails' => $customerDetails,
        ];
        return view('customer.dashboard.dashboard_view', $datas);
    }

    public function accountSetting()
    {
        $logged_customer = loggedCustomer();
        $customerDetails = customerDetails();
        $datas = [
            'customerDetails' => $customerDetails,
        ];
        return view('customer.dashboard.account_settings', $datas);
    }

    public function updateCustomerProfileDetails(Request $request){
        $customer = session('LoggedCustomer')->user_id;
        // dd($customer);
        $update_user = User::where('id', $customer)->first();
        $update_user->family_name = $request->family_name;
        $update_user->first_name = $request->first_name;
        $update_user->mobile = $request->mobile;
        $update_user->email = $request->email;
        $update_user->address = $request->address;
        $update_user->about = $request->about;
        $update_user->save();

        $user_login = UserLogin::where('user_id', $customer)->first();
        $user_login->username = $request->email;
        $user_login->mobile = $request->mobile;
        $user_login->save();

        return redirect()->back()->with(session()->flash('alert-success', 'Updated Successfully'));


    }

    public function updateCustomerPassword(Request $request){
        $request->validate([
            'current_password' => 'required',
            'new_password' => 'required|min:6',
            'confirm_password' => 'required|same:new_password',
        ]);

        $customer = session('LoggedCustomer')->user_id;
        $user_login = UserLogin::where('user_id', $customer)->first();

        if ($request->current_password!=$user_login->password) {
            return response()->json([
                'status' => false,
                'message' => 'Current password is incorrect.'
            ]);
        }

        $user_login->password = $request->new_password;
        $user_login->save();

        return response()->json([
            'status' => true,
            'message' => 'Password updated successfully.'
        ]);
    }

    /** update customer profile pic */

    public function updateProfilePhoto(Request $request)
    {
        $request->validate([
            'profile_pic' => 'required|image|mimes:jpg,jpeg,png'
        ]);

        $customer = session('LoggedCustomer')->user_id;

        $user = User::where('id', $customer)->first();

        if ($request->hasFile('profile_pic')) {

            // Delete old image
            if (!empty($user->profile_pic) &&
                File::exists(public_path('uploads/profile/' . $user->profile_pic))) {

                File::delete(public_path('uploads/profile/' . $user->profile_pic));
            }

            $file = $request->file('profile_pic');
            $filename = time() . '_' . uniqid() . '.' . $file->getClientOriginalExtension();

            $file->move(public_path('uploads/profile'), $filename);

            $user->profile_pic = $filename;
            $user->save();

            return response()->json([
                'status' => true,
                'message' => 'Profile photo updated successfully.',
                'image' => static_asset('uploads/profile/' . $filename)
            ]);
        }

        return response()->json([
            'status' => false,
            'message' => 'Image upload failed.'
        ]);
    }


    public function addPost()
    {
        $logged_customer = loggedCustomer();
        $customerDetails = customerDetails();
        $datas = [
            'customerDetails' => $customerDetails,
        ];
        return view('customer.add_post', $datas);
    }

    public function startPost(Request $request)
    {
        $data = $request->validate(['title'=>'required|string|max:180', 'section'=>'required|string|max:100']);
        $post = CustomerPost::create($data + ['user_id'=>session('LoggedCustomer')->user_id, 'status'=>'draft']);
        if ($request->expectsJson()) {
            return response()->json(['message'=>'Draft created.', 'redirect'=>route('customer.posts.submission', $post)]);
        }
        return redirect()->route('customer.posts.submission', $post);
    }

    public function editPostSubmission(CustomerPost $post)
    {
        $this->ensurePostOwner($post);
        return view('customer.post_submission', ['post'=>$post, 'customerDetails'=>customerDetails()]);
    }

    public function savePostSubmission(Request $request, CustomerPost $post)
    {
        $this->ensurePostOwner($post);
        $data = $request->validate([
            'title'=>'required|string|max:180', 'section'=>'required|string|max:100',
            'keywords'=>'nullable|string|max:1000', 'abstract'=>'nullable|required_if:action,submit|string',
            'editor_comments'=>'nullable|string', 'contributors'=>'nullable|string',
            'documents.*'=>'nullable|file|max:10240|mimes:pdf,doc,docx,txt,jpg,jpeg,png',
            'action'=>'required|in:draft,submit',
        ]);
        $files = $post->files ?? [];
        foreach ($request->file('documents', []) as $file) {
            $files[] = ['name'=>$file->getClientOriginalName(), 'path'=>$file->store('customer-posts', 'public')];
        }
        $contributors = json_decode($request->input('contributors', '[]'), true);
        $submitted = $data['action'] === 'submit';
        $post->update([
            'title'=>$data['title'], 'section'=>$data['section'], 'keywords'=>$data['keywords'] ?? null,
            'abstract'=>$data['abstract'] ?? null, 'editor_comments'=>$data['editor_comments'] ?? null,
            'contributors'=>is_array($contributors) ? $contributors : [], 'files'=>$files,
            'status'=>$submitted ? 'submitted' : 'draft', 'submitted_at'=>$submitted ? now() : null,
        ]);
        if ($request->expectsJson()) {
            return response()->json([
                'message'=>$submitted ? 'Post submitted successfully.' : 'Draft saved successfully.',
                'status'=>$post->status,
                'redirect'=>$submitted ? route('customer.posts.complete', $post) : null,
            ]);
        }
        if ($submitted) return redirect()->route('customer.posts.complete', $post);
        return redirect()->route('customer.posts.submission', $post)->with('alert-success', 'Draft saved successfully.');
    }

    public function postComplete(CustomerPost $post)
    {
        $this->ensurePostOwner($post);
        return view('customer.post_complete', ['post'=>$post, 'customerDetails'=>customerDetails()]);
    }

    private function ensurePostOwner(CustomerPost $post): void
    {
        abort_unless((int)$post->user_id === (int)session('LoggedCustomer')->user_id, 403);
    }



    public function customerLogout(){
        Session::flush();
        Auth::logout();
        return Redirect('/')->with(session()->flash('alert-success', 'Successfully Loggedout'));
    }





}
