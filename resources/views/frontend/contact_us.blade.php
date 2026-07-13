@extends('frontend.layouts.master')
@section('title') Contact Us @endsection

@section('meta_tags')
@endsection

@section('content')
<section class="common-banner">
    <div class="container">
        <div class="row">
            <div class="common-banner__content text-center">
                <h2 class="title-animation">Contact Us</h2>
            </div>
        </div>
    </div>
    <div class="banner-bg">
        <img src="{{ static_asset('assets/assets_web/images/volunteer-bg.png') }}" alt="Image">
    </div>
</section>
<section class="contact-main volunteer">
    <div class="container">
        <div class="row gutter-40">
            <div class="col-12 col-xl-6">
                <div class="contact__content">
                    <div class="section__content" data-aos="fade-up" data-aos-duration="1000">

                        <h2 class="title-animation">Contact Us</h2>
                        <p>A Multidisciplinary, Biannual, Double-Blind Peer-Reviewed
                            International Research Journal
                        </p>
                    </div>
                    <div class="contact-main__inner cta">
                        <div class="contact-main__single">
                            <div class="thumb">
                                <i class="fa-solid fa-location-dot"></i>
                            </div>
                            <div class="content">
                                <h6>Location</h6>
                                <p><a href="" target="_blank">
                                        Bihar, Patna
                                    </a>
                                </p>
                            </div>
                        </div>
                        <div class="contact-main__single">
                            <div class="thumb">
                                <i class="fa-solid fa-phone"></i>
                            </div>
                            <div class="content">
                                <h6>Phone</h6>
                                <p><a href="92644-58499">+91-92644- 58499 </a></p>
                            </div>
                        </div>
                        <div class="contact-main__single">
                            <div class="thumb">
                                <i class="fa-solid fa-envelope"></i>
                            </div>
                            <div class="content">
                                <h6>Email</h6>
                                <p><a
                                        href="anikrishnasodhdarpan@tnafoundation.org">anikrishnasodhdarpan@tnafoundation.org</a>
                                </p>

                            </div>
                        </div>
                        <div class="contact-main__single">
                            <div class="thumb">
                                <i class="fa-solid fa-share-nodes"></i>
                            </div>
                            <div class="content">
                                <h6>Social</h6>
                                <div class="social">
                                    <a href="https://www.facebook.com/" target="_blank"
                                        aria-label="share us on facebook" title="facebook">
                                        <i class="fa-brands fa-facebook-f"></i>
                                    </a>

                                    <a href="https://x.com/" target="_blank" aria-label="share us on twitter"
                                        title="twitter">
                                        <i class="fa-brands fa-twitter"></i>
                                    </a>
                                    <a href="https://www.linkedin.com/" target="_blank"
                                        aria-label="share us on linkedin" title="linkedin">
                                        <i class="fa-brands fa-linkedin-in"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="contact-main__thumb cta">
                        <iframe
                            src="
                            https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1837636.8593539621!2d84.48751744248386!3d25.89794895105686!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39ed5844f0bb6903%3A0x57ad3fed1bbae325!2sBihar!5e0!3m2!1sen!2sin!4v1769586460467!5m2!1sen!2sin"
                            width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
            </div>
            <div class="col-12 col-xl-6">
                <div class="contact__form volunteer__form checkout__form" data-aos="fade-up" data-aos-duration="1000"
                    data-aos-delay="100">
                    <div class="volunteer__form-content">
                        <h4 class="title-animation">Fill Up The Form</h4>
                        <p>Your email address will not be published. Required fields are marked *</p>
                    </div>
                    <form action="#" method="post" class="cta">
                        <div class="input-single">
                            <input type="text" name="full-name" id="fullName" placeholder="Enter Name" required>
                            <i class="fa-solid fa-user"></i>
                        </div>
                        <div class="input-single">
                            <input type="email" name="c-email" id="cEmail" placeholder="Enter Email" required>
                            <i class="fa-solid fa-envelope"></i>
                        </div>
                        <div class="input-single">
                            <input type="text" name="phone-number" id="phoneNumber" placeholder="Phone Number" required>
                            <i class="fa-solid fa-phone"></i>
                        </div>
                        <div class="input-single alter-input">
                            <textarea name="contact-message" id="contactMessage"
                                placeholder="Your Message..."></textarea>
                            <i class="fa-solid fa-comments"></i>
                        </div>
                        <div class="form-cta">
                            <button type="submit" aria-label="submit message" title="submit message"
                                class="btn--primary">Get A Quote <i class="fa-solid fa-arrow-right"></i></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
	document.getElementById('acceptTerms').addEventListener('change', function () {
		document.getElementById('submitBtn').disabled = !this.checked;
	});
</script>
	<script>
		$(document).on('click', '.make_enquiry', function(e) {
			e.preventDefault();
			var clk_btn = $(".make_enquiry");
			clk_btn.prop('disabled', true);
			var formData = new FormData(document.getElementById("contact-enquiry-form"));
			$.ajaxSetup({
				headers: {
					'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
				}

			});
			$.ajax({
				type: "POST"
				, url: "{{ route('enq.postOnlineEnquiry') }}"
				, data: formData
				, processData: false
				, contentType: false
				, dataType: "JSON"
				, success: function(data) {
					// console.log('status ' + data.status);
					if (data.status == true) {
						toastr.success('Thanyou For Your Enquiry.');
						location.reload();
					} else {
						toastr.error('Something went wrong.');
					}
				}
				, error: function(err) {

					document.getElementById('show-contact-form-error').style = "display: block";
					clk_btn.prop('disabled', false);
					let error = err.responseJSON;
					console.log(error);
					$.each(error.errors, function(index, value) {
						$('.errorMsgntainer').append('<span class="text-danger">' + value +

							'<span>' + '<br>');
					});

				}
			});
		});

	</script>

@endsection
