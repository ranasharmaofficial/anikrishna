<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Frontend\CommonController;
use App\Http\Controllers\Frontend\ServiceController;
use App\Http\Controllers\Frontend\ProductController;
use App\Http\Controllers\Frontend\CountryStateCityController;
use App\Http\Controllers\Frontend\MemberController;
use App\Http\Controllers\Frontend\CustomerController;
use App\Http\Controllers\Admin\LogoutController;



/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/clear-cache', function () {
    Artisan::call('cache:clear');
    Artisan::call('config:cache');
    Artisan::call('config:clear');
    Artisan::call('view:clear');
    Artisan::call('route:clear');
    return "Cache is cleared by @RanaSharma";
});

Route::get('/get-district-by-state/{state_id}', [CommonController::class, 'getDistrictByState']);

Route::get('/get-district-by-state/{state_id}',  [CommonController::class, 'getDistrictByState']);
Route::get('/get-blocks-by-district/{state_id}', [CommonController::class, 'getBlockByDistrict']);
Route::get('/get-panchayat-by-block/{state_id}', [CommonController::class, 'getPanchayatByBlock']);


Route::get('/about', function () {
    return view('frontend.pages.about');
});

Route::get('/why-us', function () {
    return view('frontend.pages.why-us');
});

Route::get('/mission', function () {
    return view('frontend.pages.mission');
});

Route::get('/what-we-publish', function () {
    return view('frontend.pages.what-we-publish');
});

Route::get('/submit-research-paper', function () {
    return view('frontend.pages.submit-research-paper');
});

Route::get('/publication-guideline', function () {
    return view('frontend.pages.publication-guideline');
});

Route::get('/current-issue', function () {
    return view('frontend.pages.current-issue');
});

Route::get('/editorial-board', function () {
    return view('frontend.pages.editorial-board');
});

Route::get('/reviewer-board', function () {
    return view('frontend.pages.reviewer-board');
});

Route::get('/refereed-board', function () {
    return view('frontend.pages.refereed-board');
});

Route::get('/managing-board', function () {
    return view('frontend.pages.managing-board');
});

Route::get('/ethics', function () {
    return view('frontend.pages.ethics');
});

Route::get('/peer-review-policy', function () {
    return view('frontend.pages.peer-review-policy');
});


Route::get('/download-admitcard', function () {
    return view('frontend.pages.download-admitcard');
});

Route::get('/affiliation', function () {
    return view('frontend.affiliation');
});


Route::get('/login-register', function () {
    return view('frontend.auth.login-register');
});

Route::post('get-cities-by-state', [CountryStateCityController::class, 'getCity']);

// emergency
Route::get('login-register', [AuthController::class, 'loginRegister'])->name('loginRegister');
Route::get('franchise-login', [AuthController::class, 'login'])->name('login');
Route::post('post-login', [AuthController::class, 'postLogin'])->name('login.post');
Route::post('forgot-password', [AuthController::class, 'sendResetLink'])
    ->middleware('throttle:5,1')
    ->name('password.email');
Route::get('reset-password/{token}', [AuthController::class, 'showResetPassword'])
    ->name('password.reset');
Route::post('reset-password', [AuthController::class, 'resetPassword'])
    ->middleware('throttle:5,1')
    ->name('password.update');
Route::get('franchise-registration', [AuthController::class, 'registration'])->name('register');
Route::post('post-registration', [AuthController::class, 'postRegistration'])->name('register.post');
Route::get('student-login', [AuthController::class, 'studentLogin'])->name('student.login');
Route::post('post-student-login', [AuthController::class, 'poststudentLogin'])->name('studentlogin.post');



// Route::get('dashboard', [AuthController::class, 'dashboard']);
Route::get('logout', [AuthController::class, 'logout'])->name('logout');

Route::get('/', [CommonController::class, 'index'])->name('index');
Route::get('index', [CommonController::class, 'index'])->name('index');



Route::get('our-team', [CommonController::class, 'ourTeam'])->name('ourTeam');
Route::get('video-assembly', [CommonController::class, 'videoAssembly'])->name('videoAssembly');
Route::get('video', [CommonController::class, 'videoList'])->name('videoList');

