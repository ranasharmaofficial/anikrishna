@extends('frontend.layouts.master')
@section('title') Latest Publications @endsection
@section('content')
<section class="common-banner">
    <div class="container">
        <div class="common-banner__content text-center">
            <h2 class="title-animation">Latest Publications</h2>
        </div>
    </div>
    <div class="banner-bg"><img src="{{ static_asset('assets/assets_web/images/volunteer-bg.png') }}" alt=""></div>
</section>
<section class="publication-page">
    <div class="publication-container">
        <div class="publication-filter">
            <form method="get">
                <div class="pub-search"><i class="fa-solid fa-magnifying-glass"></i><input name="search" value="{{ request('search') }}" placeholder="Search title or keyword"></div><select name="section">
                    <option value="">All Sections</option>
                    @foreach($sections as $section)
                        <option @selected(request('section')===$section)>{{ $section }}</option>
                    @endforeach
                </select><button>Search</button><a href="{{ route('latestPubilcation') }}">Reset</a>
            </form>
        </div>
        <div class="publication-grid">
            <main>
                @forelse($publications as $publication)<article class="publication-card">@if($publication->featured_image)<a class="pub-cover" href="{{ route('publication.details',$publication->slug) }}"><img src="{{ $publication->featured_image_url }}" alt="{{ $publication->title }}"></a>@endif<div class="pub-card-body">
                        <div class="pub-card-top"><span>{{ $publication->section }}</span><time>{{ optional($publication->published_date)->format('d M Y') ?? optional($publication->published_at)->format('d M Y') }}</time></div>
                        <h2><a href="{{ route('publication.details',$publication->slug) }}">{{ $publication->title }}</a></h2>
                        <p>{{ $publication->excerpt ?: Str::limit(strip_tags($publication->abstract),190) }}</p>
                        <div class="pub-authors"><i class="fa-regular fa-user"></i> @forelse($publication->contributors??[] as $c)<span>{{ $c['public_name'] ?? trim(($c['given']??'').' '.($c['family']??'')) }}@if(!$loop->last), @endif</span>@empty<span>{{ $publication->user->first_name ?? 'Author' }}</span>@endforelse</div>
                        <div class="pub-card-footer">
                            <div><span><i class="fa-regular fa-eye"></i> {{ $publication->abstract_views }}</span><span><i class="fa-solid fa-download"></i> {{ $publication->download_count }}</span>@if($publication->page_range)<span>Pages {{ $publication->page_range }}</span>@endif</div><a href="{{ route('publication.details',$publication->slug) }}">Read publication <i class="fa-solid fa-arrow-right"></i></a>
                        </div>
                    </div>
                </article>@empty<div class="publication-empty"><i class="fa-regular fa-folder-open"></i>
                    <h3>No publications found</h3>
                    <p>Approved publications will appear here.</p>
                </div>@endforelse
                {{ $publications->withQueryString()->links() }}</main>
            <aside>
                <div class="latest-box">
                    <h3><i class="fa-solid fa-book-open"></i> Recent Publications</h3>@forelse($latestPublications as $latest)<a href="{{ route('publication.details',$latest->slug) }}"><strong>{{ Str::limit($latest->title,75) }}</strong><span>{{ optional($latest->published_date)->format('M Y') ?? optional($latest->published_at)->format('M Y') }} · {{ $latest->download_count }} downloads</span></a>@empty<p>No publications yet.</p>@endforelse
                </div>
            </aside>
        </div>
    </div>
