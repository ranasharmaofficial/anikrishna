@extends('frontend.layouts.master')
@section('title') About Us @endsection
@section('content')
<section class="common-banner">
    <div class="container">
        <div class="row">
            <div class="common-banner__content text-center">
                <h2 class="title-animation">About Us</h2>
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
                            <img src="{{ static_asset('assets/assets_web/images/about (1).png') }}" alt="Image">
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
                        <p class="home2">::before
                            "The journal promotes multidisciplinary and interdisciplinary
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
                            levels."
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


<!-- End of Blog section
  ============================================= -->
@endsection
