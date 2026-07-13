@extends('frontend.layouts.master')
@section('title') Why AKSD @endsection
@section('content')


<section class="common-banner">
    <div class="container">
        <div class="row">
            <div class="common-banner__content text-center">
                <h2 class="title-animation">Why AKSD</h2>
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

                        <h2 class="title-animation">WHY AKSD
                        </h2>
                        <p class="home1"> <strong>Why Anikrishna Shodh Darpan (AKSD)</strong> </p>
                        <p class="home2"> ●&nbsp;A Multidisciplinary,<br>
                            ●&nbsp;Bilingual,<br>
                            ●&nbsp; Biannual, <br>
                            ●&nbsp; Double-Blind Peer-Reviewed International Research Journal.
                        </p>

                    </div>

                </div>
            </div>
        </div>
    </div>
</section>


@endsection
