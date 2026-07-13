<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Response;
use Session;
use App\Repositories\Interfaces\WebInterface\CommonRepositoryInterface;
use App\Models\ImageCategory;
use App\Models\Gallery;
use App\Models\Staff;
use App\Models\Video;
use App\Models\Course;
use App\Models\SubCourse;
use App\Models\User;
use App\Models\UserLogin;
use App\Models\State;
use App\Models\RecruitedStudent;
use App\Models\ManualResult;
use App\Models\ManualResultSubject;
use App\Models\Result;
use App\Models\Student;
use App\Models\District;
use App\Models\Block;
use App\Models\Panchayat;
use App\Models\HomeBanner;
use App\Models\UserType;
use App\Models\MasterProperty;
use App\Models\PropertyFeature;
use App\Models\Property;
use App\Models\PropertyFeatureValue;
use App\Models\PropertyImage;
use App\Models\PropertyVideo;
use App\Models\MasterPrice;
use App\Models\PropertyEnquiry;
use App\Models\CustomerPost;
use App\Models\VivahAppSlider;
use DB;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;

class CommonController extends Controller
{
    private $webRepository;

    public function __construct(CommonRepositoryInterface $webRepository)
    {
        $this->webRepository = $webRepository;
    }

    // getDistrictByState

    public function getDistrictByState($state_id)
    {
        $cities = District::where('state_id', $state_id)->get(['id', 'name']);
        return response()->json($cities);
    }

    public function getBlockByDistrict($state_id)
    {
        $cities = Block::where('district_id', $state_id)->get(['id', 'name', 'status']);
        return response()->json($cities);
    }

    public function getPanchayatByBlock($state_id)
    {
        $cities = Panchayat::where('block_id', $state_id)->get(['id', 'name', 'status']);
        return response()->json($cities);
    }

    public function index(){
        $page = $this->webRepository->getPage(1);
        $datas = [
            'banners' => $this->webRepository->getHomePageBanner(),
            'courses' => $this->webRepository->getCourse(),
            'subcourseList' => SubCourse::where('status',1)->get(),
            // 'homeBanner' => HomeBanner::where('status',1)->get(),
            'homeBanner' => VivahAppSlider::where('status',1)->get(),
            // 'recruited_students' => $this->webRepository->recruitedStudentsList(),
            'gallery_category' =>  $this->webRepository->getImageCategory(),
            'page' => $page,
            'section_lists' => $this->webRepository->getPageSectionData($page->id),
            'approvedProperties' => $this->webRepository->getApprovedProperties(),
            'propertyAddedToday_first' => $this->webRepository->getPropertyAddedToday(1,0),
            'propertyAddedToday_second' => $this->webRepository->getPropertyAddedToday(2,1),
            'agentList' => $this->webRepository->getAgentList(),
            'property_types' => MasterProperty::where('status', 1)->orderBy('name')->get(),
            'master_price_list' => MasterPrice::where('status', 1)->get(),
            'state_list' => State::where('status', 1)->orderBy('name')->get(),
        ];
        // dd($datas['approvedProperties']);
        return view('frontend.index', $datas);
    }

    public function latestPubilcation(Request $request){
        $publications = CustomerPost::with('user')->where('status', 'approved')->whereNotNull('published_at')
            ->when($request->section, fn($query,$section)=>$query->where('section',$section))
            ->when($request->search, fn($query,$search)=>$query->where(function($q) use($search){$q->where('title','like','%'.$search.'%')->orWhere('keywords','like','%'.$search.'%');}))
            ->latest('published_at')->paginate(10);
        $latestPublications = CustomerPost::where('status','approved')->whereNotNull('published_at')->latest('published_at')->limit(5)->get();
        $sections = CustomerPost::where('status','approved')->whereNotNull('published_at')->distinct()->orderBy('section')->pluck('section');
        return view('frontend.latest_publication', compact('publications','latestPublications','sections'));
    }

    public function publicationDetails($slug){
        $publication = CustomerPost::with('user')->where('slug',$slug)->where('status','approved')->whereNotNull('published_at')->firstOrFail();
        $publication->increment('abstract_views');
        $latestPublications = CustomerPost::where('status','approved')->whereNotNull('published_at')->whereKeyNot($publication->id)->latest('published_at')->limit(5)->get();
        return view('frontend.publication_details', compact('publication','latestPublications'));
    }

    public function downloadPublicationFile($slug, $file){
        $publication = CustomerPost::where('slug',$slug)->where('status','approved')->whereNotNull('published_at')->firstOrFail();
        $files = $publication->files ?? [];
        abort_unless(isset($files[$file]), 404);
        $path = storage_path('app/public/'.$files[$file]['path']);
        abort_unless(File::exists($path), 404);
        $publication->increment('download_count');
        return response()->download($path, $files[$file]['name']);
    }

