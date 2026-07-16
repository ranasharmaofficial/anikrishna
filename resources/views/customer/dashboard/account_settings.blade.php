@extends('frontend.layouts.master')
@section('title') Account Settings @endsection

@section('meta_tags')

@endsection
@section('content')
<section class="common-banner">
    <div class="container">
        <div class="row">
            <div class="common-banner__content text-center">
                <h2 class="title-animation">Account Settings</h2>
            </div>
        </div>
    </div>
    <div class="banner-bg">
        <img src="{{ static_asset('assets/assets_web/images/volunteer-bg.png') }}" alt="Image">
    </div>
</section>
<!-- Page content -->
	<div class="member_dash_wrapper">


          @include('customer.partials.left_bar')

		<div class="member_dash_content">
			<div class="member_dash_card">
			  <!-- Account settings content -->
			  <div class="col-lg-12">
				<h1 class="h2 pb-2 pb-lg-3">Account settings</h1>

				<!-- Nav pills -->
				<div class="nav overflow-x-auto mb-3">
				  <ul class="nav nav-pills flex-nowrap gap-2 pb-2 mb-1" role="tablist">
					<li class="nav-item me-1" role="presentation">
					  <button type="button" class="nav-link text-nowrap active" id="personal-info-tab" data-bs-toggle="pill" data-bs-target="#personal-info" role="tab" aria-controls="personal-info" aria-selected="true">
						Personal info
					  </button>
					</li>
					<li class="nav-item me-1" role="presentation">
					  <button class="nav-link text-nowrap" id="security-tab" data-bs-toggle="pill" data-bs-target="#security" type="button" role="tab" aria-controls="security" aria-selected="false">
						Password and security
					  </button>
					</li>
					 
				  </ul>
				</div>

				<div class="tab-content">

				  <!-- Personal info tab -->
				  <div class="tab-pane fade show active" id="personal-info" role="tabpanel" aria-labelledby="personal-info-tab">
					<div class="vstack gap-4">
					

					  <!-- Profile picture (Avatar) -->
					<div class="d-flex align-items-center gap-4 mb-4">
		
						<div class="position-relative">
							<img id="profilePreview"
								 src="{{ !empty($customerDetails->profile_pic) ? static_asset('uploads/all/'.$customerDetails->profile_pic) : static_asset('assets/assets_web/img/default-user.png') }}"
								 class="rounded-circle border"
								 width="120"
								 height="120"
								 style="object-fit:cover;">

							<label for="profile_pic"
								   class="btn btn-sm btn-primary position-absolute bottom-0 end-0 rounded-circle">
								<i class="fa fa-camera"></i>
							</label>

							<input type="file"
								   id="profile_pic"
								   name="profile_pic"
								   accept="image/jpeg,image/jpg,image/png"
								   style="display:none;">
						</div>

						<div>
							<p class="text-muted mb-2">
								Your profile photo will appear on your profile and directory listing.
								PNG or JPG no bigger than 1000px wide and tall.
							</p>

							<button type="button" class="btn btn-outline-secondary btn-sm" id="uploadProfileBtn">
								<i class="fa fa-upload me-2"></i> Update Photo
							</button>
						</div>

					</div>

					  <!-- Settings form -->
					  <form class="needs-validation" method="post" action="{{ route('customer.updateCustomerProfileDetails') }}">
						@csrf
						<div class="row row-cols-1 row-cols-sm-2 g-4 mb-4">
						  <div class="col position-relative">
							<label for="fn" class="form-label fs-base">Family name *</label>
							<input type="text" class="form-control form-control-lg" id="fn" name="family_name" value="{{ $customerDetails->family_name }}" required>
							<div class="invalid-tooltip bg-transparent p-0">Enter your Family name!</div>
						  </div>
						  <div class="col position-relative">
							<label for="ln" class="form-label fs-base">First name *</label>
							<input type="text" class="form-control form-control-lg" id="ln" name="first_name" value="{{ $customerDetails->first_name }}" required>
							<div class="invalid-tooltip bg-transparent p-0">Enter your First name!</div>
						  </div>
						  <div class="col position-relative">
							<label for="email" class="form-label d-flex align-items-center fs-base">Email address * <!--<span class="badge text-danger bg-danger-subtle ms-2">Verify email</span>--></label>
							<input type="email" class="form-control form-control-lg" id="email" name="email" value="{{ $customerDetails->email }}" required>
							<div class="invalid-tooltip bg-transparent p-0">Enter a valid email address!</div>
						  </div>
						  <div class="col position-relative">
							<label for="phone" class="form-label d-flex align-items-center fs-base">Phone number * <!--<span class="badge bg-success ms-2">Verified</span>--></label>
							<input type="tel" class="form-control form-control-lg" id="phone" name="mobile" data-input-format='{"numericOnly": true, "delimiters": ["(", ")", " ", "-", " "], "blocks": [0, 3, 0, 3, 4]}' value="{{ $customerDetails->mobile }}" placeholder="(___) ___-____" required>
							<div class="invalid-tooltip bg-transparent p-0">Enter a valid phone number!</div>
						  </div>
						  
						</div>
						<div class="position-relative mb-4">
						  <label for="address" class="form-label fs-base">Address *</label>
						  <input type="text" class="form-control form-control-lg" name="address" id="address" value="{{ $customerDetails->address }}" required>
						  <div class="invalid-tooltip bg-transparent p-0">Enter your address!</div>
						</div>
						
						<div class="d-flex gap-3">
						  <a class="btn btn-lg btn-secondary" href="{{ url('customer/dashboard') }}">Cancel</a>
						  <button type="submit" class="btn btn-lg btn-dark">Save changes</button>
						</div>
					  </form>
					</div>
				  </div>


				  <!-- Password and security tab -->
				<div class="tab-pane fade" id="security" role="tabpanel" aria-labelledby="security-tab">
					
					<!-- Change password form -->
					<form class="needs-validation" id="reset-password-form" method="post" enctype="multipart/form-data">
						@csrf
						
						<div style="display:none;" id="reset-password-form-error" class="alert alert-danger col-md-12">
							<ul>
								<div class="errorMsgntainer"></div>
							</ul>
						</div>
						
					  <div class="row row-cols-1 row-cols-sm-2 g-4 mb-4">
						<div class="col">
						  <label for="current-password" class="form-label fs-base">Current password</label>
						  <div class="password-toggle">
							<input type="password" name="current_password" class="form-control form-control-lg" id="current-password" required>
							<div class="invalid-tooltip bg-transparent p-0">Incorrect password. Please try again.</div>
							<label class="password-toggle-button" aria-label="Show/hide password">
							  <input type="checkbox" class="btn-check">
							</label>
						  </div>
						</div>
					  </div>
					  <div class="row row-cols-1 row-cols-sm-2 g-4 mb-4">
						<div class="col">
						  <label for="new-password" class="form-label fs-base">New password <span class="fs-sm fw-normal text-body-secondary">(Min 8 chars)</span></label>
						  <div class="password-toggle">
							<input type="password" name="new_password" class="form-control form-control-lg" minlength="8" id="new-password" required>
							<div class="invalid-tooltip bg-transparent p-0">Please ensure password is at least 8 characters long.</div>
							<label class="password-toggle-button" aria-label="Show/hide password">
							  <input type="checkbox" class="btn-check">
							</label>
						  </div>
						</div>
						<div class="col">
						  <label for="confirm-new-password" class="form-label fs-base">Confirm new password</label>
						  <div class="password-toggle">
							<input type="password" name="confirm_password" class="form-control form-control-lg" minlength="8" id="confirm-new-password" required>
							<div class="invalid-tooltip bg-transparent p-0">Passwords do not match.</div>
							<label class="password-toggle-button" aria-label="Show/hide password">
							  <input type="checkbox" class="btn-check">
							</label>
						  </div>
						</div>
					  </div>
					  <div class="d-flex gap-3">
						<button type="reset" class="btn btn-lg btn-secondary">Cancel</button>
						<button type="submit" class="btn btn-lg btn-dark update_password">Update password</button>
					  </div>
					</form>
				</div>


				  <!-- Notification settings tab -->
				  <div class="tab-pane fade" id="notifications" role="tabpanel" aria-labelledby="notifications-tab">

					<!-- Item -->
					<div class="d-sm-flex align-items-center justify-content-between border-bottom pb-4">
					  <div class="me-4 mb-md-2">
						<h3 class="h6 mb-2">New rental alerts</h3>
						<p class="fs-sm pb-1 pb-sm-0 mb-sm-0">New rentals that match your <a class="text-body" href="account-favorites.html">Favorites</a></p>
					  </div>
					  <div class="d-flex gap-4 gap-xl-5 mb-md-2">
						<div class="form-check form-switch d-flex align-items-center ps-0 mb-0">
						  <label for="email-1" class="form-check-label">Email</label>
						  <input type="checkbox" class="form-check-input ms-2" role="switch" id="email-1" checked>
						</div>
						<div class="form-check form-switch d-flex align-items-center ps-0 mb-0">
						  <label for="phone-1" class="form-check-label mb-1">Phone</label>
						  <input type="checkbox" class="form-check-input ms-2" role="switch" id="phone-1">
						</div>
					  </div>
					</div>

					<!-- Item -->
					<div class="d-sm-flex align-items-center justify-content-between border-bottom py-4">
					  <div class="me-4 my-md-2">
						<h3 class="h6 mb-2">Rental status updates</h3>
						<p class="fs-sm pb-1 pb-sm-0 mb-sm-0">Updates like price changes and off-market status on your <a class="text-body" href="account-favorites.html">Favorites</a></p>
					  </div>
					  <div class="d-flex gap-4 gap-xl-5 my-md-2">
						<div class="form-check form-switch d-flex align-items-center ps-0 mb-0">
						  <label for="email-2" class="form-check-label">Email</label>
						  <input type="checkbox" class="form-check-input ms-2" role="switch" id="email-2" checked>
						</div>
						<div class="form-check form-switch d-flex align-items-center ps-0 mb-0">
						  <label for="phone-2" class="form-check-label mb-1">Phone</label>
						  <input type="checkbox" class="form-check-input ms-2" role="switch" id="phone-2">
						</div>
					  </div>
					</div>

					<!-- Item -->
					<div class="d-sm-flex align-items-center justify-content-between border-bottom py-4">
					  <div class="me-4 my-md-2">
						<h3 class="h6 mb-2">Finder recommendations</h3>
						<p class="fs-sm pb-1 pb-sm-0 mb-sm-0">Rentals we think you'll like. These recommendations may be slightly outside your search criteria</p>
					  </div>
					  <div class="d-flex gap-4 gap-xl-5 my-md-2">
						<div class="form-check form-switch d-flex align-items-center ps-0 mb-0">
						  <label for="email-3" class="form-check-label">Email</label>
						  <input type="checkbox" class="form-check-input ms-2" role="switch" id="email-3">
						</div>
						<div class="form-check form-switch d-flex align-items-center ps-0 mb-0">
						  <label for="phone-3" class="form-check-label mb-1">Phone</label>
						  <input type="checkbox" class="form-check-input ms-2" role="switch" id="phone-3">
						</div>
					  </div>
					</div>

					<!-- Item -->
					<div class="d-sm-flex align-items-center justify-content-between border-bottom py-4">
					  <div class="me-4 my-md-2">
						<h3 class="h6 mb-2">Featured news</h3>
						<p class="fs-sm pb-1 pb-sm-0 mb-sm-0">News and tips you may be interested in</p>
					  </div>
					  <div class="d-flex gap-4 gap-xl-5 my-md-2">
						<div class="form-check form-switch d-flex align-items-center ps-0 mb-0">
						  <label for="email-4" class="form-check-label">Email</label>
						  <input type="checkbox" class="form-check-input ms-2" role="switch" id="email-4">
						</div>
						<div class="form-check form-switch d-flex align-items-center ps-0 mb-0">
						  <label for="phone-4" class="form-check-label mb-1">Phone</label>
						  <input type="checkbox" class="form-check-input ms-2" role="switch" id="phone-4" checked>
						</div>
					  </div>
					</div>

					<!-- Item -->
					<div class="d-sm-flex align-items-center justify-content-between border-bottom py-4">
					  <div class="me-4 my-md-2">
						<h3 class="h6 mb-2">Finder extras</h3>
						<p class="fs-sm pb-1 pb-sm-0 mb-sm-0">Occasional notifications about new features to make finding the perfect rental easy</p>
					  </div>
					  <div class="d-flex gap-4 gap-xl-5 my-md-2">
						<div class="form-check form-switch d-flex align-items-center ps-0 mb-0">
						  <label for="email-5" class="form-check-label">Email</label>
						  <input type="checkbox" class="form-check-input ms-2" role="switch" id="email-5" checked>
						</div>
						<div class="form-check form-switch d-flex align-items-center ps-0 mb-0">
						  <label for="phone-5" class="form-check-label mb-1">Phone</label>
						  <input type="checkbox" class="form-check-input ms-2" role="switch" id="phone-5" checked>
						</div>
					  </div>
					</div>
				  </div>
				</div>
			  </div>
			</div>
		</div>
      </div>
     


	<script>
	$(document).on('click', '.update_password', function(e) {
		e.preventDefault();

		var clk_btn = $(this);

		clk_btn.prop('disabled', true).html('<i class="fa fa-spinner fa-spin"></i> Updating Password...');
		var formData = new FormData(document.getElementById("reset-password-form"));

		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			}
		});

		$.ajax({
			type: "POST",
			url: "{{ route('customer.updateCustomerPassword') }}",
			data: formData,
			processData: false,
			contentType: false,
			dataType: "JSON",

			success: function(data) {

				if (data.status == true) {

					$('#reset-password-form')[0].reset();
					$('#reset-password-form-error').hide();
					clk_btn.prop('disabled', false).text('Update Password');
					Swal.fire({
						icon: 'success',
						title: 'Success',
						text: data.message,
						confirmButtonColor: '#3085d6'
					});
					// window.location.href = data.redirect_url;

				} else {

					// Restore button
					clk_btn.prop('disabled', false).text('Start Now');

					Swal.fire({
						icon: 'error',
						title: 'Error',
						text: data.message,
						confirmButtonColor: '#3085d6'
					});
				}
			},

			error: function(err) {

				document.getElementById('reset-password-form-error').style = "display: block";

				// Restore button
				clk_btn.prop('disabled', false).text('Update Password');

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
	
	$(document).ready(function () {

		// Preview image
		$('#profile_pic').on('change', function () {

			let file = this.files[0];

			if(file){
				let reader = new FileReader();

				reader.onload = function(e){
					$('#profilePreview').attr('src', e.target.result);
				};

				reader.readAsDataURL(file);
			}
		});

		// Upload image
		$('#uploadProfileBtn').on('click', function () {

			let file = $('#profile_pic')[0].files[0];

			if (!file) {
				Swal.fire('Error', 'Please select an image.', 'error');
				return;
			}

			let formData = new FormData();
			formData.append('profile_pic', file);

			$.ajax({
				url: "{{ route('customer.update.profile.photo') }}",
				type: "POST",
				data: formData,
				processData: false,
				contentType: false,
				headers: {
					'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
				},
				beforeSend: function () {
					$('#uploadProfileBtn').prop('disabled', true).text('Uploading...');
				},
				success: function (response) {

					$('#uploadProfileBtn').prop('disabled', false).html('<i class="fa fa-upload me-2"></i> Update Photo');

					if (response.status) {

						$('#profilePreview').attr('src', response.image);

						Swal.fire(
							'Success',
							response.message,
							'success'
						);
					} else {
						Swal.fire('Error', response.message, 'error');
					}
				},
				error: function (xhr) {

					$('#uploadProfileBtn').prop('disabled', false).html('<i class="fa fa-upload me-2"></i> Update Photo');

					let message = 'Something went wrong';

					if (xhr.responseJSON && xhr.responseJSON.message) {
						message = xhr.responseJSON.message;
					}

					Swal.fire('Error', message, 'error');
				}
			});

		});

	});
	</script>


@endsection
