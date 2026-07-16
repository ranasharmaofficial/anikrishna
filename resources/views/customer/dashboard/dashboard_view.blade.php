@extends('frontend.layouts.master')
@section('title') Customer Dashboard @endsection

@section('meta_tags')

@endsection
@section('content')


<section class="common-banner">
    <div class="container">
        <div class="row">
            <div class="common-banner__content text-center">
                <h2 class="title-animation">Dashboard</h2>
            </div>
        </div>
    </div>
    <div class="banner-bg">
        <img src="{{ static_asset('assets/assets_web/images/volunteer-bg.png') }}" alt="Image">
    </div>
</section>
<style>
    
</style>

<div class="member_dash_wrapper">

    <!-- Sidebar -->
    @include('customer.partials.left_bar')

    <!-- Content -->
    <div class="member_dash_content">

        <div class="member_dash_card">

            <div class="member_dash_user">

                <div class="member_dash_user_img">
                    <img src="{{ !empty($customerDetails->profile_pic) ? static_asset('uploads/all/'.$customerDetails->profile_pic) : static_asset('assets/assets_web/img/default-user.png') }}" alt="">
                </div>

                <div class="member_dash_user_info">
                    <h2>{{ $customerDetails->first_name }}</h2>

                    <ul>
                        <li>
                            <i class="fa-solid fa-envelope"></i>
                            {{ $customerDetails->mobile }}
                        </li>

                        <li>
                            <i class="fa-solid fa-phone"></i>
                            {{ $customerDetails->mobile }}
                        </li>
                    </ul>

                    <p>
                        Welcome to your dashboard. Manage your profile and account information from one place.
                    </p>

                    <a href="{{ url('customer/account-settings') }}" class="member_dash_btn">
                        Edit Profile
                    </a>
                </div>

            </div>

        </div>

    </div>

</div>