    public function ownerProperties(Request $request){
       $approvedProperties = $this->webRepository->getApprovedProperties();

       if ($request->filled('state') || $request->filled('property_type') || $request->filled('budget')) {
           $query = Property::with(['images', 'videos', 'featureValues.feature', 'user'])
               ->where('properties.status', 1)
               ->select([
                   'properties.*',
                   'users.first_name as cust_name',
                   'users.mobile as cust_mobile',
                   'users.email as cust_email',
                   'master_properties.name as property_type_name',
                   'states.name as state_name',
                   'districts.name as district_name',
                   'blocks.name as block_name',
                   'master_prices.price_range as price',
                   'user_types.name as user_type',
               ])
               ->join('users', 'users.id', '=', 'properties.user_id')
               ->leftJoin('user_types', 'user_types.id', '=', 'properties.user_type')
               ->leftJoin('master_properties', 'master_properties.id', '=', 'properties.property_type_id')
               ->leftJoin('states', 'states.id', '=', 'properties.state_id')
               ->leftJoin('districts', 'districts.id', '=', 'properties.city_id')
               ->leftJoin('blocks', 'blocks.id', '=', 'properties.block_id')
               ->leftJoin('master_prices', 'master_prices.id', '=', 'properties.price');

           $query->when($request->state, fn ($query, $state) =>
               $query->where('properties.state_id', $state)
           );
           $query->when($request->property_type, fn ($query, $propertyType) =>
               $query->where('properties.property_type_id', $propertyType)
           );
           $query->when($request->budget, fn ($query, $budget) =>
               $query->where('properties.price', $budget)
           );

           $approvedProperties = $query->latest('properties.created_at')->get();
       }

       $datas = [
            'approvedProperties' => $approvedProperties,
            'agentList' => $this->webRepository->getAgentList(),
            'master_price_list' => MasterPrice::where('status', 1)->get(),
            'property_types' => MasterProperty::where('status', 1)->orderBy('name')->get(),
            'state_list' => State::where('status', 1)->orderBy('name')->get(),
        ];
        return view('frontend.owner_properties', $datas);
    }

    public function propertyDetails($slug)
    {
        $property_details = $this->webRepository->getpropertyDetails($slug);
        if (!$property_details) {
            return redirect()->route('ownerProperties');
        }
        $datas = [
            'property_details' => $property_details,
            'agent_details' => $property_details->user,
            'val' => $property_details,
            'agentList' => $this->webRepository->getAgentList(),
        ];
        return view('frontend.property_details', $datas);
    }

    public function course(){
        $courses = $this->webRepository->getCourse();
        return view('frontend.course', compact('courses'));
        // $subcourseList = SubCourse::where('status',1)->get();
        // return view('frontend.coursesingle', compact('subcourseList'));
    }

    public function ourFranchise(Request $request){
        if($request->state!=null){
            $approved_franchise = User::where('user_type_id', 2)->where('state', $request->state)->where('city', $request->city)->where('status', 1)->get();
        }else{
            $approved_franchise = null;
        }

        // dd($approved_franchise);
        $state_list = State::get();
        return view('frontend.our_franchise', compact('approved_franchise', 'state_list', 'request'));
    }
    public function ourTeam(){
        $team_list = User::where('user_type_id', 5)->where('status', 1)->get();
        return view('frontend.our_team', compact('team_list'));
    }

    public function courseDetails($courseslug){
        $coursedetails = Course::where('slug',$courseslug)->first();
        $subcourseList = SubCourse::where('course_id',$coursedetails->id)->get();
        return view('frontend.coursesingle', compact('coursedetails', 'subcourseList'));
    }

    public function SubcourseDetails($slug){
        $subcourse = SubCourse::where('slug',$slug)->first();
        $coursedetails = Course::where('id', $subcourse->course_id)->first();
        return view('frontend.sub_course_details', compact('coursedetails', 'subcourse'));
    }

    public function minfertBlk(){
        return view('frontend.pages.minfert-blk');
    }

    public function blkLiquid(){
        return view('frontend.pages.blk-liquid');
    }
    public function gbr(){
        return view('frontend.pages.gbr');
    }

    public function geocare(){
        return view('frontend.pages.geocare');
    }

    public function reskue(){
        return view('frontend.pages.reskue');
    }

    public function humicrons(){
        return view('frontend.pages.humicrons');
    }

    public function thripsKranti(){
        return view('frontend.pages.thripsKranti');
    }

    public function tigerBooster(){
        return view('frontend.pages.tigerBooster');
    }

