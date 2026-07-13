@extends('frontend.layouts.master')
@section('title') Current Issue @endsection
@section('content')

<section class="common-banner">
    <div class="container">
        <div class="row">
            <div class="common-banner__content text-center">
                <h2 class="title-animation">Current Issue</h2>
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
                            <img src="{{ static_asset('assets/assets_web/images/difference/thumb-lg-two.png') }}" alt="Image">
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-7">
                <div class="difference-three__content">
                    <div class="section__content">

                        <h2 class="title-animation">Current Issue<br>
                        </h2>

                        <p class="home2"> <strong>Volume 1, Issue 1 (2025)</strong>July – December, 2025
                        </p>
                        <p class="home2">and
                            empirical studies. The journal welcomes theoretical,
                            applied, and experimental research that demonstrates scholarly depth and methodological
                            soundness.
                        </p>

                    </div>

                </div>
            </div>
        </div>
    </div>
</section>


@endsection