<!-- Page content -->
    <main class="content-wrapper">
      <div class="container pt-4 pt-sm-5 pb-5 mb-xxl-3">
        <div class="row pt-2 pt-sm-0 pt-lg-2 pb-2 pb-sm-3 pb-md-4 pb-lg-5">


          


          <!-- Account profile content -->
          <div class="col-lg-9">
            <h1 class="h2 pb-2 pb-lg-3">My profile</h1>

            <!-- Wallet + Account progress -->
            <section class="row g-3 g-xl-4 pb-5 mb-md-3">
               
            </section>


            <!-- User info -->
            <section class="pb-5 mb-md-3">
              <div class="ratio ratio-1x1 bg-body-tertiary border rounded-circle overflow-hidden mb-3 mb-md-4" style="width: 124px">
                <img src="{{ !empty($customerDetails->profile_pic) ? static_asset('uploads/all/'.$customerDetails->profile_pic) : static_asset('assets/assets_web/img/default-user.png') }}" alt="Avatar">
              </div>
              <h2 class="h5 pb-1 pb-sm-0 mb-2 mb-sm-3">{{ $customerDetails->company_name }}</h2>
              <ul class="list-unstyled flex-row flex-wrap gap-sm-3 fs-sm mb-3">
                <li class="d-flex align-items-center me-2">
                  <i class="fi-mail fs-base me-2"></i>
                  {{ $customerDetails->first_name }}
                </li>
                <li class="d-flex align-items-center me-2">
                  <i class="fi-phone fs-base me-2"></i>
                  {{ $customerDetails->mobile }}
                </li>
                
              </ul>
              <p class="fs-sm pb-sm-1 pb-md-0 mb-md-4">Extensive experience in rentals and a vast database means I can quickly find the options that are right for you. Looking for a seamless and exciting rental experience? Contact me today - I promise it won't be boring! Your perfect home is just a call away.</p>
              <a class="btn btn-outline-secondary" href="{{ url('') }}">Edit profile</a>
            </section>


            @if(false)
			<!-- User listings -->
            <section class="pb-5 mb-md-3">
              <div class="d-flex align-items-center justify-content-between pb-1 pb-sm-0 mb-3 mb-sm-4">
                <h2 class="h4 mb-0 me-3">My listings</h2>
                <div class="nav">
                  <a class="nav-link position-relative px-0" href="account-listings.html">
                    <span class="hover-effect-underline stretched-link me-1">View all</span>
                    <i class="fi-chevron-right fs-base"></i>
                  </a>
                </div>
              </div>
              <div class="vstack gap-3">

                <!-- Item -->
                <article class="card">
                  <div class="row g-0">
                    <div class="col-sm-4 col-md-3 rounded overflow-hidden pb-2 pb-sm-0 pe-sm-2">
                      <a class="position-relative d-flex h-100 bg-body-tertiary" href="#!" style="min-height: 174px">
                        <img src="assets/img/listings/real-estate/01.jpg" class="position-absolute top-0 start-0 w-100 h-100 object-fit-cover" alt="Image">
                        <div class="ratio d-none d-sm-block"  style="--fn-aspect-ratio: calc(180 / 240 * 100%)"></div>
                        <div class="ratio ratio-16x9 d-sm-none"></div>
                      </a>
                    </div>
                    <div class="col-sm-8 col-md-9 align-self-center">
                      <div class="card-body d-flex justify-content-between p-3 py-sm-4 ps-sm-2 ps-md-3 pe-md-4 mt-n1 mt-sm-0">
                        <div class="position-relative pe-3">
                          <span class="badge text-body-emphasis bg-body-secondary mb-2">For rent</span>
                          <div class="h5 mb-2">$2,500</div>
                          <a class="stretched-link d-block fs-sm text-body text-decoration-none mb-2" href="#!">40 S 9th St, Brooklyn, NY 11249</a>
                          <div class="h6 fs-sm mb-0">97 sq.m</div>
                        </div>
                        <div class="text-end">
                          <div class="fs-xs text-body-secondary mb-3">Created: 05/10/2024</div>
                          <div class="d-flex justify-content-end gap-2 mb-3">
                            <button type="button" class="btn btn-outline-secondary">Statistics</button>
                            <div class="dropdown">
                              <button type="button" class="btn btn-icon btn-outline-secondary" data-bs-toggle="dropdown" aria-expanded="false" aria-label="Settings">
                                <i class="fi-settings fs-base"></i>
                              </button>
                              <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                  <a class="dropdown-item" href="#!">
                                    <i class="fi-edit opacity-75 me-2"></i>
                                    Edit
                                  </a>
                                </li>
                                <li>
                                  <a class="dropdown-item" href="#!">
                                    <i class="fi-zap fs-base opacity-75 me-2"></i>
                                    Promote
                                  </a>
                                </li>
                                <li>
                                  <a class="dropdown-item" href="#!">
                                    <i class="fi-archive opacity-75 me-2"></i>
                                    Move to archive
                                  </a>
                                </li>
                                <li>
                                  <a class="dropdown-item text-danger" href="#!">
                                    <i class="fi-trash opacity-75 me-2"></i>
                                    Delete
                                  </a>
                                </li>
                              </ul>
                            </div>
                          </div>
                          <ul class="list-unstyled flex-row flex-wrap fs-sm mb-0">
                            <li class="d-flex align-items-center me-2 me-md-3">
                              <i class="fi-eye fs-base me-1"></i>
                              1246
                            </li>
                            <li class="d-flex align-items-center me-2 me-md-3">
                              <i class="fi-heart fs-base me-1"></i>
                              23
                            </li>
                            <li class="d-flex align-items-center">
                              <i class="fi-phone-incoming fs-base me-1"></i>
                              8
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                </article>

                <!-- Item -->
                <article class="card">
                  <div class="row g-0">
                    <div class="col-sm-4 col-md-3 rounded overflow-hidden pb-2 pb-sm-0 pe-sm-2">
                      <a class="position-relative d-flex h-100 bg-body-tertiary" href="#!" style="min-height: 174px">
                        <img src="assets/img/listings/real-estate/02.jpg" class="position-absolute top-0 start-0 w-100 h-100 object-fit-cover" alt="Image">
                        <div class="ratio d-none d-sm-block"  style="--fn-aspect-ratio: calc(180 / 240 * 100%)"></div>
                        <div class="ratio ratio-16x9 d-sm-none"></div>
                      </a>
                    </div>
                    <div class="col-sm-8 col-md-9 align-self-center">
                      <div class="card-body d-flex justify-content-between p-3 py-sm-4 ps-sm-2 ps-md-3 pe-md-4 mt-n1 mt-sm-0">
                        <div class="position-relative pe-3">
                          <span class="badge text-body-emphasis bg-body-secondary mb-2">For rent</span>
                          <div class="h5 mb-2">$1,350</div>
                          <a class="stretched-link d-block fs-sm text-body text-decoration-none mb-2" href="#!">444 Park Ave, Brooklyn, NY 11205</a>
                          <div class="h6 fs-sm mb-0">45 sq.m</div>
                        </div>
                        <div class="text-end">
                          <div class="fs-xs text-body-secondary mb-3">Created: 12/06/2024</div>
                          <div class="d-flex justify-content-end gap-2 mb-3">
                            <button type="button" class="btn btn-outline-secondary">Statistics</button>
                            <div class="dropdown">
                              <button type="button" class="btn btn-icon btn-outline-secondary" data-bs-toggle="dropdown" aria-expanded="false" aria-label="Settings">
                                <i class="fi-settings fs-base"></i>
                              </button>
                              <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                  <a class="dropdown-item" href="#!">
                                    <i class="fi-edit opacity-75 me-2"></i>
                                    Edit
                                  </a>
                                </li>
                                <li>
                                  <a class="dropdown-item" href="#!">
                                    <i class="fi-zap fs-base opacity-75 me-2"></i>
                                    Promote
                                  </a>
                                </li>
                                <li>
                                  <a class="dropdown-item" href="#!">
                                    <i class="fi-archive opacity-75 me-2"></i>
                                    Move to archive
                                  </a>
                                </li>
                                <li>
                                  <a class="dropdown-item text-danger" href="#!">
                                    <i class="fi-trash opacity-75 me-2"></i>
                                    Delete
                                  </a>
                                </li>
                              </ul>
                            </div>
                          </div>
                          <ul class="list-unstyled flex-row flex-wrap fs-sm mb-0">
                            <li class="d-flex align-items-center me-2 me-md-3">
                              <i class="fi-eye fs-base me-1"></i>
                              678
                            </li>
                            <li class="d-flex align-items-center me-2 me-md-3">
                              <i class="fi-heart fs-base me-1"></i>
                              5
                            </li>
                            <li class="d-flex align-items-center">
                              <i class="fi-phone-incoming fs-base me-1"></i>
                              1
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                </article>
              </div>
            </section>


            <!-- Reviews -->
            <section class="pb-5 mb-md-3">
              <div class="d-flex align-items-center justify-content-between pb-1 pb-sm-0 mb-3 mb-sm-4">
                <h2 class="h4 mb-0 me-3">Reviews</h2>
                <div class="nav">
                  <a class="nav-link position-relative px-0" href="account-reviews.html">
                    <span class="hover-effect-underline stretched-link me-1">View all</span>
                    <i class="fi-chevron-right fs-base"></i>
                  </a>
                </div>
              </div>
              <div class="bg-body-tertiary rounded p-4">
                <div class="p-sm-3">
                  <div class="row row-cols-2 row-cols-sm-4 g-3 gx-md-4">
                    <div class="col">
                      <h3 class="fs-sm fw-normal text-body mb-2">Reviews about you</h3>
                      <div class="h5 mb-0">8</div>
                    </div>
                    <div class="col">
                      <h3 class="fs-sm fw-normal text-body mb-2">Reviews by you</h3>
                      <div class="h5 mb-0">12</div>
                    </div>
                    <div class="col">
                      <h3 class="fs-sm fw-normal text-body mb-2">Marked as "Useful"</h3>
                      <div class="h5 mb-0">3</div>
                    </div>
                    <div class="col">
                      <h3 class="fs-sm fw-normal text-body mb-2">Your overall rating</h3>
                      <div class="h5 d-flex align-items-center lh-base mb-0"><i class="fi-star-filled text-warning me-2"></i>4.9</div>
                    </div>
                  </div>
                  <hr>
                  <div class="d-sm-flex align-items-center pt-1 pt-md-2 mb-3">
                    <div class="d-flex align-items-center pe-3">
                      <div class="ratio ratio-1x1 flex-shrink-0 bg-body-secondary rounded-circle overflow-hidden" style="width: 48px">
                        <img src="assets/img/account/reviews/ava01.jpg" alt="Avatar">
                      </div>
                      <div class="ps-3">
                        <h6 class="mb-1">Randy Walker</h6>
                        <div class="fs-xs text-body-secondary">Nov 12, 2024</div>
                      </div>
                    </div>
                    <div class="d-flex gap-1 fs-sm pt-2 pt-sm-0 ps-5 ps-sm-0 ms-3 ms-sm-auto">
                      <i class="fi-star-filled text-warning"></i>
                      <i class="fi-star-filled text-warning"></i>
                      <i class="fi-star-filled text-warning"></i>
                      <i class="fi-star-filled text-warning"></i>
                      <i class="fi-star-filled text-warning"></i>
                    </div>
                  </div>
                  <p class="fs-sm mb-2">Review on:<a class="hover-effect-underline fw-medium text-dark-emphasis text-decoration-none ms-2" href="#!">67-04 Myrtle Ave Glendale, NY 11385</a></p>
                  <p class="fs-sm mb-0">Excellent apartment in the very center of the city, attractions and entertainment venues are located 50m from the flat. The flat was perfectly clean and had basic slippers, gel-shampoo, clean towels.</p>
                </div>
              </div>
            </section>


            <!-- Favorites -->
            <section class="pb-5 mb-md-3">
              <div class="d-flex align-items-center justify-content-between pb-1 pb-sm-0 mb-3 mb-sm-4">
                <h2 class="h4 mb-0 me-3">Favorites</h2>
                <div class="nav">
                  <a class="nav-link position-relative px-0" href="account-favorites.html">
                    <span class="hover-effect-underline stretched-link me-1">View all</span>
                    <i class="fi-chevron-right fs-base"></i>
                  </a>
                </div>
              </div>
              <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4 g-md-3 g-lg-4">

                <!-- Item -->
                <div class="col">
                  <article class="card hover-effect-opacity h-100">
                    <div class="card-img-top position-relative bg-body-tertiary overflow-hidden">
                      <div class="swiper z-2" data-swiper='{
                        "pagination": {
                          "el": ".swiper-pagination"
                        },
                        "navigation": {
                          "prevEl": ".btn-prev",
                          "nextEl": ".btn-next"
                        },
                        "breakpoints": {
                          "991": {
                            "allowTouchMove": false
                          }
                        }
                      }'>
                        <a class="swiper-wrapper" href="#!">
                          <div class="swiper-slide">
                            <div class="ratio d-block" style="--fn-aspect-ratio: calc(248 / 362 * 100%)">
                              <img src="../assets/img/listings/real-estate/06.jpg" alt="Image">
                              <span class="position-absolute top-0 start-0 w-100 h-100 z-1" style="background: linear-gradient(180deg, rgba(0,0,0, 0) 0%, rgba(0,0,0, .11) 100%)"></span>
                            </div>
                          </div>
                          <div class="swiper-slide">
                            <div class="ratio d-block" style="--fn-aspect-ratio: calc(248 / 362 * 100%)">
                              <img src="../assets/img/listings/real-estate/06.jpg" alt="Image">
                              <span class="position-absolute top-0 start-0 w-100 h-100 z-1" style="background: linear-gradient(180deg, rgba(0,0,0, 0) 0%, rgba(0,0,0, .11) 100%)"></span>
                            </div>
                          </div>
                          <div class="swiper-slide">
                            <div class="ratio d-block" style="--fn-aspect-ratio: calc(248 / 362 * 100%)">
                              <img src="../assets/img/listings/real-estate/06.jpg" alt="Image">
                              <span class="position-absolute top-0 start-0 w-100 h-100 z-1" style="background: linear-gradient(180deg, rgba(0,0,0, 0) 0%, rgba(0,0,0, .11) 100%)"></span>
                            </div>
                          </div>
                        </a>
                        <div class="d-flex flex-column gap-2 align-items-start position-absolute top-0 start-0 z-1 pt-1 pt-sm-0 ps-1 ps-sm-0 mt-2 mt-sm-3 ms-2 ms-sm-3">
                          <span class="badge text-bg-primary">New</span>
                        </div>
                        <div class="position-absolute top-0 end-0 z-1 pt-1 pt-sm-0 pe-1 pe-sm-0 mt-2 mt-sm-3 me-2 me-sm-3">
                          <button type="button" class="btn btn-sm btn-icon btn-light bg-light border-0 rounded-circle animate-pulse" aria-label="Remove from wishlist">
                            <i class="fi-heart-filled text-danger animate-target fs-sm"></i>
                          </button>
                        </div>
                        <div class="position-absolute top-50 start-0 z-1 translate-middle-y d-none d-lg-block hover-effect-target opacity-0 ms-3">
                          <button type="button" class="btn btn-sm btn-prev btn-icon btn-light bg-light rounded-circle animate-slide-start" aria-label="Prev">
                            <i class="fi-chevron-left fs-lg animate-target"></i>
                          </button>
                        </div>
                        <div class="position-absolute top-50 end-0 z-1 translate-middle-y d-none d-lg-block hover-effect-target opacity-0 me-3">
                          <button type="button" class="btn btn-sm btn-next btn-icon btn-light bg-light rounded-circle animate-slide-end" aria-label="Next">
                            <i class="fi-chevron-right fs-lg animate-target"></i>
                          </button>
                        </div>
                        <div class="swiper-pagination bottom-0 mb-2" data-bs-theme="light"></div>
                      </div>
                    </div>
                    <div class="card-body p-3">
                      <div class="pb-1 mb-2">
                        <span class="badge text-body-emphasis bg-body-secondary">For sale</span>
                      </div>
                      <div class="h5 mb-2">$375,000</div>
                      <h3 class="fs-sm fw-normal text-body mb-2">
                        <a class="stretched-link text-body" href="#!">929 Hart St, Brooklyn, NY 11237</a>
                      </h3>
                      <div class="h6 fs-sm mb-0">108 sq.m</div>
                    </div>
                    <div class="card-footer d-flex gap-2 border-0 bg-transparent pt-0 pb-3 px-3 mt-n1">
                      <div class="d-flex align-items-center fs-sm gap-1 me-1">
                        3<i class="fi-bed-single fs-base text-secondary-emphasis"></i>
                      </div>
                      <div class="d-flex align-items-center fs-sm gap-1 me-1">
                        2<i class="fi-shower fs-base text-secondary-emphasis"></i>
                      </div>
                      <div class="d-flex align-items-center fs-sm gap-1 me-1">
                        1<i class="fi-car-garage fs-base text-secondary-emphasis"></i>
                      </div>
                    </div>
                  </article>
                </div>

                <!-- Item -->
                <div class="col">
                  <article class="card hover-effect-opacity h-100">
                    <div class="card-img-top position-relative bg-body-tertiary overflow-hidden">
                      <div class="swiper z-2" data-swiper='{
                        "pagination": {
                          "el": ".swiper-pagination"
                        },
                        "navigation": {
                          "prevEl": ".btn-prev",
                          "nextEl": ".btn-next"
                        },
                        "breakpoints": {
                          "991": {
                            "allowTouchMove": false
                          }
                        }
                      }'>
                        <a class="swiper-wrapper" href="#!">
                          <div class="swiper-slide">
                            <div class="ratio d-block" style="--fn-aspect-ratio: calc(248 / 362 * 100%)">
                              <img src="../assets/img/listings/real-estate/03.jpg" alt="Image">
                              <span class="position-absolute top-0 start-0 w-100 h-100 z-1" style="background: linear-gradient(180deg, rgba(0,0,0, 0) 0%, rgba(0,0,0, .11) 100%)"></span>
                            </div>
                          </div>
                          <div class="swiper-slide">
                            <div class="ratio d-block" style="--fn-aspect-ratio: calc(248 / 362 * 100%)">
                              <img src="../assets/img/listings/real-estate/03.jpg" alt="Image">
                              <span class="position-absolute top-0 start-0 w-100 h-100 z-1" style="background: linear-gradient(180deg, rgba(0,0,0, 0) 0%, rgba(0,0,0, .11) 100%)"></span>
                            </div>
                          </div>
                          <div class="swiper-slide">
                            <div class="ratio d-block" style="--fn-aspect-ratio: calc(248 / 362 * 100%)">
                              <img src="../assets/img/listings/real-estate/03.jpg" alt="Image">
                              <span class="position-absolute top-0 start-0 w-100 h-100 z-1" style="background: linear-gradient(180deg, rgba(0,0,0, 0) 0%, rgba(0,0,0, .11) 100%)"></span>
                            </div>
                          </div>
                        </a>
                        <div class="d-flex flex-column gap-2 align-items-start position-absolute top-0 start-0 z-1 pt-1 pt-sm-0 ps-1 ps-sm-0 mt-2 mt-sm-3 ms-2 ms-sm-3">
                          <span class="badge text-bg-info">Featured</span>
                          <span class="badge text-bg-primary">New</span>
                        </div>
                        <div class="position-absolute top-0 end-0 z-1 pt-1 pt-sm-0 pe-1 pe-sm-0 mt-2 mt-sm-3 me-2 me-sm-3">
                          <button type="button" class="btn btn-sm btn-icon btn-light bg-light border-0 rounded-circle animate-pulse" aria-label="Remove from wishlist">
                            <i class="fi-heart-filled text-danger animate-target fs-sm"></i>
                          </button>
                        </div>
                        <div class="position-absolute top-50 start-0 z-1 translate-middle-y d-none d-lg-block hover-effect-target opacity-0 ms-3">
                          <button type="button" class="btn btn-sm btn-prev btn-icon btn-light bg-light rounded-circle animate-slide-start" aria-label="Prev">
                            <i class="fi-chevron-left fs-lg animate-target"></i>
                          </button>
                        </div>
                        <div class="position-absolute top-50 end-0 z-1 translate-middle-y d-none d-lg-block hover-effect-target opacity-0 me-3">
                          <button type="button" class="btn btn-sm btn-next btn-icon btn-light bg-light rounded-circle animate-slide-end" aria-label="Next">
                            <i class="fi-chevron-right fs-lg animate-target"></i>
                          </button>
                        </div>
                        <div class="swiper-pagination bottom-0 mb-2" data-bs-theme="light"></div>
                      </div>
                    </div>
                    <div class="card-body p-3">
                      <div class="pb-1 mb-2">
                        <span class="badge text-body-emphasis bg-body-secondary">For rent</span>
                      </div>
                      <div class="h5 mb-2">$1,890</div>
                      <h3 class="fs-sm fw-normal text-body mb-2">
                        <a class="stretched-link text-body" href="#!">3811 Ditmars Blvd Astoria, NY 11105</a>
                      </h3>
                      <div class="h6 fs-sm mb-0">75 sq.m</div>
                    </div>
                    <div class="card-footer d-flex gap-2 border-0 bg-transparent pt-0 pb-3 px-3 mt-n1">
                      <div class="d-flex align-items-center fs-sm gap-1 me-1">
                        2<i class="fi-bed-single fs-base text-secondary-emphasis"></i>
                      </div>
                      <div class="d-flex align-items-center fs-sm gap-1 me-1">
                        1<i class="fi-shower fs-base text-secondary-emphasis"></i>
                      </div>
                      <div class="d-flex align-items-center fs-sm gap-1 me-1">
                        1<i class="fi-car-garage fs-base text-secondary-emphasis"></i>
                      </div>
                    </div>
                  </article>
                </div>

                <!-- Item -->
                <div class="col">
                  <article class="card hover-effect-opacity h-100">
                    <div class="card-img-top position-relative bg-body-tertiary overflow-hidden">
                      <div class="swiper z-2" data-swiper='{
                        "pagination": {
                          "el": ".swiper-pagination"
                        },
                        "navigation": {
                          "prevEl": ".btn-prev",
                          "nextEl": ".btn-next"
                        },
                        "breakpoints": {
                          "991": {
                            "allowTouchMove": false
                          }
                        }
                      }'>
                        <a class="swiper-wrapper" href="#!">
                          <div class="swiper-slide">
                            <div class="ratio d-block" style="--fn-aspect-ratio: calc(248 / 362 * 100%)">
                              <img src="../assets/img/listings/real-estate/05.jpg" alt="Image">
                              <span class="position-absolute top-0 start-0 w-100 h-100 z-1" style="background: linear-gradient(180deg, rgba(0,0,0, 0) 0%, rgba(0,0,0, .11) 100%)"></span>
                            </div>
                          </div>
                          <div class="swiper-slide">
                            <div class="ratio d-block" style="--fn-aspect-ratio: calc(248 / 362 * 100%)">
                              <img src="../assets/img/listings/real-estate/05.jpg" alt="Image">
                              <span class="position-absolute top-0 start-0 w-100 h-100 z-1" style="background: linear-gradient(180deg, rgba(0,0,0, 0) 0%, rgba(0,0,0, .11) 100%)"></span>
                            </div>
                          </div>
                          <div class="swiper-slide">
                            <div class="ratio d-block" style="--fn-aspect-ratio: calc(248 / 362 * 100%)">
                              <img src="../assets/img/listings/real-estate/05.jpg" alt="Image">
                              <span class="position-absolute top-0 start-0 w-100 h-100 z-1" style="background: linear-gradient(180deg, rgba(0,0,0, 0) 0%, rgba(0,0,0, .11) 100%)"></span>
                            </div>
                          </div>
                        </a>
                        <div class="d-flex flex-column gap-2 align-items-start position-absolute top-0 start-0 z-1 pt-1 pt-sm-0 ps-1 ps-sm-0 mt-2 mt-sm-3 ms-2 ms-sm-3">
                          <span class="badge text-bg-info d-inline-flex align-items-center">
                            Verified
                            <i class="fi-shield ms-1"></i>
                          </span>
                        </div>
                        <div class="position-absolute top-0 end-0 z-1 pt-1 pt-sm-0 pe-1 pe-sm-0 mt-2 mt-sm-3 me-2 me-sm-3">
                          <button type="button" class="btn btn-sm btn-icon btn-light bg-light border-0 rounded-circle animate-pulse" aria-label="Remove from wishlist">
                            <i class="fi-heart-filled text-danger animate-target fs-sm"></i>
                          </button>
                        </div>
                        <div class="position-absolute top-50 start-0 z-1 translate-middle-y d-none d-lg-block hover-effect-target opacity-0 ms-3">
                          <button type="button" class="btn btn-sm btn-prev btn-icon btn-light bg-light rounded-circle animate-slide-start" aria-label="Prev">
                            <i class="fi-chevron-left fs-lg animate-target"></i>
                          </button>
                        </div>
                        <div class="position-absolute top-50 end-0 z-1 translate-middle-y d-none d-lg-block hover-effect-target opacity-0 me-3">
                          <button type="button" class="btn btn-sm btn-next btn-icon btn-light bg-light rounded-circle animate-slide-end" aria-label="Next">
                            <i class="fi-chevron-right fs-lg animate-target"></i>
                          </button>
                        </div>
                        <div class="swiper-pagination bottom-0 mb-2" data-bs-theme="light"></div>
                      </div>
                    </div>
                    <div class="card-body p-3">
                      <div class="pb-1 mb-2">
                        <span class="badge text-body-emphasis bg-body-secondary">For rent</span>
                      </div>
                      <div class="h5 mb-2">$1,250</div>
                      <h3 class="fs-sm fw-normal text-body mb-2">
                        <a class="stretched-link text-body" href="#!">444 Park Ave, Brooklyn, NY 11205</a>
                      </h3>
                      <div class="h6 fs-sm mb-0">54 sq.m</div>
                    </div>
                    <div class="card-footer d-flex gap-2 border-0 bg-transparent pt-0 pb-3 px-3 mt-n1">
                      <div class="d-flex align-items-center fs-sm gap-1 me-1">
                        1<i class="fi-bed-single fs-base text-secondary-emphasis"></i>
                      </div>
                      <div class="d-flex align-items-center fs-sm gap-1 me-1">
                        1<i class="fi-shower fs-base text-secondary-emphasis"></i>
                      </div>
                      <div class="d-flex align-items-center fs-sm gap-1 me-1">
                        0<i class="fi-car-garage fs-base text-secondary-emphasis"></i>
                      </div>
                    </div>
                  </article>
                </div>
              </div>
            </section>


            <!-- Help center -->
            <section>
              <h2 class="h4 mb-4">Need help?</h2>
              <div class="row row-cols-1 row-cols-sm-2 g-4 g-md-5">
                <div class="col">
                  <div class="position-relative">
                    <i class="fi-globe fs-4 text-dark-emphasis pb-1 pb-md-0 mb-2 mb-md-3"></i>
                    <h3 class="h6 pb-md-1 mb-2">
                      <a class="hover-effect-underline stretched-link" href="#!">Join a Finder property club</a>
                    </h3>
                    <p class="fs-sm mb-0">Join your local Host Club to connect with your hosting community both online and through in-person or virtual meetups.</p>
                  </div>
                </div>
                <div class="col">
                  <div class="position-relative">
                    <i class="fi-headphones fs-4 text-dark-emphasis pb-1 pb-md-0 mb-2 mb-md-3"></i>
                    <h3 class="h6 pb-md-1 mb-2">
                      <a class="hover-effect-underline stretched-link" href="#!">Get professional support</a>
                    </h3>
                    <p class="fs-sm mb-0">I'm your virtual assistant from the Help Center, ready to assist you in finding the information and resources you're looking for.</p>
                  </div>
                </div>
              </div>
            </section>
			@endif
          </div>
        </div>
      </div>
    </main>



@endsection
