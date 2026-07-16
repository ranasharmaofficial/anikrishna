@extends('frontend.layouts.master')
@section('title') Home @endsection

@section('meta_tags')

@endsection
@section('content')

    <!-- ==== search popup start ==== -->
<div class="search-popup">
    <button class="close-search" aria-label="close search box" title="close search box">
        <i class="fa-solid fa-xmark"></i>
    </button>
    <form action="#" method="post">
        <div class="search-popup__group">
            <input type="text" name="search-field" id="searchField" placeholder="Search...." required>
            <button type="submit" aria-label="search products" title="search products">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </div>
    </form>
</div>
<!-- ==== / search popup end ==== -->
<!-- ==== off canvas start ==== -->
<div class="off-canvas d-none d-xl-block">
    <div class="off-canvas__inner">
        <div class="off-canvas__head">
            <a href="{{ url('') }}">
                <img src="{{ static_asset('assets/assets_web/images/log.png') }}" alt="Logo">
            </a>
            <button aria-label="close off canvas" class="off-canvas-close">
                <i class="fa-solid fa-xmark"></i>
            </button>
        </div>
        <div class="offcanvas__search">
            <form action="#">
                <input type="text" placeholder="What are you searching for?" required>
                <button type="submit">
                    <i class="icon-search"></i>
                </button>
            </form>
        </div>
        <div class="off-canvas__contact">
            <h5>Contact Info</h5>
            <div class="single">
                <span>
                    <i class="fa-solid fa-phone-volume"></i>
                </span>
                <a href="+91-92644-58499">+91-92644-58499</a>
            </div>
            <div class="single">
                <span>
                    <i class="fa-solid fa-envelope"></i>
                </span>
                <a href="anikrishnasodhdarpan@tnafoundation.org">anikrishnasodhdarpan@tnafoundation.org</a>
            </div>
            <div class="single">
                <span>
                    <i class="fa-solid fa-location-dot"></i>
                </span>
                <a target="_blank" href="https://maps.app.goo.gl/aGWh2fTkugWpUzfV7">
                    Bihar, Patna
                </a>
            </div>
        </div>
        <div class="social">
            <a href="https://www.facebook.com/" target="_blank" aria-label="share us on facebook" title="facebook">
                <i class="fa-brands fa-facebook-f"></i>
            </a>
            <a href="https://x.com/" target="_blank" aria-label="share us on twitter" title="twitter">
                <i class="fa-brands fa-x-twitter"></i>
            </a>
            <a href="https://www.linkedin.com/" target="_blank" aria-label="share us on linkedin" title="linkedin">
                <i class="fa-brands fa-linkedin-in"></i>
            </a>
        </div>
    </div>
</div>
<div class="off-canvas-backdrop"></div>
<!-- ==== / off canvas end ==== -->
<!-- ==== banner section start ==== -->
<section class="banner-two">
    <div class="banner-two__slider swiper">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <div class="banner-two__slider-single">
                    <div class="banner-two__slider-bg" data-background="{{ static_asset('assets/assets_web/images/slide0.jpeg') }}">
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-12 col-md-9 col-lg-7 col-xxl-6">
                                <div class="banner-two__slider-content">

                                    <h1>Anikrishna <br>
                                        Sodh<span class="bottom-line">Darpan</span>

                                    </h1>
                                    <div class="banner__content-cta cta">
                                        <a href="home.php" class="btn--secondary d-none d-md-flex">Read More <i
                                                class="fa-solid fa-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="banner-two__slider-single">
                    <div class="banner-two__slider-bg" data-background="{{ static_asset('assets/assets_web/images/slide0.jpeg') }}">
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-12 col-md-9  col-lg-7 col-xxl-6">
                                <div class="banner-two__slider-content">

                                    <h1>Anikrishna <br>
                                        Sodh<span class="bottom-line">Darpan</span>

                                    </h1>
                                    <div class="banner__content-cta cta">
                                        <a href="{{ url('about') }}" class="btn--secondary d-none d-md-flex">Read More <i
                                                class="fa-solid fa-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="banner-two__slider-single">
                    <div class="banner-two__slider-bg" data-background="{{ static_asset('assets/assets_web/images/slide0.jpeg') }}">
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-12 col-md-9 col-lg-7 col-xxl-6">
                                <div class="banner-two__slider-content">

                                    <h1>Anikrishna <br>
                                        Sodh<span class="bottom-line">Darpan</span>

                                    </h1>
                                    <div class="banner__content-cta cta">
                                        <a href="home.php" class="btn--secondary d-none d-md-flex">Read More <i
                                                class="fa-solid fa-arrow-right"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="swiper-slide">
                <div class="banner-two__slider-single">
                    <div class="banner-two__slider-bg" data-background="{{ static_asset('assets/assets_web/images/slide.jpeg') }}">
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-12 col-md-9 col-lg-7 col-xxl-6">
                                <div class="banner-two__slider-content">

                                    <h1>Anikrishna <br>
                                        Sodh<span class="bottom-line">Darpan</span>

                                    </h1>
                                    <div class="banner__content-cta cta">
                                        <a href="home.php" class="btn--secondary d-none d-md-flex">Read More <i
                                                class="fa-solid fa-arrow-right"></i></a>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="slider-navigation d-none d-md-flex">
        <button type="button" aria-label="prev slide" title="prev slide" class="prev-banner slider-btn">
            <i class="fa-solid fa-arrow-left"></i>
        </button>
        <button type="button" aria-label="next slide" title="next slide" class="next-banner slider-btn slider-btn-next">
            <i class="fa-solid fa-arrow-right"></i>
        </button>
    </div>


</section>
<!-- ==== / banner section end ==== -->

