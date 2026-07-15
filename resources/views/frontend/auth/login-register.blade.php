@extends('frontend.layouts.master')
@section('title') Login / Register @endsection

@section('content')
	<section class="common-banner">
    <div class="container">
        <div class="row">
            <div class="common-banner__content text-center">
                <h2 class="title-animation">Registration/Login</h2>
            </div>
        </div>
    </div>
    <div class="banner-bg">
        <img src="{{ static_asset('assets/assets_web/images/volunteer-bg.png') }}" alt="Image">
    </div>
</section>
<style>
    
</style>
<br><br>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="auth_complete_wrapper">

    <!-- Left Panel -->
    <div class="auth_left_side">

        <div class="auth_left_content">

            <h1>Welcome Back</h1>

            <p>
                Securely access your account, manage your profile and stay connected with our platform anytime anywhere.
            </p>

            <ul class="auth_feature_list">
                <li><i class="fa-solid fa-check"></i> Secure Login System</li>
                <li><i class="fa-solid fa-check"></i> Fast Registration Process</li>
                <li><i class="fa-solid fa-check"></i> Password Recovery Support</li>
                <li><i class="fa-solid fa-check"></i> Mobile Responsive Design</li>
            </ul>

        </div>

    </div>

    <!-- Right Panel -->
    <div class="auth_right_side">

        <div class="auth_tabs">

            <button type="button" style="text-align:center;" class="auth_tab_btn active" data-auth-tab="loginForm">
                Login
            </button>

            <button type="button" style="text-align:center;" class="auth_tab_btn" data-auth-tab="registerForm">
                Register
            </button>

            <button type="button" style="text-align:center;" class="auth_tab_btn" data-auth-tab="forgotForm">
                Forgot Password
            </button>

        </div>

        <!-- Login -->
        <div class="auth_form_box active" id="loginForm">

            <h2>Login Account</h2>

            @if(session('password_reset_success'))
                <div class="alert alert-success">{{ session('password_reset_success') }}</div>
            @endif
            <form id="login-form" method="POST" action="{{ route('login.post') }}">
            @csrf
            <div id="show-login-form-error" class="alert alert-danger" style="display:none"><div class="login-errors"></div></div>
            <div class="auth_input_group">
                <i class="fa fa-envelope"></i>
                <input type="text" name="username" placeholder="Email Address or Mobile Number" required>
            </div>

            <div class="auth_input_group">
                <i class="fa fa-lock"></i>
                <input type="password" name="password" placeholder="Password" required>
            </div>

            <div class="auth_options">
                <label><input type="checkbox"> Remember Me</label>
                <a href="#" data-auth-tab="forgotForm">Forgot Password?</a>
            </div>

            <button type="submit" class="auth_submit_btn login_button">
                Login Now
            </button>

            <div class="auth_small_text">
                Don't have an account?
                <a href="#" data-auth-tab="registerForm">Create Account</a>
            </div>
            </form>

        </div>

        <!-- Register -->
        <div class="auth_form_box" id="registerForm">

            <h2>Create Account</h2>

            <form id="register-form" method="POST" action="{{ route('register.post') }}">
            @csrf
            <div id="show-register-form-error" class="alert alert-danger" style="display:none"><div class="register-errors"></div></div>
            <div class="auth_input_group">
                <i class="fa fa-user"></i>
                <input type="text" name="family_name" placeholder="Family Name" required>
            </div>
			
			<div class="auth_input_group">
                <i class="fa fa-user"></i>
                <input type="text" name="first_name" placeholder="Full Name" required>
            </div>

            <div class="auth_input_group">
                <i class="fa fa-envelope"></i>
                <input type="email" name="email" placeholder="Email Address" required>
            </div>

            <div class="auth_input_group">
                <i class="fa fa-phone"></i>
                <input type="text" name="mobile" placeholder="Mobile Number" required>
            </div>

            <div class="auth_input_group">
                <i class="fa fa-lock"></i>
                <input type="password" name="password" placeholder="Password (minimum 8 characters)" minlength="8" required>
            </div>

            <div class="auth_input_group">
                <i class="fa fa-lock"></i>
                <input type="password" name="password_confirmation" placeholder="Confirm Password" minlength="8" required>
            </div>

            <button type="submit" class="auth_submit_btn register_button">
                Register Now
            </button>
            </form>

        </div>

        <!-- Forgot Password -->
        <div class="auth_form_box" id="forgotForm">

            <h2>Forgot Password</h2>

            <p style="margin-bottom:20px;color:#64748b;">
                Enter your registered email address and we'll send password reset instructions.
            </p>

            <form id="forgot-password-form" method="POST" action="{{ route('password.email') }}">
            @csrf
            <div id="forgot-password-error" class="alert alert-danger" style="display:none"></div>
            <div class="auth_input_group">
                <i class="fa fa-envelope"></i>
                <input type="email" name="email" placeholder="Registered Email Address" required>
            </div>

            <button type="submit" class="auth_submit_btn forgot_password_button">
                Send Reset Link
            </button>
            </form>

        </div>

    </div>

</div>
        </div>
    </div>
</div>

<br><br>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
    function showTab(tabId) {
        $('.auth_form_box').removeClass('active');
        $('#' + tabId).addClass('active');
        $('.auth_tab_btn').removeClass('active');
        $('.auth_tab_btn[data-auth-tab="' + tabId + '"]').addClass('active');
    }

    $(document).on('click', '[data-auth-tab]', function(e) {
        e.preventDefault();
        showTab($(this).data('auth-tab'));
    });

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

				$('.login-errors').html('');

				$.each(error.errors, function(index, value) {
					$('.login-errors').append(
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
        $('.register-errors').html('');
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
					clk_btn.prop('disabled', false).text('Register Now');
					showTab('loginForm');
					window.location.href = data.redirect;
                } else {
					clk_btn.prop('disabled', false).text('Register Now');
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
					$('.register-errors').append('<span class="text-danger">' + value + '</span><br>');
                });
				clk_btn.prop('disabled', false).text('Register Now');
			}
        });
    });

</script>


@endsection
