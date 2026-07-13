@extends('frontend.layouts.master')
@section('title') Mission & Vission @endsection
@section('content')

<section class="common-banner">
    <div class="container">
        <div class="row">
            <div class="common-banner__content text-center">
                <h2 class="title-animation">Mission & Vission</h2>
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
                            <img src="{{ static_asset('assets/assets_web/images/visionm.png') }}" alt="Image">
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-7">
                <div class="difference-three__content">
                    <div class="section__content">

                        <h2 class="title-animation">Aim & Vision
                        </h2>
                        <p class="home1"> <strong>Anikrishna Shodh Darpan (AKSD) </strong> </p>
                        <p class="home2">aims to promote high-quality, ethical, and impactful research by integrating
                            traditional knowledge systems with contemporary academic disciplines. The journal is
                            committed to advancing original research that contributes to national and global academic
                            discourse.
                            AKSD envisions becoming a globally recognized scholarly platform that bridges<strong>
                                bharatiya gnan
                                parampara</strong> and <strong>modern scientific inquiry</strong>, fostering inclusive,
                            sustainable, and
                            interdisciplinary research.

                        </p>
                        <h2 class="title-animation">Scope of the Journal
                        </h2>
                        <p class="home2"> AKSD publishes original, unpublished research papers, review articles, and
                            conceptual studies in the following areas:<br><br>
                            ● Education & Teacher Education<br>
                            ● Indian Knowledge Systems (IKS)<br>
                            ● Social Sciences & Humanities<br>
                            ● Environmental Studies & Sustainability<br>
                            ● Health Sciences & Well-Being<br>
                            ● Agriculture & Rural Development<br>
                            ● Philosophy, Ethics & Cultural Studies<br>
                            ● Management, Policy & Development Studies<br>
                            ● Interdisciplinary and Multidisciplinary Research<br>

                        </p>

                    </div>

                </div>
            </div>
        </div>
    </div>
</section>



@endsection
