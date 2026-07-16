@extends('frontend.layouts.master')
@section('title') My Submissions @endsection
@section('content')
<section class="common-banner">
    <div class="container"><div class="row"><div class="common-banner__content text-center"><h2 class="title-animation">My Submissions</h2></div></div></div>
    <div class="banner-bg"><img src="{{ static_asset('assets/assets_web/images/volunteer-bg.png') }}" alt=""></div>
</section>
<div class="member_dash_wrapper customer-posts-wrapper">
    @include('customer.partials.left_bar')
    <div class="member_dash_content">
        <div class="customer-posts-page">
            <div class="posts-heading">
                <div><span>Customer dashboard</span><h1>Your Submissions</h1><p>View the current status or continue editing any submission.</p></div>
                <a href="{{ route('customer.addPost') }}" class="new-post-btn"><i class="fa-solid fa-plus"></i> New Submission</a>
            </div>

            <div class="posts-grid">
                @forelse($posts as $post)
                    @php
                        $statusClass = in_array($post->status, ['approved','rejected','submitted']) ? $post->status : 'draft';
                        $statusLabel = ['submitted'=>'Under review','approved'=>'Approved','rejected'=>'Rejected','draft'=>'Draft'][$post->status] ?? ucfirst($post->status);
                    @endphp
                    <article class="submission-card">
                        <header><span class="status status--{{ $statusClass }}">{{ $statusLabel }}</span><small>#{{ $post->id }}</small></header>
                        <div class="submission-card__body">
                            <span class="section-name">{{ $post->section }}</span>
                            <h2>{{ $post->title }}</h2>
                            <div class="submission-meta">
                                <span><i class="fa-regular fa-calendar"></i> Updated {{ $post->updated_at->format('d M Y') }}</span>
                                <span><i class="fa-solid fa-paperclip"></i> {{ count($post->files ?? []) }} files</span>
                            </div>
                        </div>
                        <footer>
                            <a href="{{ route('customer.posts.submission', $post) }}" class="view-btn"><i class="fa-regular fa-eye"></i> View Submission</a>
                            <a href="{{ route('customer.posts.submission', $post) }}" class="edit-btn"><i class="fa-regular fa-pen-to-square"></i> Edit Submission</a>
                        </footer>
                    </article>
                @empty
                    <div class="empty-posts"><i class="fa-regular fa-file-lines"></i><h2>No submissions yet</h2><p>Create your first submission to get started.</p><a href="{{ route('customer.addPost') }}" class="new-post-btn">Create Submission</a></div>
                @endforelse
            </div>
            @if($posts->hasPages())<div class="posts-pagination">{{ $posts->links() }}</div>@endif
        </div>
    </div>
</div>
<style>
.customer-posts-wrapper{align-items:flex-start}.customer-posts-wrapper .member_dash_content{min-width:0}.customer-posts-wrapper .member_dash_menu a[href="{{ route('customer.posts.index') }}"]{background:#168092;color:#fff}.customer-posts-page{min-height:700px;padding:42px;background:#eef2f3;color:#30464b}.posts-heading{display:flex;align-items:center;justify-content:space-between;gap:20px;margin-bottom:28px}.posts-heading span,.section-name{color:#168092;font-size:11px;font-weight:800;letter-spacing:.08em;text-transform:uppercase}.posts-heading h1{margin:5px 0;font-size:29px}.posts-heading p{margin:0;color:#738286}.new-post-btn,.view-btn,.edit-btn{display:inline-flex;align-items:center;justify-content:center;gap:7px;border-radius:5px;padding:11px 15px;font-weight:800}.new-post-btn,.edit-btn{background:#168092;color:#fff}.new-post-btn:hover,.edit-btn:hover{color:#fff;background:#106c79}.posts-grid{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:18px}.submission-card{display:flex;flex-direction:column;min-width:0;border:1px solid #dbe3e5;border-radius:9px;background:#fff;box-shadow:0 8px 24px rgba(36,66,72,.05);overflow:hidden}.submission-card>header{display:flex;justify-content:space-between;align-items:center;padding:15px 19px;border-bottom:1px solid #e6ebec}.submission-card>header small{color:#8a979a}.status{padding:5px 10px;border-radius:20px;font-size:10px;font-weight:800;text-transform:uppercase}.status--draft{background:#edf0f1;color:#5f6d70}.status--submitted{background:#e7f3fa;color:#17668e}.status--approved{background:#e7f6ee;color:#17734a}.status--rejected{background:#fdebec;color:#a52a36}.submission-card__body{flex:1;padding:20px}.submission-card h2{margin:7px 0 18px;color:#293f44;font-size:18px;line-height:1.4}.submission-meta{display:flex;flex-wrap:wrap;gap:15px;color:#7a878a;font-size:12px}.submission-meta i{margin-right:4px;color:#168092}.submission-card>footer{display:flex;gap:9px;padding:15px 19px;border-top:1px solid #e6ebec;background:#fafcfc}.submission-card>footer a{flex:1;font-size:12px}.view-btn{border:1px solid #168092;color:#168092;background:#fff}.empty-posts{grid-column:1/-1;padding:70px 25px;border:1px dashed #c7d2d4;border-radius:9px;background:#fff;text-align:center}.empty-posts>i{font-size:42px;color:#168092}.empty-posts h2{margin:15px 0 5px}.empty-posts p{margin-bottom:20px;color:#778589}.posts-pagination{margin-top:25px}@media(max-width:850px){.posts-grid{grid-template-columns:1fr}.customer-posts-page{padding:25px 15px}.posts-heading{align-items:flex-start;flex-direction:column}.submission-card>footer{flex-direction:column}}
</style>
@endsection