Route::get('latest-photos', [CommonController::class, 'latestPhotos'])->name('latestPhotos');
Route::get('event', [CommonController::class, 'latestEvents'])->name('latestEvents');



// Route::get('about', [CommonController::class, 'aboutUs'])->name('about');
Route::get('why-choose-us', [CommonController::class, 'whyChooseUs'])->name('whyChooseUs');

Route::get('manufacturing-marketing', [CommonController::class, 'manufacturingMarketing'])->name('manufacturingMarketing');
Route::get('certificate', [CommonController::class, 'certificate'])->name('certificate');
Route::get('enquiry', [CommonController::class, 'enquiry'])->name('enquiry');
Route::get('career', [CommonController::class, 'career'])->name('career');
Route::post('storeCareerData', [CommonController::class, 'storeCareerData'])->name('home.storeCareerData');
Route::get('contact-us', [CommonController::class, 'contact_us'])->name('contact');
Route::get('complain', [CommonController::class, 'complain'])->name('complain');
Route::get('tender', [CommonController::class, 'tender'])->name('tender');
// Route::get('event', [CommonController::class, 'event'])->name('event');
Route::post('contact/enquiry', [CommonController::class, 'postContactEnquiry'])->name('contact.enquiry');
Route::post('postOnlineEnquiry', [CommonController::class, 'postOnlineEnquiry'])->name('enq.postOnlineEnquiry');
Route::post('homePageEnquiry', [CommonController::class, 'homePageEnquiry'])->name('enq.homePageEnquiry');
Route::post('poststoreComplain', [CommonController::class, 'storeComplain'])->name('enq.poststoreComplain');
Route::post('studentOnlineEnquiry', [CommonController::class, 'studentOnlineEnquiry'])->name('enq.studentOnlineEnquiry');
Route::get('therapies', [CommonController::class, 'therapies'])->name('therapies');
Route::get('photo-gallery', [CommonController::class, 'photoGallery'])->name('photoGallery');
// Route::get('video-gallery', [CommonController::class, 'videoGallery'])->name('videoGallery');
Route::get('gallery/{slug}', [CommonController::class, 'photoGalleryDetails'])->name('photoGalleryDetails');


Route::get('mission-vission', [CommonController::class, 'mission'])->name('mission-vission');
Route::get('partners', [CommonController::class, 'partner'])->name('partners');
// Route::get('awards', [CommonController::class, 'awards'])->name('awards');
Route::get('clients', [CommonController::class, 'clients'])->name('clients');
Route::get('straitegic-alliances', [CommonController::class, 'straitegicAlliances'])->name('straitegic-alliances');

Route::get('industry/{slug}', [CommonController::class, 'industry'])->name('industry.slug');

Route::get('news', [CommonController::class, 'newsListing'])->name('news');
Route::get('news/{slug}', [CommonController::class, 'newsSlugListing'])->name('news.slug');
Route::get('news_detail/{slug}', [CommonController::class, 'newsDetail'])->name('news.detail');

Route::get('events', [CommonController::class, 'eventListing'])->name('events');
Route::get('events/{slug}', [CommonController::class, 'eventSlugListing'])->name('events.slug');
Route::get('event_detail/{slug}', [CommonController::class, 'eventDetail'])->name('events.detail');

Route::get('blogs', [CommonController::class, 'blogListing'])->name('blogs');
Route::get('blogs/{slug}', [CommonController::class, 'blogSlugListing'])->name('blogs.slug');
// Route::get('blog_detail/{slug}', [CommonController::class, 'blogDetail'])->name('blog.detail');
Route::get('blog/blog-detail/{slug}', [CommonController::class, 'blogDetail'])->name('blog.detail');
Route::post('blog/store_comment', [CommonController::class, 'storeBlogComment'])->name('blog.store_comment');
Route::get('blog/show_comments', [CommonController::class, 'showBlogComments'])->name('blog.show_comments');

// Route::get('service/{slug}', [ServiceController::class, 'index'])->name('service.slug');

Route::get('case-study', [CommonController::class, 'caseStudyListing'])->name('case-study');
Route::get('case-study-detail/{slug}', [CommonController::class, 'caseStudyDetail'])->name('case-study.detail');
Route::get('csr', [CommonController::class, 'csr'])->name('csr');