    // public function index(){
    //     return view('frontend.index');
    // }
    public function aboutUs(){
        return view('frontend.about');
    }

    public function whyChooseUs(){
        return view('frontend.pages.why_choose_us');
    }

    public function qualityPolicy(){
        return view('frontend.pages.quality_policy');
    }

    public function manufacturingMarketing(){
        return view('frontend.manufacturing_marketing');
    }

    public function certificate(){
        return view('frontend.pages.certificate');
    }

    public function enquiry(){
        return view('frontend.enquiry');
    }

    public function career(){
        return view('frontend.career');
    }

    public function contact_us(){
       return view('frontend.contact_us');
    }

    public function complain(){
        return view('frontend.complain');
     }

    public function therapies(){
        return view('frontend.therapies');
    }

    public function photoGallery(){
        $gallery_category =  $this->webRepository->getImageCategory();
        // dd($gallery_category);
        return view('frontend.photo_gallery', compact('gallery_category'));
    }

    public function videoGallery(){
        $videoList =  $this->webRepository->getVideoList();
        return view('frontend.video_gallery', compact('videoList'));
    }

    public function photoGalleryDetails($slug){
        $cat_details =  $this->webRepository->getGalleryDetails($slug);
        if($cat_details){
            $gallery_details =  $this->webRepository->photoGalleryDetails($cat_details->id);
            return view('frontend.gallery_details', compact('gallery_details','cat_details'));
        }else{
           return redirect('');
        }
     // dd($gallery_list);
    }

    public function careerDetails(Request $request){
        $career = $this->webRepository->getCareerDetail($request->career_id);
        if($request->career_id != null && $career != null){
            return view('frontend.insights.career_detail', ['career' => $career]);
        }else{
            abort(404);
        }
    }

    public function postOnlineEnquiry(Request $request){
        $data = $request->validate([
            'name' => 'required',
            // 'last_name' => 'required',
            'subject' => 'nullable',
            'phone' => 'required|digits:10|regex:/^[0-9]{10}$/',
            'email' => 'required|email',
            'message' => 'required',
            // 'address' => 'required',
            // 'datetime' => 'required',
            // 'services' => 'required',
            // 'gender' => 'required',
        ]);
        // dd($data);
        $save_data = $this->webRepository->postOnlineEnquiry($data);
        if (!$save_data) {
            return response()->json([
                "status" => false,
            ]);
        } else {
            return response()->json([
                "status" => true,
            ]);

        }
    }

    public function homePageEnquiry(Request $request){
        $data = $request->validate([
            'name' => 'required',
            'phone' => 'required|digits:10|regex:/^[0-9]{10}$/',
            'email' => 'required|email',
            'message' => 'required',
            'project' => 'nullable',
        ]);
        // dd($data);
        $save_data = $this->webRepository->posthomePageEnquiry($data);
        if (!$save_data) {
            return response()->json([
                "status" => false,
                "message" => 'Something Went Wrong!',
            ]);
        } else {
            return response()->json([
                "status" => true,
                "message" => 'Thank You For Your Enquiry',
            ]);

        }
    }

    public function storeComplain(Request $request){
        $data = $request->validate([
            'name' => 'required',
            'phone' => 'required|digits:10|regex:/^[0-9]{10}$/',
            'email' => 'required|email',
            'message' => 'required',
        ]);
        // dd($data);
        $save_data = $this->webRepository->poststoreComplain($data);
        if (!$save_data) {
            return response()->json([
                "status" => false,
            ]);
        } else {
            return response()->json([
                "status" => true,
            ]);

        }
    }

    public function studentOnlineEnquiry(Request $request){
        $data = $request->validate([
            'name' => 'required',
            // 'last_name' => 'required',
            // 'project' => 'required',
            'phone' => 'required|digits:10|regex:/^[0-9]{10}$/',
            'email' => 'required|email',
            'message' => 'required',
            'address' => 'required',
            // 'datetime' => 'required',
            'department' => 'required',
            'gender' => 'required',
        ]);
        // dd($data);
        $save_data = $this->webRepository->studentOnlineEnquiry($data);
        if (!$save_data) {
            return response()->json([
                "status" => false,
            ]);
        } else {
            return response()->json([
                "status" => true,
            ]);

        }
    }

        public function careerEnquiry(Request $request){
            $data = $request->validate([
                'post' => 'required',
                'name' => 'required',
                'email' => 'required|email',
                'phone' => 'required|max:15',
                // 'gender' => 'required',
                'resume'   => 'required|mimes:doc,pdf,docx',
                'message' => 'required',
            ]);

            if($request->has('resume')){
                $data['resume'] = upload_asset($request->resume, "resume");
            }else{
                $data['resume'] = NULL;
            }
            $this->webRepository->storeCareerEnquiry($data);
            return redirect("index")->with(session()->flash('alert-success', 'Thankyou contacting with us. Our Team will contact you soon...'));
        }

