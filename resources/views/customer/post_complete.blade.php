@extends('frontend.layouts.master')
@section('title') Submission Complete @endsection
@section('content')
<section class="common-banner">
    <div class="container">
        <div class="row">
            <div class="common-banner__content text-center">
                <h2 class="title-animation">Post Submission Complete</h2>
            </div>
        </div>
    </div>
    <div class="banner-bg">
        <img src="{{ static_asset('assets/assets_web/images/volunteer-bg.png') }}" alt="">
    </div>
</section>
<div class="member_dash_wrapper complete-dashboard-wrapper">
    @include('customer.partials.left_bar')
    <div class="member_dash_content">
        <div class="complete-page">
            <div class="complete-card">
                <div class="success-mark"><i class="fa-solid fa-check"></i></div>
                <span class="status-pill">Successfully submitted</span>
                <h1>Thank you for your submission!</h1>
                <p class="complete-lead">Your post has been sent to our editorial team for review. You can return anytime to review the submitted information.</p>

                <div class="submission-summary">
                    <div class="summary-icon"><i class="fa-regular fa-file-lines"></i></div>
                    <div class="summary-main">
                        <small>SUBMISSION #{{ str_pad($post->id, 5, '0', STR_PAD_LEFT) }}</small>
                        <h2>{{ $post->title }}</h2>
                        <span>{{ $post->section }}</span>
                    </div>
                    <div class="summary-date"><small>Submitted on</small><strong>{{ optional($post->submitted_at)->format('d M Y') ?? now()->format('d M Y') }}</strong></div>
                </div>

                <div class="review-note">
                    <i class="fa-regular fa-clock"></i>
                    <div><strong>What happens next?</strong><p>Our editorial team will review your submission. You will be contacted using your registered email if any additional information is required.</p></div>
                </div>

                <div class="complete-actions">
                    <a class="complete-primary" href="{{ route('customer.posts.submission',$post) }}"><i class="fa-regular fa-eye"></i> Review submission</a>
                    <a class="complete-secondary" href="{{ route('customer.addPost') }}"><i class="fa-solid fa-plus"></i> Create new post</a>
                </div>
                <a class="dashboard-link" href="{{ route('customer.dashboard') }}"><i class="fa-solid fa-arrow-left"></i> Return to dashboard</a>
            </div>
        </div>
    </div>
</div>
<style>
.complete-dashboard-wrapper{align-items:flex-start}.complete-dashboard-wrapper .member_dash_content{min-width:0}.complete-dashboard-wrapper .member_dash_menu a[href="{{ route('customer.addPost') }}"]{background:#168092;color:#fff}.complete-page{min-height:720px;background:linear-gradient(145deg,#edf5f5 0%,#eef1f3 60%,#f7f9f9 100%);padding:55px 24px}.complete-card{max-width:760px;margin:auto;background:#fff;border:1px solid #dce5e6;border-radius:12px;padding:48px 55px;text-align:center;box-shadow:0 15px 40px rgba(32,67,73,.08)}.success-mark{width:76px;height:76px;margin:0 auto 18px;border-radius:50%;display:grid;place-items:center;background:#168092;color:#fff;font-size:32px;box-shadow:0 0 0 10px #e5f3f4}.status-pill{display:inline-block;margin-top:10px;padding:6px 13px;border-radius:20px;background:#e7f6ee;color:#17734a;font-size:12px;font-weight:800;text-transform:uppercase;letter-spacing:.05em}.complete-card h1{margin:18px 0 10px;color:#263b40;font-size:30px}.complete-lead{max-width:590px;margin:0 auto 30px;color:#68777b;line-height:1.7}.submission-summary{display:grid;grid-template-columns:50px minmax(0,1fr) auto;gap:15px;align-items:center;padding:22px;text-align:left;border:1px solid #dce4e5;border-radius:8px;background:#fbfcfc}.summary-icon{width:48px;height:48px;border-radius:7px;display:grid;place-items:center;background:#e6f3f5;color:#168092;font-size:22px}.summary-main{min-width:0}.summary-main small,.summary-date small{display:block;color:#899497;font-size:10px;font-weight:800;letter-spacing:.08em}.summary-main h2{margin:4px 0;color:#293e43;font-size:17px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}.summary-main span{color:#168092;font-size:12px;font-weight:700}.summary-date{text-align:right}.summary-date strong{display:block;margin-top:5px;color:#364b50;font-size:13px}.review-note{display:flex;gap:15px;margin:22px 0 28px;padding:18px 20px;text-align:left;border-radius:7px;background:#f0f7f8;color:#496167}.review-note>i{margin-top:3px;color:#168092;font-size:20px}.review-note strong{color:#29444a}.review-note p{margin:4px 0 0;font-size:13px;line-height:1.55}.complete-actions{display:flex;justify-content:center;gap:12px}.complete-primary,.complete-secondary{display:inline-flex;align-items:center;gap:8px;padding:12px 20px;border:1px solid #168092;border-radius:5px;font-weight:800}.complete-primary{background:#168092;color:#fff}.complete-primary:hover{color:#fff;background:#106c79}.complete-secondary{background:#fff;color:#168092}.dashboard-link{display:inline-block;margin-top:24px;color:#647579;font-size:13px}.dashboard-link i{margin-right:6px}@media(max-width:700px){.complete-page{padding:30px 10px}.complete-card{padding:35px 20px}.submission-summary{grid-template-columns:45px 1fr}.summary-date{grid-column:2;text-align:left}.complete-actions{flex-direction:column}.complete-actions a{justify-content:center}.complete-card h1{font-size:25px}}
</style>
@endsection