Route::get('career-details', [CommonController::class, 'careerDetails'])->name('career-details');
// Route::post('career/enquiry', [CommonController::class, 'storeCareerData'])->name('career.enquiry');
Route::get('faqs', [CommonController::class, 'faqs'])->name('faqs');
Route::get('videos', [CommonController::class, 'videos'])->name('videos');
// Route::get('projects', [CommonController::class, 'projects'])->name('projects');
Route::get('gallery', [CommonController::class, 'galleries'])->name('gallery');
Route::get('testimonial', [CommonController::class, 'testimonial'])->name('testimonial');
Route::get('team-details/{id}', [CommonController::class, 'teamDetails'])->name('teamDetails');
Route::get('clients', [CommonController::class, 'ourClients'])->name('ourClients');
// Route::get('awards', [CommonController::class, 'awards'])->name('awards');
Route::get('profile', [CommonController::class, 'profile'])->name('profile');


Route::post('store/subscriber', [CommonController::class, 'postNewsletter'])->name('store.subscriber');

Route::get('product/{slug}', [ProductController::class, 'productDetails'])->name('productDetail.slug');

Route::post('showPricingDetails', [ProductController::class, 'showPricingDetails'])->name('home.showPricingDetails');
Route::post('showFaqList', [ServiceController::class, 'showFaqList'])->name('home.showFaqList');


Route::get('service/{slug}', [ServiceController::class, 'serviceDetails'])->name('serviceDetails.slug');

Route::get('privacy-policy', [CommonController::class, 'privacyPolicy'])->name('privacyPolicy');

Route::get('terms-condition', [CommonController::class, 'termsCondition'])->name('termsCondition');
Route::get('disclaimer', [CommonController::class, 'disclaimer'])->name('disclaimer');
Route::get('refund-policy', [CommonController::class, 'refundPolicy'])->name('refundPolicy');
Route::get('get-quote', [CommonController::class, 'getQuote'])->name('getQuote');
Route::get('schedule-meeting', [CommonController::class, 'scheduleMeeting'])->name('scheduleMeeting');
Route::post('postQuoteData', [CommonController::class, 'postQuoteData'])->name('postQuoteData');
Route::post('storeScheduleMeetings', [CommonController::class, 'storeScheduleMeetings'])->name('storeScheduleMeetings');
Route::post('storePricingEnquiry', [CommonController::class, 'storePricingEnquiry'])->name('storePricingEnquiry');


Route::get('latest-publication', [CommonController::class, 'latestPubilcation'])->name('latestPubilcation');
Route::get('latest-publication/{slug}', [CommonController::class, 'publicationDetails'])->name('publication.details');
Route::get('latest-publication/{slug}/download/{file}', [CommonController::class, 'downloadPublicationFile'])->whereNumber('file')->name('publication.download');

Route::group(['prefix' => 'customer', 'middleware' => ['CustomerAuthCheck'], 'as' => 'customer.'], function () {
    Route::get('/dashboard', [CustomerController::class, 'dashboard'])->name('dashboard');
    Route::get('/account-settings', [CustomerController::class, 'accountSetting'])->name('accountSetting');
    Route::post('/updateCustomerProfileDetails', [CustomerController::class, 'updateCustomerProfileDetails'])->name('updateCustomerProfileDetails');
    Route::post('/updateCustomerPassword', [CustomerController::class, 'updateCustomerPassword'])->name('updateCustomerPassword');
    Route::post('/update-profile-photo', [CustomerController::class, 'updateProfilePhoto'])->name('update.profile.photo');

    Route::get('/add-post', [CustomerController::class, 'addPost'])->name('addPost');
    Route::get('/posts', [CustomerController::class, 'posts'])->name('posts.index');
    Route::post('/posts/start', [CustomerController::class, 'startPost'])->name('posts.start');
    Route::get('/posts/{post}/submission', [CustomerController::class, 'editPostSubmission'])->name('posts.submission');
    Route::post('/posts/{post}/submission', [CustomerController::class, 'savePostSubmission'])->name('posts.save');
    Route::get('/posts/{post}/complete', [CustomerController::class, 'postComplete'])->name('posts.complete');

    Route::get('/customer-logout', [CustomerController::class, 'customerLogout'])->name('customerLogout');


});