        public function storeCareerData(Request $request){

            $data = $request->validate([
                'first_name' => 'required',
                'last_name' => 'required',
                'email' => 'required|email',
                'phone' => 'required|numeric',
                'apply_for' => 'required',
                // 'gender' => 'required',
                'resume'   => 'required|mimes:doc,pdf,docx',
                'message' => 'required',
            ]);
            if ($request->has('resume')) {
                $file = $request->file('resume');
                $extenstion = $file->getClientOriginalExtension();
                $document_name = 'resume-' . time() . '.' . $extenstion;
                $file->move(public_path('uploads/resume'), $document_name);
            } else {
                $document_name = null;
            }
            $data['resume'] = $document_name;
            // return redirect("index")->with(session()->flash('alert-success', 'Thank You. Our Team will contact you soon...'));
            $save_data = $this->webRepository->storeCareerData($data);
            if (!$save_data) {
                return response()->json([
                    "status" => false,
                ]);
            } else {
                return response()->json([
                    "status" => true,
                ]);

            }
        }

        public function hireTeam(){
            return view('frontend.hire_team');
        }

        public function storeHireTeam(Request $request){
            $data = $request->validate([
                'name' => 'required',
                'email' => 'required|email',
                'phone' => 'required|numeric',
                'gender' => 'required',
                'resume'   => 'nullable|mimes:doc,pdf,docx',
                'message' => 'required',
            ]);

            if($request->has('resume')){
                $data['resume'] = upload_asset($request->resume, "resume", "local");
            }else{
                $data['resume'] = NULL;
            }
            $this->webRepository->storeHireTeam($data);

            return redirect("hire-team")->with(session()->flash('alert-success', 'Thank You. Our Team will contact you soon...'));
        }

        public function faqs(){
            $page = $this->webRepository->getPage(8);
            $datas = [
                'page' => $page,
                'section_lists' => $this->webRepository->getPageSectionData($page->id),
                'faqs' => $this->webRepository->getFaqs(),
            ];
            return view('frontend.insights.faq', $datas);
        }

        public function videos(){
            $page = $this->webRepository->getPage(16);
            $datas = [
                'page' => $page,
                'section_lists' => $this->webRepository->getPageSectionData($page->id),
            ];
            return view('frontend.insights.videos', $datas);
        }

        public function projects(){
            $page = $this->webRepository->getPage(17);
            $datas = [
                'page' => $page,
                'section_lists' => $this->webRepository->getPageSectionData($page->id),
            ];
            return view('frontend.insights.project', $datas);
        }

        public function galleries(){
            $page = $this->webRepository->getPage(18);
            $datas = [
                'page' => $page,
                'section_lists' => $this->webRepository->getPageSectionData($page->id),
                'categories' => $this->webRepository->getImageCategory(),
                'galleries' => $this->webRepository->getGallery(),
            ];
            return view('frontend.insights.gallery', $datas);
        }
    /** Insights Section End */

    /** News Section Start */
        public function newsListing(){
            $data = [
                'news' => $this->webRepository->getBlogs('news'),
                'categories' => $this->webRepository->getCategories('news'),
                'recent_posts' => $this->webRepository->getRecentPost('news'),
            ];
            // dd($data);
            return view('frontend.news.list', $data);
        }

        public function newsSlugListing($cat_slug){
            $data = [
                'news' => $this->webRepository->getBlogs('news', $cat_slug),
                'categories' => $this->webRepository->getCategories('news'),
                'recent_posts' => $this->webRepository->getRecentPost('news'),
            ];
            return view('frontend.news.list', $data);
        }

        public function newsDetail(Request $request, $slug){
            $ip = $request->ip();
            $post = $this->webRepository->getBlogDetail($slug, $ip);
            $data = [
                'post' => $post,
                'categories' => $this->webRepository->getCategories('news'),
                'recent_posts' => $this->webRepository->getRecentPost('news'),
                'related_posts' => $this->webRepository->getRelatedPost('news', $post->category_id),
            ];

            return view('frontend.news.details', $data);
        }
    /** News Section End */


    /** Event Section Start */
        public function eventListing(){
            $data = [
                'event_category' => ImageCategory::latest()->get(),
                'categories' => $this->webRepository->getCategories('event'),
                // 'recent_posts' => $this->webRepository->getRecentPost('event'),
            ];
            // dd($data);
            return view('frontend.events.events', $data);
        }

