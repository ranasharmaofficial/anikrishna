@php
  $social_medias = get_business_multiple_cache_value('social_medias', 'social_media');
  $footer_logo = get_business_single_cache_value('footer_logo', 'footer_setup', 'footer_logo');
  $footer_description = get_business_single_cache_value('footer_description', 'footer_setup', 'footer_description');
  $copyright_widget = get_business_single_cache_value('copyright_widget', 'footer_setup', 'copyright_widget');

  $contact_working_hr = get_business_single_cache_value('contact_working_hr', 'footer_setup', 'contact_working_hr');
  $contact_email = get_business_single_cache_value('contact_email', 'footer_setup', 'contact_email');
  $contact_phone = get_business_single_cache_value('contact_phone', 'footer_setup', 'contact_phone');
  $contact_address = get_business_single_cache_value('contact_address', 'footer_setup', 'contact_address');

  $corporate_address = get_business_single_cache_value('corporate_address', 'footer_setup', 'corporate_address');
  $corporate_address_phone = get_business_single_cache_value('corporate_address_phone', 'footer_setup', 'corporate_address_phone');

  $registered_address = get_business_single_cache_value('registered_address', 'footer_setup', 'registered_address');
  $registered_address_phone = get_business_single_cache_value('registered_address_phone', 'footer_setup', 'registered_address_phone');
  $footerWidgetOne = getFooterWidget('one');
  $footerWidgetTwo = getFooterWidget('two');
  $footerWidgetThree = getFooterWidget('three');
	// dd($footerWidgetOne['field_name']);
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
<!-- ==== footer start ==== -->
<footer class="footer-two">
    <div class="container">


        <div class="row gutter-60">
            <div class="col-12 col-md-6 col-xl-3">
                <div class="footer-two__widget" data-aos="fade-up" data-aos-duration="1000">
                    <div class="footer-two__widget-logo">
                        <a href="{{ url('') }}">
                            <img src="{{ static_asset('assets/assets_web/images/log.png') }}" alt="Image">
                        </a>
                    </div>
                    <div class="footer-two__widget-content">

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
            <div class="col-12 col-md-6 col-xl-2 offset-xl-1">
                <div class="footer-two__widget" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="200">
                    <div class="footer-two__widget-intro">
                        <h5>Quick Links</h5>
                        <div class="line">
                            <span class="large-line"></span>
                            <span class="small-line"></span>
                            <span class="small-line"></span>
                        </div>
                    </div>
                    <div class="footer-two__widget-content">
                        <ul>
                            <li><a href="#"><i class="fa-solid fa-arrow-right"></i>About Us</a>
                            </li>
                            <li><a href="#"><i class="fa-solid fa-arrow-right"></i>Our
                                    News</a>
                            </li>
                            <li><a href="#"><i class="fa-solid fa-arrow-right"></i>Our
                                    Campaign</a>
                            </li>
                            <li><a href="l#"><i class="fa-solid fa-arrow-right"></i>FAQ</a></li>
                            <li><a href="#"><i class="fa-solid fa-arrow-right"></i>Get A
                                    Quote</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-xl-3">
                <div class="footer-two__widget footer-two__widget--alternate" data-aos="fade-up"
                    data-aos-duration="1000" data-aos-delay="400">
                    <div class="footer-two__widget-intro">
                        <h5>Our Services</h5>
                        <div class="line">
                            <span class="large-line"></span>
                            <span class="small-line"></span>
                            <span class="small-line"></span>
                        </div>
                    </div>
                    <div class="footer-two__widget-content">
                        <ul>
                            <li><a href="#"><i class="fa-solid fa-arrow-right"></i>Our Causes</a>
                            </li>
                            <li><a href="#"><i class="fa-solid fa-arrow-right"></i>Education
                                    Support</a>
                            </li>
                            <li><a href="#"><i class="fa-solid fa-arrow-right"></i>Our
                                    Campaign</a>
                            </li>
                            <li><a href="#"><i class="fa-solid fa-arrow-right"></i>Food
                                    Support</a>
                            </li>
                            <li><a href="#"><i class="fa-solid fa-arrow-right"></i>Health
                                    Support</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-xl-3">
                <div class="footer-two__widget footer-two__widget--alternate" data-aos="fade-up"
                    data-aos-duration="1000" data-aos-delay="600">
                    <div class="footer-two__widget-intro">
                        <h5>Get In Touch</h5>
                        <div class="line">
                            <span class="large-line"></span>
                            <span class="small-line"></span>
                            <span class="small-line"></span>
                        </div>
                    </div>
                    <div class="footer-two__widget-content footer-two__widget-content--contact">
                        <ul>
                            <li><a href="https://maps.app.goo.gl/aGWh2fTkugWpUzfV7" target="_blank"><i
                                        class="fa-solid fa-location-dot"></i>Bihar, India</a>
                            </li>
                            <li><a href="+91-92644-58499"><i class="fa-solid fa-phone"></i>+91-92644-58499</a>
                            </li>
                            <li><a href="anikrishnasodhdarpan@tnafoundation.org"><i
                                        class="fa-regular fa-envelope"></i>anikrishnasodhdarpan@tnafoundation.org</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-two__copyright">
        <div class="container">
            <div class="row align-items-center gutter-12">
                <div class="col-12 col-lg-8">
                    <div class="footer-two__copyright-inner text-center text-lg-start">
                        <p>Copyright &copy; <span id="copyrightYear"></span> <a href="{{ url('') }}">Anikrishna Sodh
                                Darpan</a>.
                            All rights
                            reserved. | Design & Developed by&nbsp;<a href="{{ url('') }}">SAM softech</a>.
                        </p>
                    </div>
                </div>
                <div class="col-12 col-lg-4">
                    <div class="footer__bottom-left">
                        <ul class="footer__bottom-list justify-content-center justify-content-lg-end">
                            <li><a href="#">Terms & Conditions</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</footer>
<!-- ==== / footer end ==== -->
<!-- ==== custom cursor start ==== -->
<div class="mouseCursor cursor-outer"></div>
<div class="mouseCursor cursor-inner"></div>
<!-- ==== / custom cursor end ==== -->
<!-- ==== scroll to top start ==== -->
<button class="progress-wrap" aria-label="scroll indicator" title="back to top">
    <span></span>
    <svg class="progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">
        <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98" />
    </svg>
</button>
<!-- ==== / scroll to top end ==== -->

</div>
