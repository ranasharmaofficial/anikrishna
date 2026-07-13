@extends('frontend.layouts.master')
@section('title') Reviewer Board @endsection
@section('content')

<section class="common-banner">
    <div class="container">
        <div class="row">
            <div class="common-banner__content text-center">
                <h2 class="title-animation">Reviewer Board</h2>
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

                        <h2 class="title-animation">Reviewer Board
                        </h2>

                        <p class="home2">All submissions undergo a <strong>rigorous double-blind peer-review
                                process</strong>
                            conducted<br>
                            by subject experts. Manuscripts are evaluated on:<br>
                            ● Originality and novelty<br>
                            ● Methodological rigor<br>
                            ● Ethical compliance<br>
                            ● Academic relevance<br>
                            ● Contribution to knowledge<br>

                        </p>

                    </div>

                </div>
            </div>
        </div>
    </div>
</section>


@endsection