        public function eventSlugListing($cat_slug){
            $check_gallery_slug = ImageCategory::where('slug', $cat_slug)->first();
            if($check_gallery_slug){
                $data = [
                    'gallery_list' => Gallery::where('category_id', $check_gallery_slug->id)->get(),
                ];
                return view('frontend.events.gallery_list', $data);
            }else{
                return redirect('');
            }

        }

        public function eventDetail(Request $request, $slug){
            $ip = $request->ip();
            $post = $this->webRepository->getBlogDetail($slug, $ip);
            $data = [
                'post' => $post,
                'categories' => $this->webRepository->getCategories('event'),
                'recent_posts' => $this->webRepository->getRecentPost('event'),
                'related_posts' => $this->webRepository->getRelatedPost('event', $post->category_id),
            ];

            return view('frontend.events.details', $data);
        }
    /** Event Section End */

    /** Blog Section Start */
        public function blogListing(){
            $data = [
                'blogs' => $this->webRepository->getBlogs('blog'),
                'categories' => $this->webRepository->getCategories('blog'),
                // 'recent_posts' => $this->webRepository->getRecentPost('blog'),
            ];
            // dd($data);
            return view('frontend.blogs', $data);
        }

        public function blogSlugListing($cat_slug){
            $data = [
                'blogs' => $this->webRepository->getBlogs('blog', $cat_slug),
                'categories' => $this->webRepository->getCategories('blog'),
                // 'recent_posts' => $this->webRepository->getRecentPost('blog'),
            ];
            return view('frontend.blogs', $data);
        }

        public function blogDetail(Request $request, $slug){
            $ip = $request->ip();
            $post = $this->webRepository->getBlogDetail($slug, $ip);
            if($post){
                $data = [
                    'post' => $post,
                    'categories' => $this->webRepository->getCategories('blog'),
                    // 'recent_posts' => $this->webRepository->getRecentPost('blog'),
                    // 'related_posts' => $this->webRepository->getRelatedPost('blog', $post->category_id),
                ];
                return view('frontend.blog_details', $data);
            }else{
                return redirect('');
            }

        }



        public function storeBlogComment(Request $request){
            $data = $request->validate([
                'blog_id' => 'required',
                'comment' => 'required',
                // 'comment' => 'required|max:160',
                'name' => 'required',
                'email' => 'required',
            ]);

            $response = $this->webRepository->storeBlogComment($data);
            if($response){
                return response($response);
            }else{
                return 'false';
            }

        }

        public function showBlogComments(Request $request){
            $data = $request->validate([
                'blog_id' => 'required',
            ]);

            $response = $this->webRepository->getBlogComments($request->blog_id);
            // dd($response);
            $output = '';

            if($response != null){
                foreach($response as $res){
                    //$output .= '<div class="comment"><div class="comment-body"><div class="comment-meta"><div class="comment-meta-author"><a href="#">'.$res->first_name. ' ' .$res->last_name.'</a></div>';
                    //$output .= '<div class="comment-meta-date">'.$res->created_at.'</div></div>';
                   // $output .= ' <div class="comment-content"><p>'.$res->comment.'</p></div></div></div>';

                    $output.='<div class=" d-flex">
                    <div class="commetn-img w-10">
                       <img src="'.static_asset('assets/assets_web/img/blog1.png').'" alt="comment" class="w-50px h-50px p-1 shadow  rounded-circle ">
                    </div>
                    <div class="comment-text w-90">
                       <h2 class="fs-16 lsp-5 text-block fw-bold">'.$res->name.'</h2>
                       <em class="fs-12 lsp-5">'.convert_datetime_to_date_format($res->created_at, 'd M Y').'</em>
                       <p>'.$res->comment.'</p>
                       <a href="javascript:void();" class="bg-sky w-120 h-35px d-block fs-13 lsp-5 text-center lh-35 text-white rounded-1">Reply</a>
                    </div>
                 </div></br>';

                }
            }
            return Response::json([
                'status' => true,
                'data' => $output,
            ], 200);
        }
    /** Blog Section End */
/**
 *
 * <div class=" d-flex">  */

    // public function contact_us(){
    //     $page = $this->webRepository->getPage(3);
    //         $datas = [
    //             'page' => $page,
    //             'section_lists' => $this->webRepository->getPageSectionData($page->id),
    //         ];
    //     return view('frontend.contact_us', $datas);
    // }

    public function postContactEnquiry(Request $request){
        $data = $request->validate([
            'name' => 'required',
            'project' => 'required',
            'email' => 'required|email',
            'phone' => 'required|digits:10|regex:/^[0-9]{10}$/',
            'message' => 'required',
            // /'course' => 'required',
        ]);
        $save_data = $this->webRepository->storeContactEnquiry($data);
        if (!$save_data) {
            return response()->json([
                "status" => false,
            ]);
        } else {
            return response()->json([
                "status" => true,
            ]);

        }
        // return redirect()->back()->with(session()->flash('alert-success', 'Thankyou contacting with us. Our Team will help you soon...'));
    }

