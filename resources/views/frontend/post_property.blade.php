@extends('frontend.layouts.master')
@section('title') Post Property @endsection

@section('meta_tags')
@endsection

@section('content')

<div class="postt">
    <img src="{{ static_asset('assets/assets_web/img/banner.jpg') }}" width="100%">
</div>
    <main class="content-wrapper">
		<section class="pp-hero-section">
			<div class="pp-container">
				
				<!-- Left Column: Content & Features -->
				<div class="pp-content-col">
					<h1 class="pp-main-heading">
						Post your property Ad to sell or rent online for <span class="pp-highlight">Free!</span>
					</h1>
					
					<ul class="pp-features-list">
						<li class="pp-feature-item">
							<span class="pp-check-icon">✓</span>
							<span class="pp-feature-text">Get Access to 4 Lakh+ Buyers & Tenants</span>
						</li>
						<li class="pp-feature-item">
							<span class="pp-check-icon">✓</span>
							<span class="pp-feature-text">Sell/Rent Faster with Premium Matching Services</span>
						</li>
						<li class="pp-feature-item">
							<span class="pp-check-icon">✓</span>
							<span class="pp-feature-text">Get Expert Advice on Market Trends & Valuation</span>
						</li>
					</ul>
				</div>

				<!-- Right Column: Interactive Form Card -->
				<div class="pp-form-col">
					<div class="pp-form-card">
						<h2 class="pp-form-title">Let's get you started</h2>
						
						<form action="{{ route('savePropertyPartOne') }}" id="property-form-one" method="POST">
							@csrf
							<div class="row">
								<div style="display:none;" id="show-form-error" class="alert alert-danger col-md-12">
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

							<!-- Group 2: Purpose -->
							<div class="pp-form-group">
								<label class="pp-group-label">You are here to:</label>
								<div class="pp-pill-grid">
									<label class="pp-pill-option">
										<input type="radio" name="purpose" value="sell" checked>
										<span>Sell</span>
									</label>
									<label class="pp-pill-option">
										<input type="radio" name="purpose" value="rent">
										<span>Rent/Lease</span>
									</label>
									<label class="pp-pill-option">
										<input type="radio" name="purpose" value="pg">
										<span>List as PG</span>
									</label>
								</div>
							</div>

							<!-- Group 3: Phone Number Input -->
							<div class="pp-form-group">
								<label class="pp-group-label" for="name">Your Name</label>
								<div class="pp-phone-input-wrapper">
									<input type="tel" id="name" name="name" class="pp-main-tel-input" placeholder="Name" required>
								</div>
							</div>
							
							<!-- Group 3: Phone Number Input -->
							<div class="pp-form-group">
								<label class="pp-group-label" for="ppWhatsAppNumber">Your contact number</label>
								<div class="pp-phone-input-wrapper">
									<select class="pp-country-code" aria-label="Country Code">
										<option selected value="+91">IND +91</option>
										{{-- <option value="+1">USA +1</option>
										<option value="+44">UK +44</option>--}}
									</select>
									<input type="tel" id="ppWhatsAppNumber" name="whatsapp" class="pp-main-tel-input" placeholder="WhatsApp Number" required>
								</div>
								<span class="pp-error-msg" style="display: none;">Compulsory field. Mobile number must be filled out!!</span>
							</div>

							<!-- Info Alert Box -->
							<div class="pp-info-alert">
								<span class="pp-whatsapp-icon">💬</span>
								<p class="pp-info-text">Enter your <strong>WhatsApp No.</strong> to get instant enquiries from Buyer/Tenant</p>
							</div>

							<!-- Action Button -->
							<button type="submit" class="pp-btn-submit saveData">Start Now</button>
							
						</form>
					</div>
				</div>

			</div>
		</section>
    </main>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
	
	$(document).on('click', '.saveData', function(e) {
		e.preventDefault();

		var clk_btn = $(this);

		clk_btn.prop('disabled', true).html('<i class="fa fa-spinner fa-spin"></i> Saving Data...');

		var formData = new FormData(document.getElementById("property-form-one"));

		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			}
		});

		$.ajax({
			type: "POST",
			url: "{{ route('savePropertyPartOne') }}",
			data: formData,
			processData: false,
			contentType: false,
			dataType: "JSON",

			success: function(data) {

				if (data.status == true) {

					$('#property-form-one')[0].reset();
					$('#show-form-error').hide();

					window.location.href = data.redirect_url;

				} else {

					// Restore button
					clk_btn.prop('disabled', false).text('Start Now');

					// Swal.fire({
						// icon: 'error',
						// title: 'Error',
						// text: data.message,
						// confirmButtonColor: '#3085d6'
					// });
				}
			},

			error: function(err) {

				document.getElementById('show-login-form-error').style = "display: block";

				// Restore button
				clk_btn.prop('disabled', false).text('Start Now');

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
	
	
	</script>
	
	
	
	
@endsection
