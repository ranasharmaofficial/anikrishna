@extends('frontend.layouts.master')
@section('title') Publication Guidline @endsection
@section('content')

<section class="common-banner">
    <div class="container">
        <div class="row">
            <div class="common-banner__content text-center">
                <h2 class="title-animation">Publication Guidline</h2>
            </div>
        </div>
    </div>
    <div class="banner-bg">
        <img src="{{ static_asset('assets/assets_web/images/volunteer-bg.png') }}" alt="Image">
    </div>
</section>
<section class="difference-three">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-12 col-lg-5">
                <div class="difference-three__thumb d-none d-lg-block">
                    <div class="difference-three__thumb-inner">
                        <div class="thumb-lg" data-aos="fade-right" data-aos-duration="1000">
                            <img src="{{ static_asset('assets/assets_web/images/guid.png') }}" alt="Image">
                        </div>
					</div>
                </div>
            </div>
            <div class="col-12 col-lg-7">
                <div class="difference-three__content">
                    <div class="section__content">

                        <h2 class="title-animation">Author Guidelines<br>
                        </h2>

                        <ul>
                            <li><strong>.&nbsp;Original & plagiarism-free research</strong></li>
                            <li><strong>.&nbsp;Double-blind peer review</strong></li>
                            <li><strong>.&nbsp;APA / MLA format</strong></li>
                            <li><strong>.&nbsp;Word limit: 3000–6000 words</strong></li>
                        </ul>

                    </div>

                </div>
            </div>
        </div>
    </div>
</section>


@endsection