    public function postNewsletter(Request $request){
        $data = $request->validate([
            'email' => 'required|email',
        ]);
        $response = $this->webRepository->storeNewsletter($data);
        return response($response);
    }

    public function testimonial(){
        $page = $this->webRepository->getPage(6);
        return view('frontend.testimonial', compact('page'));
    }


    public function teamDetails($id){
        $details = User::where('id', $id)->where('status',1)->first();
        if($details){
            $team_list = User::where('user_type_id', 5)->where('id', '!=', $id)->where('status', 1)->get();
            return view('frontend.team_details', compact('details', 'team_list'));
        }else{
            return redirect('');
        }
    }

    public function ourClients(){
        return view('frontend.clients');
    }

    public function awards(){
        $awards = $this->webRepository->getAwardList();
        $certificates = $this->webRepository->getCertificateList();
        return view('frontend.awards', compact('awards','certificates'));
    }



    public function profile(){
        return view('frontend.profile.index');
    }

    public function privacyPolicy(){
        return view('frontend.privacy_policy');
    }

    public function termsCondition(){
        return view('frontend.term_condition');
    }

    public function disclaimer(){
        return view('frontend.disclaimer');
    }

    public function refundPolicy(){
        return view('frontend.refund');
    }

    public function getQuote(){
        return view('frontend.get_quote');
    }

    public function scheduleMeeting(){
        return view('frontend.schedule_meeting');
    }

    public function postQuoteData(Request $request){
        $data = $request->validate([
            'name' => 'required',
            'phone' => 'required',
            'email' => 'required|email',
            'skype' => 'required',
            'message' => 'required',
        ]);
        $this->webRepository->storeQuoteData($data);
        return redirect()->back()->with(session()->flash('alert-success', 'Thankyou contacting with us. Our Team will help you soon...'));
    }

    public function storeScheduleMeetings(Request $request){
        $data = $request->validate([
            'name' => 'required',
            'phone' => 'required',
            'email' => 'required|email',
            'skype' => 'required',
            'schedule_date' => 'required',
            'schedule_time' => 'required',
            'message' => 'required',
        ]);
        $this->webRepository->storeScheduleMeetings($data);
        return redirect()->back()->with(session()->flash('alert-success', 'Thankyou contacting with us. Our Team will help you soon...'));
    }

    public function storePricingEnquiry(Request $request){
        // $data = [
        //     'transport' => 'smtp',
        //     'host' => env('MAIL_HOST', 'smtp.mailgun.org'),
        //     'port' => env('MAIL_PORT', 587),
        //     'encryption' => env('MAIL_ENCRYPTION', 'null'),
        //     'username' => env('MAIL_USERNAME'),
        //     'password' => env('MAIL_PASSWORD'),
        //     'timeout' => null,
        //     'local_domain' => env('MAIL_EHLO_DOMAIN'),

        //     'auth_mode'  => null,
        //      'verify_peer'       => false,
        // ];
        // dd($data);
        $data = $request->validate([
            'name' => 'required',
            'phone' => 'required',
            'email' => 'required|email',
            'skype' => 'required',
            'pricing_id' => 'required',
            'message' => 'required',
        ]);

        $this->webRepository->storePricingEnquiries($data);
        return redirect()->back()->with(session()->flash('alert-success', 'Thankyou contacting with us. Our Team will help you soon...'));
    }

    public function postProperty(){
        $user_types = UserType::whereIn('id', [2,5,6,7])->where('status', 1)->get();
        return view('frontend.post_property', compact('user_types'));
    }

    public function savePropertyPartOne(Request $request){
        $data = array(
            'user_type' => $request->user_type,
            'purpose' => $request->purpose,
            'whatsapp' => $request->whatsapp,
            'name' => $request->name,
        );

        // Store in session
        session(['property_part_one' => $data]);

        return response()->json([
            'status' => true,
            'message' => 'Data saved in session',
            'redirect_url' => url('post-property-details')
        ]);

    }

    public function postPropertyDetails(){
        $property_part_one = session('property_part_one');
        if(!$property_part_one){
            return redirect()->route('postProperty')->with(session()->flash('alert-danger', 'Please fill the first part of the form.'));
        }
        $user_types = UserType::whereIn('id', [2,5,6,7])->where('status', 1)->get();
        $property_types = MasterProperty::where('status', 1)->get();
        $state_list = State::where('status', 1)->get();
        $master_price_list = MasterPrice::where('status', 1)->get();
        return view('frontend.post_property_details', compact('property_part_one', 'user_types', 'property_types', 'state_list', 'master_price_list'));
    }