</section>
<style>
    .publication-page {
        padding: 65px 20px;
        background: #f2f5f6
    }

    .publication-container {
        max-width: 1180px;
        margin: auto
    }

    .publication-filter {
        padding: 18px;
        margin-bottom: 25px;
        border: 1px solid #dce4e5;
        border-radius: 8px;
        background: #fff
    }

    .publication-filter form {
        display: grid;
        grid-template-columns: minmax(260px, 1fr) 220px auto auto;
        gap: 10px
    }

    .publication-filter input,
    .publication-filter select {
        width: 100%;
        height: 44px;
        border: 1px solid #ccd6d8;
        padding: 9px 12px
    }

    .pub-search {
        position: relative
    }

    .pub-search i {
        position: absolute;
        left: 13px;
        top: 15px;
        color: #879396
    }

    .pub-search input {
        padding-left: 37px
    }

    .publication-filter button,
    .publication-filter form>a {
        display: grid;
        place-items: center;
        border: 0;
        border-radius: 4px;
        padding: 0 18px;
        background: #168092;
        color: #fff;
        font-weight: 700
    }

    .publication-filter form>a {
        background: #eef2f3;
        color: #53666b
    }

    .publication-grid {
        display: grid;
        grid-template-columns: minmax(0, 1fr) 310px;
        gap: 25px
    }

    .publication-card {
        display: flex;
        margin-bottom: 20px;
        border: 1px solid #dce4e5;
        border-radius: 9px;
        background: #fff;
        overflow: hidden;
        box-shadow: 0 5px 18px rgba(31, 65, 70, .05)
    }

    .pub-cover {
        flex: 0 0 210px
    }

    .pub-cover img {
        width: 100%;
        height: 100%;
        object-fit: cover
    }

    .pub-card-body {
        flex: 1;
        min-width: 0;
        padding: 23px
    }

    .pub-card-top {
        display: flex;
        justify-content: space-between;
        color: #829093;
        font-size: 11px
    }

    .pub-card-top span {
        padding: 4px 8px;
        border-radius: 12px;
        background: #e6f3f5;
        color: #14798d;
        font-weight: 800
    }

    .publication-card h2 {
        margin: 14px 0 8px;
        font-size: 21px;
        line-height: 1.35
    }

    .publication-card h2 a {
        color: #263f45
    }

    .publication-card p {
        color: #6d7c80;
        line-height: 1.6
    }

    .pub-authors {
        margin: 15px 0;
        color: #496167;
        font-size: 12px
    }

    .pub-authors i {
        margin-right: 6px;
        color: #168092
    }

    .pub-card-footer {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding-top: 15px;
        border-top: 1px solid #e5e9ea;
        font-size: 12px
    }

    .pub-card-footer>div {
        display: flex;
        gap: 14px;
        color: #78868a
    }

    .pub-card-footer>a {
        color: #168092;
        font-weight: 800
    }

    .latest-box {
        position: sticky;
        top: 110px;
        border: 1px solid #dce4e5;
        border-radius: 8px;
        background: #fff
    }

    .latest-box h3 {
        margin: 0;
        padding: 18px;
        border-bottom: 1px solid #e2e7e8;
        font-size: 17px
    }

    .latest-box h3 i {
        margin-right: 7px;
        color: #168092
    }

    .latest-box>a {
        display: block;
        padding: 16px 18px;
        border-bottom: 1px solid #e8ecec
    }

    .latest-box strong {
        display: block;
        color: #344b50;
        font-size: 13px;
        line-height: 1.45
    }

    .latest-box span {
        display: block;
        margin-top: 6px;
        color: #899598;
        font-size: 10px
    }

    .publication-empty {
        padding: 70px;
        text-align: center;
        background: #fff
    }

    .publication-empty i {
        font-size: 38px;
        color: #168092
    }

    @media(max-width:900px) {
        .publication-grid {
            grid-template-columns: 1fr
        }

        .latest-box {
            position: static
        }

        .publication-filter form {
            grid-template-columns: 1fr 1fr
        }
    }

    @media(max-width:600px) {
        .publication-filter form {
            grid-template-columns: 1fr
        }

        .publication-card {
            display: block
        }

        .pub-cover {
            display: block;
            height: 190px
        }

        .pub-card-footer {
            align-items: flex-start;
            gap: 12px;
            flex-direction: column
        }
    }

</style>@endsection
