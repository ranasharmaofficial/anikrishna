<!-- header area -->
  @php

  $header_logo = get_business_single_cache_value('header_logo', 'header_setup', 'header_logo');
  $social_medias = get_business_multiple_cache_value('social_medias', 'social_media');
  $corporate_address = get_business_single_cache_value('corporate_address', 'footer_setup', 'corporate_address');

  $contact_working_hr = get_business_single_cache_value('contact_working_hr', 'footer_setup', 'contact_working_hr');
  $contact_email = get_business_single_cache_value('contact_email', 'footer_setup', 'contact_email');
  $contact_phone = get_business_single_cache_value('contact_phone', 'footer_setup', 'contact_phone');
  $contact_address = get_business_single_cache_value('contact_address', 'footer_setup', 'contact_address');

  $header_phone = get_business_single_cache_value('header_phone', 'header_setup', 'header_phone');
  $header_email = get_business_single_cache_value('header_email', 'header_setup', 'header_email');

  $header_whatsapp = get_business_single_cache_value('whatsapp', 'header_setup', 'whatsapp');
  $header_skype = get_business_single_cache_value('skype', 'header_setup', 'skype');
  $header_address = get_business_single_cache_value('header_address', 'header_setup', 'header_address');
  $header_website = get_business_single_cache_value('header_website', 'header_setup', 'header_website');
  $header_phone = get_business_single_cache_value('header_phone', 'header_setup', 'header_phone');
  $header_email = get_business_single_cache_value('header_email', 'header_setup', 'header_email');


  @endphp

 @php
    $facebook_value = \App\Models\BusinessSetting::where('type', 'social_media')
                                        ->where('field_name', 'facebook')
                                        ->pluck('value')
                                        ->first();
    $instagram_value = \App\Models\BusinessSetting::where('type', 'social_media')
                                        ->where('field_name', 'instagram')
                                        ->pluck('value')
                                        ->first();
    $youtube_value = \App\Models\BusinessSetting::where('type', 'social_media')
                                        ->where('field_name', 'skype')
                                        ->pluck('value')
                                        ->first();
    $twitter_value = \App\Models\BusinessSetting::where('type', 'social_media')
                                        ->where('field_name', 'twitter')
                                        ->pluck('value')
                                        ->first();
@endphp