    public function getPropertyFeatures(Request $request)
    {
        $features = PropertyFeature::where('property_type', $request->property_type)
                    ->where('status',1)
                    ->get();

        $html = view('frontend.get_property_features_ajax',compact('features'))->render();

        return response()->json([
            'html' => $html
        ]);
    }

    public function savePropertyPartTwoDetails(Request $request){
        $request->validate([
            'video' => 'nullable|array|max:2',
            'video.*' => 'file|mimetypes:video/mp4,video/quicktime,video/x-msvideo,video/x-ms-wmv,video/webm|max:102400',
        ]);

        DB::beginTransaction();

        try {

            $data = $request->all();

            // Existing user ya new user
            $user = $this->createUser($data);

            // Login table entry sirf new user ke liye
            $userLogin = UserLogin::where('user_id', $user->id)->first();

            if (!$userLogin) {

                UserLogin::create([
                    'username'            => $data['email'],
                    'mobile'              => $data['mobile'],
                    'password'            => '123456',
                    'user_id'             => $user->id,
                    'user_type_id'        => $data['user_type'],
                    'user_designation_id' => $data['user_type'],
                    'status'              => 1,
                ]);
            }

            $slug = Str::slug($request->property_title);
            $originalSlug = $slug;
            $count = 1;

            while (Property::where('property_slug', $slug)->exists()) {
                $slug = $originalSlug . '-' . $count;
                $count++;
            }

            $property = Property::create([
                'user_id'           => $user->id,
                'user_type'         => $request->user_type,
                'purpose'           => $request->propertyPurpose,
                'property_type_id'  => $request->property_type,
                'state_id'          => $request->state,
                'city_id'           => $request->city,
                'block_id'          => $request->block,
                'locality'          => $request->locality,
                'pincode'           => $request->pincode,
                'price'             => $request->price,
                'property_details'             => $request->property_details,
                'property_title'             => $request->property_title,
                'property_slug'             => $slug,
                'property_area'             => $request->property_area,
            ]);

            // Feature & Image Code

                if($request->has('features'))
                {
                    foreach($request->features as $key => $value)
                    {
                        PropertyFeatureValue::create([
                            'property_id'   => $property->id,
                            'feature_key'   => $key,
                            'feature_value' => $value,
                        ]);
                    }
                }

                if($request->hasFile('picture'))
                {
                    foreach($request->file('picture') as $image)
                    {
                        $filename = time().'_'.uniqid().'.'.$image->getClientOriginalExtension();

                        $image->move(
                            public_path('uploads/property'),
                            $filename
                        );

                        PropertyImage::create([
                            'property_id' => $property->id,
                            'image'       => $filename
                        ]);
                    }
                }

                if($request->hasFile('video'))
                {
                    File::ensureDirectoryExists(public_path('uploads/property/videos'));

                    foreach($request->file('video') as $video)
                    {
                        $filename = time().'_'.uniqid().'.'.$video->getClientOriginalExtension();

                        $video->move(
                            public_path('uploads/property/videos'),
                            $filename
                        );

                        PropertyVideo::create([
                            'property_id' => $property->id,
                            'video'       => $filename
                        ]);
                    }
                }

            DB::commit();

            session()->forget('property_part_one');

            return response()->json([
                'status' => true,
                'redirect_url' => url('post-property-confirmation'),
                'message' => 'Property added successfully'
            ]);

        } catch (\Exception $e) {

            DB::rollBack();

            return response()->json([
                'status' => false,
                'message' => $e->getMessage()
            ]);
        }
    }

    public function createUser($data)
    {
        $user = User::where('email', $data['email'])
                    ->orWhere('mobile', $data['mobile'])
                    ->first();

        if ($user) {
            return $user; // Existing user
        }

        return User::create([
            'first_name'   => $data['name'],
            'email'        => $data['email'],
            'mobile'       => $data['mobile'],
            'user_type_id' => $data['user_type'],
            'status'       => 1,
        ]);
    }

    public function postPropertyConfirmation(){
        return view('frontend.post_property_confirmation');
    }

    public function savePropertyEnquiry(Request $request){
        $data = $request->validate([
            'name' => 'required',
            'property_id' => 'required',
            'mobile' => 'required|digits:10|regex:/^[0-9]{10}$/',
            'email' => 'required|email',
            'message' => 'required|string',
        ]);
        $save_data = $this->webRepository->savePropertyEnquiry($data);
        if (!$save_data) {
            return response()->json([
                "status" => false,
                "message" => 'Something Went Wrong!',
            ]);
        } else {
            return response()->json([
                "status" => true,
                "message" => 'Thank You for You Enquiry.',
            ]);

        }
    }

