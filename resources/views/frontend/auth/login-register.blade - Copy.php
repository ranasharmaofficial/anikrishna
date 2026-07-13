@extends('frontend.layouts.master')
@section('title') Login / Register @endsection

@section('content')
	<div class="postt">

    </div>
    <main class="content-wrapper">

        <!-- Unique Login & Register Layout Section -->
        <section class="lrc-auth-section">
            <div class="lrc-global-container">
                <div class="lrc-auth-split-card">

                    <!-- Left Side: Premium Brand/Feature Showcase Sidepanel -->
                    <div class="lrc-showcase-panel">
                        <div class="lrc-showcase-content">
                            <!-- FontAwesome Icon used in badge -->
                            <span class="lrc-panel-badge"><i class="fa-solid fa-house-chimney"></i> Build Your Dream Space</span>
                            <h2 class="lrc-panel-title">Your Complete Property & Design Hub</h2>
                            <p class="lrc-panel-subtitle">Discover premium real estate insights, calculate home loan options accurately, and connect with top-tier interior design transformation experts all under one roof.</p>

                            <!-- Quick Trust Property Milestones with FontAwesome Icons -->
                            <div class="lrc-features-stack">
                                <div class="lrc-feature-node">
                                    <!-- FontAwesome Building Icon -->
                                    <span class="lrc-node-icon"><i class="fa-solid fa-building"></i></span>
                                    <div>
                                        <strong>Verified Property Insights</strong>
                                        <p>Access handpicked residential projects and real estate trends tailored for your region.</p>
                                    </div>
                                </div>
                                <div class="lrc-feature-node">
                                    <!-- FontAwesome Wand/Design Icon -->
                                    <span class="lrc-node-icon"><i class="fa-solid fa-wand-magic-sparkles"></i></span>
                                    <div>
                                        <strong>End-to-End Execution</strong>
                                        <p>From personalized structural layouts to turnkey modular interior handovers within 45 days.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="lrc-panel-footer">
                            <p>© 2026 Property & Design Portal. All Rights Reserved.</p>
                        </div>
                    </div>

                    <!-- Right Side: Forms Dynamic Column Block -->
                    <div class="lrc-forms-panel">

                        <!-- Tab Switching Handles Control Engine -->
                        <div class="lrc-tabs-header">
                            <button type="button" id="lrc-tab-login-btn" class="lrc-tab-toggle active" onclick="switchLrcAuthTab('login')">Sign In</button>
                            <button type="button" id="lrc-tab-register-btn" class="lrc-tab-toggle" onclick="switchLrcAuthTab('register')">Create Account</button>
                        </div>

                        <!-- FORM 1: SIGN IN BLOCK -->
                        <div id="lrc-login-wrapper" class="lrc-form-wrapper active">
                            <h3 class="lrc-view-heading">Welcome Back!</h3>
                            <p class="lrc-view-subheading">Please sign in to access your personal dashboard area.</p>

                            <form class="lrc-interactive-form" id="login-form" action="#" method="POST">

                                @if(session('password_reset_success'))
                                    <div class="alert alert-success">{{ session('password_reset_success') }}</div>
                                @endif

								<div class="row">
									<div style="display:none;" id="show-login-form-error" class="alert alert-danger col-md-12">
										<ul>
											<div class="errorMsgntainer"></div>
										</ul>
									</div>
								</div>

								<div class="lrc-form-group">
                                    <label class="lrc-field-label">Email Address / Mobile</label>
                                    <input type="text" name="username" class="lrc-input-control" placeholder="name@email.com or 10-digit number" required>
                                </div>

                                <div class="lrc-form-group">
                                    <div class="lrc-label-flex-row">
                                        <label class="lrc-field-label">Password</label>
                                        <a href="#" class="lrc-inline-link" id="show-forgot-password">Forgot Password?</a>
                                    </div>
                                    <input type="password" name="password" class="lrc-input-control" placeholder="••••••••" required>
                                </div>

                                <div class="lrc-checkbox-block">
                                    <label class="lrc-checkbox-label">
                                        <input type="checkbox" checked>
                                        <span class="lrc-checkbox-text">Keep me logged in on this device</span>
                                    </label>
                                </div>

                                <button type="submit" class="lrc-btn-submit login_button">Sign In Account</button>
                            </form>
                        </div>

                        <div id="lrc-forgot-wrapper" class="lrc-form-wrapper">
                            <h3 class="lrc-view-heading">Forgot Password?</h3>
                            <p class="lrc-view-subheading">Enter your account email and we will send you a secure reset link.</p>

                            <form class="lrc-interactive-form" id="forgot-password-form" method="POST">
                                @csrf
                                <div id="forgot-password-error" class="alert alert-danger" style="display:none;"></div>
                                <div class="lrc-form-group">
                                    <label class="lrc-field-label">Email Address</label>
                                    <input type="email" name="email" class="lrc-input-control" placeholder="name@email.com" required>
                                </div>
                                <button type="submit" class="lrc-btn-submit forgot_password_button">Send Reset Link</button>
                                <p class="text-center mt-3"><a href="#" class="lrc-inline-link" id="back-to-login">&larr; Back to Sign In</a></p>
                            </form>
                        </div>

                        <!-- FORM 2: REGISTRATION BLOCK -->
                        <div id="lrc-register-wrapper" class="lrc-form-wrapper">
                            <h3 class="lrc-view-heading">Get Started For Free</h3>
                            <p class="lrc-view-subheading">Sign up in seconds to access all premium digital solutions tools.</p>

                            <form class="lrc-interactive-form" action="#" method="POST" id="register-form">

								<div class="row">
									<div style="display:none;" id="show-register-form-error" class="alert alert-danger col-md-12">
										<ul>
											<div class="errorMsgntainer"></div>
										</ul>
									</div>
								</div>

								<!-- Group 1: User Type -->
								<div class="pp-form-group">
									<label class="pp-group-label">You are:</label>
									<div class="pp-pill-grid">
										@foreach($user_types as $key => $val)
											<label class="pp-pill-option">
												<input type="radio" name="user_type" value="{{ $val->id }}" @if($key+1==1) checked @endif>
												<span>{{ $val->name }}</span>
											</label>
										@endforeach
									</div>
								</div>
								<div class="lrc-form-group">
                                    <label class="lrc-field-label">Full Name</label>
                                    <input type="text" name="first_name" class="lrc-input-control" placeholder="e.g. Ramesh Kumar" required>
                                </div>

                                <div class="lrc-form-split-row">
                                    <div class="lrc-form-group">
                                        <label class="lrc-field-label">Mobile Number</label>
                                        <input type="tel" name="mobile" class="lrc-input-control" placeholder="10-digit phone" required>
                                    </div>
                                    <div class="lrc-form-group">
                                        <label class="lrc-field-label">Email Address</label>
                                        <input type="email" name="email" class="lrc-input-control" placeholder="name@email.com" required>
                                    </div>
                                </div>

                                <div class="lrc-form-group">
                                    <label class="lrc-field-label">Setup Password</label>
                                    <input type="password" name="password" class="lrc-input-control" placeholder="Minimum 8 characters" required>
                                </div>

                                <div class="lrc-checkbox-block">
                                    <label class="lrc-checkbox-label">
                                        <input type="checkbox" required checked>
                                        <span class="lrc-checkbox-text">I agree to the Terms of Service and Privacy Policy records statement.</span>
                                    </label>
                                </div>

                                <button type="submit" class="lrc-btn-submit lrc-btn-register register_button">Register Account &rarr;</button>
                            </form>
                        </div>

                        <!-- Social Login Separator Option (Optional Trust Addition) -->
                        {{--<div class="lrc-social-divider">
                            <span>Or Secure Instant Access With</span>
                        </div>
                        <div class="lrc-social-flex-row">
                            <button type="button" class="lrc-social-btn"><span class="lrc-google-ico">G</span> Google</button>
                        </div>--}}

                    </div>
                </div>
            </div>
        </section>

    </main>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
    $('#show-forgot-password').on('click', function(e) {
        e.preventDefault();
        $('.lrc-tabs-header').hide();
        $('.lrc-form-wrapper').removeClass('active');
        $('#lrc-forgot-wrapper').addClass('active');
    });

    $('#back-to-login').on('click', function(e) {
        e.preventDefault();
        $('.lrc-tabs-header').show();
        $('.lrc-form-wrapper').removeClass('active');
        $('#lrc-login-wrapper').addClass('active');
    });

    $('#forgot-password-form').on('submit', function(e) {
        e.preventDefault();
        const button = $('.forgot_password_button');
        button.prop('disabled', true).html('<i class="fa fa-spinner fa-spin"></i> Sending...');
        $('#forgot-password-error').hide().text('');

        $.ajax({
            type: 'POST',
            url: "{{ route('password.email') }}",
            data: $(this).serialize(),
            headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')},
            success: function(data) {
                Swal.fire({icon: 'success', title: 'Check Your Email', text: data.message});
                $('#forgot-password-form')[0].reset();
            },
            error: function(xhr) {
                const message = xhr.responseJSON && xhr.responseJSON.message
                    ? xhr.responseJSON.message
                    : 'We could not send the reset link. Please try again.';
                $('#forgot-password-error').show().text(message);
            },
            complete: function() {
                button.prop('disabled', false).text('Send Reset Link');
            }
        });
    });

    $(document).on('click', '.login_button', function(e) {
		e.preventDefault();

		var clk_btn = $(this);

		// Change text and disable button
		//clk_btn.prop('disabled', true).text('Signing In...');
		clk_btn.prop('disabled', true).html('<i class="fa fa-spinner fa-spin"></i> Signing In...');

		var formData = new FormData(document.getElementById("login-form"));

		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			}
		});

		$.ajax({
			type: "POST",
			url: "{{ route('login.post') }}",
			data: formData,
			processData: false,
			contentType: false,
			dataType: "JSON",

			success: function(data) {

				if (data.status == true) {

					$('#login-form')[0].reset();
					$('#show-login-form-error').hide();

					Swal.fire({
						icon: 'success',
						title: 'Success',
						text: data.message,
						confirmButtonColor: '#3085d6'
					}).then((result) => {
						if (result.isConfirmed) {
							window.location.href = data.redirect;
						}
					});

				} else {

					// Restore button
					clk_btn.prop('disabled', false).text('Login');

					Swal.fire({
						icon: 'error',
						title: 'Error',
						text: data.message,
						confirmButtonColor: '#3085d6'
					});
				}
			},

			error: function(err) {

				document.getElementById('show-login-form-error').style = "display: block";

				// Restore button
				clk_btn.prop('disabled', false).text('Login');

				let error = err.responseJSON;

				$('.errorMsgntainer').html('');

				$.each(error.errors, function(index, value) {
					$('.errorMsgntainer').append(
						'<span class="text-danger">' + value + '</span><br>'
					);
				});
			}
		});
	});


	$(document).on('click', '.register_button', function(e) {
        e.preventDefault();
        var clk_btn = $(".register_button");
        clk_btn.prop('disabled', true);
		clk_btn.prop('disabled', true).html('<i class="fa fa-spinner fa-spin"></i> Proceeding...');
        var formData = new FormData(document.getElementById("register-form"));
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }

        });
        $.ajax({
            type: "POST",
			url: "{{ route('register.post') }}",
			data: formData,
			processData: false,
			contentType: false,
			dataType: "JSON",
			success: function(data) {
                if (data.status == true) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        text: data.message,
                        confirmButtonColor: '#3085d6'
                    });
                    $('#register-form')[0].reset();
					document.getElementById('show-register-form-error').style = "display: none";
                } else {
					Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: data.message,
                        confirmButtonColor: '#3085d6'
                    });

                }
            }, error: function(err) {
				document.getElementById('show-register-form-error').style = "display: block";
                clk_btn.prop('disabled', false);
                let error = err.responseJSON;
                console.log(error);
                $.each(error.errors, function(index, value) {
                    $('.errorMsgntainer').append('<span class="text-danger">' + value + '<span>' + '<br>');
                });
			}
        });
    });

</script>


@endsection