<!-- ==== mobile top header start ==== -->
   <div class="mobile-top-header d-flex d-lg-none">
      <div class="container">
         <div class="row">
            <div class="col-12">
               <div class="mobile-top-header__inner">

                  <a href="tel:+919264458499">
                     <i class="fa-solid fa-phone"></i>
                     +91-92644-58499
                  </a>

                  <span class="divider">|</span>

                  <a href="mailto:anikrishnasodhdarpan@tnafoundation.org">
                     <i class="fa-regular fa-envelope"></i>
                     anikrishnasodhdarpan@tnafoundation.org
                  </a>

               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- ==== / mobile top header end ==== -->


   <div class="topbar topbar--tertiary d-none d-lg-block">
      <div class="container">
         <div class="row">
            <div class="col-12">
               <div class="topbar__inner">
                  <div class="row align-items-center">
                     <div class="col-12 col-lg-7">
                        <div class="topbar__list-wrapper">
                           <ul class="topbar__list">
                              <li><a href="https://maps.app.goo.gl/aGWh2fTkugWpUzfV7" target="_blank"><i
                                       class="fa-solid fa-location-dot"></i>Bihar, India</a>
                              </li>
                              <li class="maps">
                                 <a href="mailto:anikrishnasodhdarpan@tnafoundation.org">
                                    <i class="fa-regular fa-envelope"></i>
                                    anikrishnasodhdarpan@tnafoundation.org
                                 </a>
                              </li>
                           </ul>
                        </div>
                     </div>
                     <div class="col-12 col-lg-5">
                        <div class="topbar__items justify-content-end">
                           <p>
                              <a href="tel:+919264458499">
                                 <i class="fa-solid fa-phone"></i>
                                 +91-92644-58499
                              </a>
                           </p>
                           <div class="social">
                              <a href="https://www.facebook.com/" target="_blank" aria-label="share us on facebook"
                                 title="facebook">
                                 <i class="fa-brands fa-facebook-f"></i>
                              </a>

                              <a href="https://x.com/" target="_blank" aria-label="share us on twitter" title="twitter">
                                 <i class="fa-brands fa-x-twitter"></i>
                              </a>
                              <a href="https://www.linkedin.com/" target="_blank" aria-label="share us on linkedin"
                                 title="linkedin">
                                 <i class="fa-brands fa-linkedin-in"></i>
                              </a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- ==== / topbar end ==== -->
   <!-- ==== header start ==== -->
   <header class="header header-tertiary">
      <div class="container">
         <div class="row">
            <div class="col-12">
               <div class="main-header__menu-box">
                  <nav class="navbar p-0">
                     <div class="navbar-logo">
                        <a href="{{ url('') }}">
                           <img src="{{ static_asset('assets/assets_web/images/log.png') }}" alt="Image">
                        </a>
                     </div>
                     <div class="navbar__menu d-none d-xl-block">
                        <ul class="navbar__list">
                           <li class="navbar__item nav-fade">
                              <a href="{{ url('') }}">Home</a>
                           </li>
                           <li class="navbar__item navbar__item--has-children nav-fade">
                              <a href="#" aria-label="dropdown menu"
                                 class="navbar__dropdown-label dropdown-label-alter">About</a>
                              <ul class="navbar__sub-menu">
                                 <li>
                                    <a href="{{ url('about') }}">About AKSD</a>
                                 </li>
                                 <li>
                                    <a href="{{ url('why-us') }}">Why AKSD</a>
                                 </li>
                                 <li>
                                    <a href="{{ url('mission') }}">MISSION & vISION</a>
                                 </li>
                                 <li>
                                    <a href="{{ url('what-we-publish') }}">wHAT wE Publish</a>
                                 </li>
                              </ul>
                           </li>

                            <li class="navbar__item navbar__item--has-children nav-fade">
                              <a href="#" aria-label="dropdown menu"
                                 class="navbar__dropdown-label dropdown-label-alter">Research Paper</a>
                              <ul class="navbar__sub-menu">
                                <li>
                                    <a href="{{ url('submit-research-paper') }}">Submit Research Paper</a>
                                </li>
                                <li>
                                    <a href="#">Publication Charges</a>
                                </li>
                                <li>
                                    <a href="{{ url('publication-guideline') }}">Publication Guideline</a>
                                </li>
                              </ul>
                            </li>

                           <li class="navbar__item navbar__item--has-children nav-fade">
                              <a href="#" aria-label="dropdown menu"
                                 class="navbar__dropdown-label dropdown-label-alter">Publication Archives</a>
                              <ul class="navbar__sub-menu">
                                 <li>
                                    <a href="{{ url('current-issue') }}">current issue</a>
                                 </li>
                                 <li>
                                    <a href="#">Archives Issue</a>
                                 </li>

                              </ul>
                           </li>
                           <li class="navbar__item navbar__item--has-children nav-fade">
                              <a href="#" aria-label="dropdown menu"
                                 class="navbar__dropdown-label dropdown-label-alter">Board Members</a>
                              <ul class="navbar__sub-menu">

                                 <li class="navbar__item navbar__item--has-children">
                                    <a aria-label="dropdown menu"
                                       class="navbar__dropdown-label navbar__dropdown-label-sub">Our Board</a>
                                    <ul class="navbar__sub-menu navbar__sub-menu__nested">
                                       <li>
                                          <a href="{{ url('editorial-board') }}">Editorial Board</a>
                                       </li>
                                       <li>
                                          <a href="#">Advisory Board</a>
                                       </li>
                                       <li>
                                          <a href="{{ url('reviewer-board') }}">Reviewer Board</a>
                                       </li>
                                        <li>
                                          <a href="{{ url('refereed-board') }}">Refereed Board</a>
                                       </li>
                                    </ul>
                                 </li>

                                 <li>
                                    <a href="{{ url('managing-board') }}">Managing Board</a>
                                 </li>
                              </ul>
                           </li>
                           <li class="navbar__item navbar__item--has-children nav-fade">
                              <a href="#" aria-label="dropdown menu"
                                 class="navbar__dropdown-label dropdown-label-alter">Polices</a>
                              <ul class="navbar__sub-menu">
                                 <li>
                                    <a href="{{ url('ethics') }}">Publication Ethics</a>
                                 </li>
                                 <li>
                                    <a href="{{ url('peer-review-policy') }}">Peer Review Policy</a>
                                 </li>
                                 <li>
                                    <a href="#">Plagiarism Policy</a>
                                 </li>
                                 <li>
                                    <a href="#">Content Policy</a>
                                 </li>
                              </ul>
                           </li>
                           <li class="navbar__item nav-fade">
                              <a href="{{ url('contact-us') }}">Contact Us</a>
                           </li>
                        </ul>
                     </div>
                     <div class="navbar__options">
                        <div class="navbar__mobile-options ">


                           <div class="sidenav-box d-none d-xl-block">
                              <button class="open-sidenav" aria-label="sidenav" title="open sidenav">
                                 <svg xmlns="http://www.w3.org/2000/svg" width="28" height="26" viewBox="0 0 28 26"
                                    fill="none">
                                    <ellipse cx="2.39023" cy="2.39022" rx="2.39023" ry="2.39022" fill="#FFC107" />
                                    <ellipse cx="13.9146" cy="2.39022" rx="2.39023" ry="2.39022" fill="black" />
                                    <ellipse cx="25.44" cy="2.39022" rx="2.39023" ry="2.39022" fill="black" />
                                    <ellipse cx="2.39023" cy="12.6334" rx="2.39023" ry="2.39022" fill="black" />
                                    <ellipse cx="13.9146" cy="12.6344" rx="2.39023" ry="2.39022" fill="#FFC107" />
                                    <ellipse cx="25.44" cy="12.6344" rx="2.39023" ry="2.39022" fill="black" />
                                    <ellipse cx="2.39023" cy="23.0484" rx="2.39023" ry="2.39022" fill="black" />
                                    <ellipse cx="13.9996" cy="23.0484" rx="2.39023" ry="2.39022" fill="black" />
                                    <ellipse cx="25.61" cy="23.0484" rx="2.39023" ry="2.39022" fill="#FFC107" />
                                 </svg>
                              </button>
                           </div>
                           <a href="{{ url('login-register') }}" class="btn--secondary d-none d-md-flex">Login <i
                                 class="fa-solid fa-arrow-right"></i></a>
                        </div>
                        <button class="open-offcanvas-nav d-flex d-xl-none" aria-label="toggle mobile menu"
                           title="open offcanvas menu">
                           <span class="icon-bar top-bar"></span>
                           <span class="icon-bar top-bar"></span>
                           <span class="icon-bar top-bar"></span>
                        </button>
                     </div>
                  </nav>
               </div>
            </div>
         </div>
      </div>
   </header>

   <!-- ==== mobile menu start ==== -->

   <div class="mobile-menu d-block ">
      <nav class="mobile-menu__wrapper">
         <div class="mobile-menu__header nav-fade">
            <div class="logo">
               <a href="{{ url('') }}" aria-label="home page" title="logo">
                  <img src="{{ static_asset('assets/assets_web/images/log.png') }}" alt="Image">
               </a>
            </div>
            <button aria-label="close mobile menu" class="close-mobile-menu">
               <i class="fa-solid fa-xmark"></i>
            </button>
         </div>
         <div class="mobile-menu__list"></div>
         <div class="mobile-menu__cta nav-fade d-block d-md-none">
            <a href="{{ url('') }}" class="btn--primary ">Enquiry now <i class="fa-solid fa-arrow-right"></i></a>
         </div>
         <div class="mobile-menu__social social nav-fade">
            <a href="https://www.facebook.com/" target="_blank" aria-label="share us on facebook" title="facebook">
               <i class="fa-brands fa-facebook-f"></i>
            </a>

            <a href="https://x.com/" target="_blank" aria-label="share us on twitter" title="twitter">
               <i class="fa-brands fa-twitter"></i>
            </a>
            <a href="https://www.linkedin.com/" target="_blank" aria-label="share us on linkedin" title="linkedin">
               <i class="fa-brands fa-linkedin-in"></i>
            </a>
         </div>
      </nav>
   </div>
   <div class="mobile-menu__backdrop"></div>
   <!-- ==== / mobile menu end ==== -->
   <!-- ==== / header end ==== -->