    public function saveScheduleTourForm(Request $request){
        $data = $request->validate([
            'enq_date' => 'required|date',
            'enq_time' => 'required',
            'name' => 'required',
            'property_id' => 'required',
            'mobile' => 'required|digits:10|regex:/^[0-9]{10}$/',
            'email' => 'required|email',
            'message' => 'nullable',
        ]);
        $save_data = $this->webRepository->saveScheduleTourForm($data);
        if (!$save_data) {
            return response()->json([
                "status" => false,
                "message" => 'Something Went Wrong!',
            ]);
        } else {
            return response()->json([
                "status" => true,
                "message" => 'Thank You for You Enquiry.',
            ]);

        }
    }

    public function propertyFilterOwenProperties(Request $request){
        // dd($request->all());

        $query = Property::with([
							'images',
							'videos',
							'featureValues.feature',
							'user'
						])->where('properties.status', 1)->select([
						'properties.*',
						'users.first_name as cust_name',
						'users.mobile as cust_mobile',
						'users.email as cust_email',
						'master_properties.name as property_type_name',
						'states.name as state_name',
						'districts.name as district_name',
						'blocks.name as block_name',
						'master_prices.price_range as price',
						'user_types.name as user_type',
					])->join('users', 'users.id', '=', 'properties.user_id')
					  ->leftJoin('user_types', 'user_types.id', '=', 'properties.user_type')
					  ->leftJoin('master_properties', 'master_properties.id', '=', 'properties.property_type_id')
					  ->leftJoin('states', 'states.id', '=', 'properties.state_id')
					  ->leftJoin('districts', 'districts.id', '=', 'properties.city_id')
					  ->leftJoin('blocks', 'blocks.id', '=', 'properties.block_id')
					  ->leftJoin('master_prices', 'master_prices.id', '=', 'properties.price');

						if (!empty($request->budgets)) {
							$query->whereIn('master_prices.id', $request->budgets);
						}

						if (!empty($request->propertyType)) {
							$query->where('properties.property_type_id', $request->propertyType);
						}

						if (!empty($request->state)) {
							$query->where('properties.state_id', $request->state);
						}

						if (!empty($request->district)) {
							$query->where('properties.city_id', $request->district);
						}
						if (!empty($request->block)) {
							$query->where('properties.block_id', $request->block);
						}

					$approvedProperties = $query->latest()->get();
		$html = view('frontend.property.ajax_property_list', compact('approvedProperties'))->render();

        return response()->json([
            'html' => $html
        ]);
    }

    public function ownerProperties1(Request $request){
       $approvedProperties = $this->webRepository->getApprovedProperties();

       if ($request->filled('state') || $request->filled('property_type') || $request->filled('budget')) {
           $query = Property::with(['images', 'videos', 'featureValues.feature', 'user'])
               ->where('properties.status', 1)
               ->select([
                   'properties.*',
                   'users.first_name as cust_name',
                   'users.mobile as cust_mobile',
                   'users.email as cust_email',
                   'master_properties.name as property_type_name',
                   'states.name as state_name',
                   'districts.name as district_name',
                   'blocks.name as block_name',
                   'master_prices.price_range as price',
                   'user_types.name as user_type',
               ])
               ->join('users', 'users.id', '=', 'properties.user_id')
               ->leftJoin('user_types', 'user_types.id', '=', 'properties.user_type')
               ->leftJoin('master_properties', 'master_properties.id', '=', 'properties.property_type_id')
               ->leftJoin('states', 'states.id', '=', 'properties.state_id')
               ->leftJoin('districts', 'districts.id', '=', 'properties.city_id')
               ->leftJoin('blocks', 'blocks.id', '=', 'properties.block_id')
               ->leftJoin('master_prices', 'master_prices.id', '=', 'properties.price');

           $query->when($request->state, fn ($query, $state) =>
               $query->where('properties.state_id', $state)
           );
           $query->when($request->property_type, fn ($query, $propertyType) =>
               $query->where('properties.property_type_id', $propertyType)
           );
           $query->when($request->budget, fn ($query, $budget) =>
               $query->where('properties.price', $budget)
           );

           $approvedProperties = $query->latest('properties.created_at')->get();
       }

       $datas = [
            'approvedProperties' => $approvedProperties,
            'agentList' => $this->webRepository->getAgentList(),
            'master_price_list' => MasterPrice::where('status', 1)->get(),
            'property_types' => MasterProperty::where('status', 1)->orderBy('name')->get(),
            'state_list' => State::where('status', 1)->orderBy('name')->get(),
        ];
        return view('frontend.owner_properties', $datas);
    }






}
