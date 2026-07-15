<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Session;
use App\Models\User;
use App\Models\UserLogin;
use App\Models\State;
use App\Models\Student;
use App\Models\Course;
use App\Models\UserType;
use Hash;
use Validator;
use Illuminate\Validation\Rule;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;

class AuthController extends Controller
{

    /** Customer Login page start */
    public function loginRegister(){
        $user_types = UserType::whereIn('id', [2,5,6,7])->where('status', 1)->get();
        return view('frontend.auth.login-register', compact('user_types'));
    }

    public function postLogin(Request $request){
        $data = $request->validate([
            'username' => 'required',
            'password' => 'required',
        ]);

        $is_loggedin =  UserLogin::join('users', 'users.id', '=', 'user_logins.user_id')
            ->join('user_types', 'user_types.id', '=', 'users.user_type_id')
            ->where(function ($query) use ($request) {
                $query->where('user_logins.username', $request->username)
                    ->orWhere('user_logins.mobile', $request->username);
            })
            ->where('user_logins.password', $request->password)
            ->where('user_logins.status', 1)
            // ->where('user_logins.user_type_id', 2)
            ->select(['users.*', 'user_types.name as userType', 'user_logins.*'])
            ->first();


        if (!$is_loggedin) {
            // return redirect()->back()->with(session()->flash('alert-danger', 'Failed! We do not recognize your username or password.'));
            return response()->json([
                "status" => false,
                "message" => "Failed! We do not recognize your username or password."
            ]);
        } else  {
            $request->session()->put('LoggedCustomer', $is_loggedin);
            // return redirect()->route('franchise.dashboard')->with(session()->flash('alert-success', 'Successfully Loggedin.'));
            return response()->json([
                "status" => true,
                "message" => "Successfully Loggedin.",
                "redirect" => route('customer.dashboard'),
            ]);
        }
    }

    public function sendResetLink(Request $request)
    {
        $request->validate(['email' => 'required|email']);

        $user = User::where('email', $request->email)
            ->whereIn('user_type_id', [2, 5, 6, 7])
            ->where('status', 1)
            ->first();

        // Always return the same response so an email address cannot be used
        // to discover whether an account exists.
        if ($user) {
            $token = Str::random(64);

            DB::table('password_resets')->updateOrInsert(
                ['email' => $user->email],
                ['token' => hash('sha256', $token), 'created_at' => now()]
            );

            $resetUrl = route('password.reset', ['token' => $token, 'email' => $user->email]);

            Mail::send('emails.customer-password-reset', [
                'user' => $user,
                'resetUrl' => $resetUrl,
            ], function ($message) use ($user) {
                $message->to($user->email, $user->first_name)
                    ->subject('Reset your password');
            });
        }

        return response()->json([
            'status' => true,
            'message' => 'If an account exists for that email, a password reset link has been sent.',
        ]);
    }

    public function showResetPassword(Request $request, string $token)
    {
        return view('frontend.auth.reset-password', [
            'token' => $token,
            'email' => $request->query('email'),
        ]);
    }

    public function resetPassword(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'token' => 'required',
            'password' => 'required|min:8|confirmed',
        ]);

        $reset = DB::table('password_resets')
            ->where('email', $request->email)
            ->where('token', hash('sha256', $request->token))
            ->first();

        if (!$reset || now()->diffInMinutes($reset->created_at) > 60) {
            return back()->withErrors(['email' => 'This password reset link is invalid or has expired.']);
        }

        $user = User::where('email', $request->email)
            ->whereIn('user_type_id', [2, 5, 6, 7])
            ->where('status', 1)
            ->first();

        if (!$user) {
            return back()->withErrors(['email' => 'This password reset link is invalid or has expired.']);
        }

        UserLogin::where('user_id', $user->id)->update(['password' => $request->password]);
        DB::table('password_resets')->where('email', $request->email)->delete();

        return redirect()->route('loginRegister')->with('password_reset_success', 'Your password has been reset. You can now sign in.');
    }
     
    public function getIpAddress(Request $request){
        return $request->ip();
    }

    public function postRegistration(Request $request){
        // dd("I am here");
        // dd($request->all());
        $userType = 2;

        $request->validate([
            'family_name' => 'required',
            'first_name' => 'required',
            // 'user_type' => 'required',
            'email' => [
                'required',
                'email',
                Rule::unique('users')->where(function ($query) use ($userType) {
                    return $query->where('status', 1)
                                ->where('user_type_id', $userType);
                }),
            ],
            'mobile' => [
                'required',
                'min:10',
                'max:13',
                Rule::unique('users')->where(function ($query) use ($userType) {
                    return $query->where('status', 1)
                                ->where('user_type_id', $userType);
                }),
            ],
            'password' => 'required|min:8|confirmed',
        ]);

        $data = $request->all();
        $data['user_type'] = $userType;
        $data['family_name'] = $data['family_name'];
        $check = $this->create($data);
        if($check){
            $user_login = UserLogin::create([
                'username' => $data['email'],
                'mobile' => $data['mobile'],
                'password' => $data['password'],
                'user_id' => $check->id,
                'user_type_id' => $data['user_type'],
                'user_designation_id' => $data['user_type'],
                'status' => 1,
            ]);

            $is_loggedin = User::join('user_logins', 'user_logins.user_id', '=', 'users.id')
                ->where('users.id', $check->id)
                ->select(['users.*', 'user_logins.*'])
                ->first();

            $request->session()->put('LoggedCustomer', $is_loggedin);
            return response()->json([
                "status" => true,
                "message" => "Successfully Registered.",
                "redirect" => route('customer.dashboard'),
            ]);
        }else {
            return response()->json([
                "status" => false,
                "message" => "Failed to register, Something went wrong."
            ]);
        }
	}

    public function create(array $data){
        return User::create([
            'first_name' => $data['first_name'],
            'family_name' => $data['family_name'],
            'mobile' => $data['mobile'],
            'email' => $data['email'],
            'status' => 1,
            'user_type_id' => $data['user_type'],
            'user_designation_id' => $data['user_type'],
        ]);
    }
    /** Franchise Registration page End */

    public function logout() {
        Session::flush();
        Auth::logout();
        return Redirect('/')->with(session()->flash('alert-success', 'Successfully Loggedout'));
    }








}
