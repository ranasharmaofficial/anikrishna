@extends('frontend.layouts.master')
@section('title') Refereed Board @endsection
@section('content')

<section class="common-banner">
    <div class="container">
        <div class="row">
            <div class="common-banner__content text-center">
                <h2 class="title-animation">Managing Board</h2>
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
                            <img src="{{ static_asset('assets/assets_web/images/managing.png') }}" alt="Image">
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-7">
                <div class="difference-three__content">
                    <div class="section__content">

                        <h2 class="title-animation"> Managing Board
                        </h2>

                        <p class="home2"><strong>Tarkeshwar Narayan Agrawal Educational & Social Welfare
                                Foundation,</strong>
                            Patna,
                            Bihar, India
                            <strong>Run by: Bhuvan Malti College of Education,</strong> Motihari, East Champaran, Bihar
                            (India) &
                            <strong>Tarkeshwar Narain Agrawal College of Education,</strong>Ara, Patna, Bihar, (India)
                        </p>

                        <h2 class="title-animation"> Commitment to Quality:
                        </h2>

                        <p class="home2">The Editorial Board of Anikrishna Shodh Darpan comprises experienced
                            academicians and
                            researchers committed to maintaining the highest standards of academic excellence. The
                            journal emphasizes originality, plagiarism-free content, ethical research practices, and
                            transparent editorial processes. Authors, editors, reviewers, and contributors are
                            required
                            to strictly adhere to the journal’s editorial and publication policies.
                            Through its dedication to academic integrity, scholarly rigor, and inclusive knowledge
                            dissemination,<strong> AKSD</strong>, aspires to establish itself as a respected
                            international
                            research
                            journal contributing meaningfully to global academia.</p>

                    </div>

                </div>
            </div>
        </div>
    </div>
</section>



@endsection