<!-- ==== difference section start ==== -->
<section class="difference-three">
    <div class="container">
        <div class="row align-items-justify">
            <div class="col-12 col-lg-5">
                <div class="difference-three__thumb d-none d-lg-block">
                    <div class="difference-three__thumb-inner">
                        <div class="thumb-lg" data-aos="fade-right" data-aos-duration="1000">
                            <img src="{{ static_asset('assets/assets_web/images/index.png') }}" alt="Image">
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-7">
                <div class="difference-three__content">
                    <div class="section__content">

                        <h2 class="title-animation">Anikrishna Shodh Darpan
                        </h2>
                        <p class="home1"> <strong>A Multidisciplinary, Biannual, Double-Blind Peer-Reviewed
                                International Research Journal</strong> </p>
                        <p class="home2"> <strong>Anikrishna Shodh Darpan (ASD)</strong> is an
                            international
                            peer-reviewed
                            research
                            journal dedicated to the promotion and dissemination of high–quality
                            scholarly
                            research
                            across diverse academic disciplines. The journal serves as a global platform
                            for
                            researchers, academicians, educators, scholars, and professionals to publish
                            original,
                            innovative, and impactful research that contributes to the advancement of
                            knowledge.
                        </p>
                        <p class="home2"> The journal promotes multidisciplinary and interdisciplinary
                            research,
                            encouraging
                            the
                            integration of ideas from education, social sciences, humanities, science
                            and
                            technology,
                            management, psychology, environmental studies, and Indian Knowledge Systems.
                            AKSD
                            aims to
                            strengthen academic dialogue and scholarly collaboration at national and
                            international
                            levels.
                        </p>

                        <p class="home2">
                            All manuscripts submitted to the journal undergo a rigorous
                            <strong>double-blind peer-review process</strong>, ensuring impartial
                            evaluation,
                            originality, academic rigor, and relevance. The journal strictly follows
                            internationally
                            accepted standards of research ethics, transparency, and publication
                            integrity.
                        </p>
                    </div>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- ==== / difference section end ==== -->

<!-- ==== team section start ==== -->
<section class="team">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-10 col-xl-6">
                <div class="section__header text-center" data-aos="fade-up" data-aos-duration="1000">

                    <h2 class="title-animation">Meet Our Team
                    </h2>
                </div>
            </div>
        </div>
        <div class="row gutter-40 justify-content-center">
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="team__single-wrapper" data-aos="fade-up" data-aos-duration="1000">
                    <div class="team__single van-tilt">
                        <div class="team__single-thumb">
                            <a href="team-details.html">
                                <img src="{{ static_asset('assets/assets_web/images/01.jpg') }}" alt="Image">
                            </a>
                            <div class="team__icons">


                            </div>
                        </div>
                        <div class="team__single-content">
                            <h6 class="h6">Dr. Krishna Murari Agrawal</h6>
                            <h5 class="h5">Chief Patron</h5>
                            <p>TNA Foundation, Patna, Bihar</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="team__single-wrapper" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="300">
                    <div class="team__single van-tilt">
                        <div class="team__single-thumb">
                            <a href="team-details.html">
                                <img src="{{ static_asset('assets/assets_web/images/02.jpg') }}" alt="Image">
                            </a>

                        </div>
                        <div class="team__single-content">
                            <h6 class="h6">Smt. Anita Krishna</h6>
                            <h5 class="h5">Patron</h5>
                            <p>TNA Foundation, Patna, Bihar
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="team__single-wrapper" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="600">
                    <div class="team__single van-tilt">
                        <div class="team__single-thumb">
                            <a href="team-details.html">
                                <img src="{{ static_asset('assets/assets_web/images/03.jpg') }}" alt="Image">
                            </a>

                        </div>
                        <div class="team__single-content">
                            <h6 class="h6">Dr. Abhishekh Kumar Pandey</h6>
                            <h5 class="h5">Editor-in-Chief</h5>
                            <p>TNA Foundation, Motihari, Bihar
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="team__single-wrapper" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="900">
                    <div class="team__single van-tilt">
                        <div class="team__single-thumb">
                            <a href="team-details.html">
                                <img src="{{ static_asset('assets/assets_web/images/04.jpg') }}" alt="Image">
                            </a>

                        </div>
                        <div class="team__single-content">
                            <h6 class="h6">Dr. Rahul Kumar Pandey</h6>
                            <h5 class="h5">Executive Editor-in-Chief</h5>
                            <p>TNA Foundation, Ara, Bihar
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="team__single-wrapper" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="900">
                    <div class="team__single van-tilt">
                        <div class="team__single-thumb">
                            <a href="team-details.html">
                                <img src="{{ static_asset('assets/assets_web/images/05.jpeg') }}" alt="Image">
                            </a>

                        </div>
                        <div class="team__single-content">
                            <h6 class="h6">Prof. (Dr.) Nayan Ranjan Sinha</h6>
                            <h5 class="h5">Associate Chief Editor</h5>
                            <p>TNA Foundation, Patna, Bihar</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="team__single-wrapper" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="900">
                    <div class="team__single van-tilt">
                        <div class="team__single-thumb">
                            <a href="team-details.html">
                                <img src="{{ static_asset('assets/assets_web/images/06.jpeg') }}" alt="Image">
                            </a>

                        </div>
                        <div class="team__single-content">
                            <h6 class="h6">Ms. Akanksha Singh</h6>
                            <h5 class="h5">Managing Chief Editor</h5>
                            <p>TNA Foundation, Patna, Bihar</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="section__cta cta text-center">
                    <a href="#" aria-label="our team" title="our team" class="btn--primary">View All
                        <i class="fa-solid fa-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>

</section>
<!-- ==== / team section end ==== -->
@endsection
