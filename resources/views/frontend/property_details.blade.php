@extends('frontend.layouts.master')
@section('title') Property Details @endsection

@section('meta_tags')

@endsection
@section('content')

  <!-- Page content -->
    <main class="content-wrapper">
      <div class="container pt-4 pb-5 mb-xxl-3">

        <!-- Breadcrumb -->
        <nav class="pb-2 pb-md-3" aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ url('') }}">Home</a></li>
            <li class="breadcrumb-item"><a href="{{ url('owner-properties') }}">Property for rent</a></li>
            <li class="breadcrumb-item active" aria-current="page">{{ $property_details->property_title }}</li>
          </ol>
        </nav>
		
		@php
			$images = $property_details->images;
			$videos = $property_details->videos;
			$totalImages = $images->count();
		@endphp

		@if($totalImages > 0)
		<div class="row g-3 g-lg-4">

			<!-- Main Image -->
			<div class="col-md-8">
				<a class="hover-effect-scale hover-effect-opacity position-relative d-flex rounded overflow-hidden"
				   href="{{ static_asset('uploads/property/'.$images[0]->image) }}"
				   data-glightbox
				   data-gallery="image-gallery">

					<i class="fi-zoom-in hover-effect-target fs-3 text-white position-absolute top-50 start-50 translate-middle opacity-0 z-2"></i>

					<span class="hover-effect-target position-absolute top-0 start-0 w-100 h-100 bg-black bg-opacity-25 opacity-0 z-1"></span>

					<div class="ratio hover-effect-target bg-body-tertiary rounded"
						 style="--fn-aspect-ratio: calc(450 / 856 * 100%)">
						<img src="{{ static_asset('uploads/property/'.$images[0]->image) }}"
							 alt="{{ $property_details->property_title }}">
					</div>
				</a>
			</div>

			<!-- Side Images -->
			<div class="col-md-4 vstack gap-3 gap-lg-4">

				@for($i = 1; $i <= 2; $i++)
					@if(isset($images[$i]))
						<a class="hover-effect-scale hover-effect-opacity position-relative d-flex rounded overflow-hidden"
						   href="{{ static_asset('uploads/property/'.$images[$i]->image) }}"
						   data-glightbox
						   data-gallery="image-gallery">

							<i class="fi-zoom-in hover-effect-target fs-3 text-white position-absolute top-50 start-50 translate-middle opacity-0 z-2"></i>

							<span class="hover-effect-target position-absolute top-0 start-0 w-100 h-100 bg-black bg-opacity-25 opacity-0 z-1"></span>

							<div class="ratio hover-effect-target bg-body-tertiary rounded"
								 style="--fn-aspect-ratio: calc(213 / 416 * 100%)">

								<img src="{{ static_asset('uploads/property/'.$images[$i]->image) }}"
									 alt="{{ $property_details->property_title }}">
							</div>

							@if($i == 2)
								<div class="btn btn-sm btn-light pe-none position-absolute end-0 bottom-0 z-2 mb-3 me-3">
									<i class="fi-camera fs-sm me-1 ms-n1"></i>
									{{ $totalImages }}
								</div>
							@endif

						</a>
					@endif
				@endfor

			</div>
		</div>

		<!-- Hidden Gallery Images -->
		@foreach($images->skip(3) as $image)
			<a href="{{ static_asset('uploads/property/'.$image->image) }}"
			   data-glightbox
			   data-gallery="image-gallery"
			   class="d-none">
			</a>
		@endforeach

		@endif

		@if($videos->count() > 0)
		<div class="row g-3 g-lg-4 mt-3">
			@foreach($videos as $video)
				<div class="col-md-6">
					<div class="rounded overflow-hidden bg-body-tertiary">
						<video class="w-100 d-block" controls preload="metadata" playsinline style="max-height:360px;object-fit:cover">
							<source src="{{ static_asset('uploads/property/videos/'.$video->video) }}">
						</video>
					</div>
				</div>
			@endforeach
		</div>
		@endif

       


        <!-- Listing details -->
        <div class="row pt-4 pb-2 pb-sm-3 pb-md-4 py-lg-5 mt-sm-2 mt-lg-0">

          <!-- Content sections -->
          <div class="col-lg-8 col-xl-7 pb-3 pb-sm-0 mb-4 mb-sm-5 mb-lg-0">

            <!-- Badges + Sharing and wishlist buttons -->
            <div class="d-flex align-items-center justify-content-between gap-4 mb-3">
              <div class="d-flex gap-2">
                <span class="badge text-bg-info d-inline-flex align-items-center">
                  Verified
                  <i class="fi-shield ms-1"></i>
                </span>
                <span class="badge text-bg-primary">New</span>
              </div>
              <div class="d-flex gap-2">
                <div class="dropdown" data-bs-toggle="tooltip" data-bs-custom-class="tooltip-sm" title="Share">
                  <button type="button" class="btn btn-icon btn-secondary bg-transparent border-0 animate-scale" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" aria-label="Share">
                    <i class="fi-share-2 animate-target fs-base"></i>
                  </button>
                  <ul class="dropdown-menu dropdown-menu-end" style="--fn-dropdown-min-width: 9.5rem">
                    <li>
                      <a class="dropdown-item" href="#!">
                        <i class="fi-facebook fs-base me-2"></i>
                        Facebook
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="#!">
                        <i class="fi-instagram fs-base me-2"></i>
                        Instagram
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="#">
                        <i class="fi-linkedin fs-base me-2"></i>
                        LinkedIn
                      </a>
                    </li>
                  </ul>
                </div>
                <button type="button" class="btn btn-icon btn-secondary bg-transparent border-0 animate-pulse" data-bs-toggle="tooltip" data-bs-custom-class="tooltip-sm" title="Wishlist" aria-label="Wishlist">
                  <i class="fi-heart animate-target fs-base"></i>
                </button>
              </div>
            </div>

            <!-- Price + Address + Facilities -->
            <div class="h2 pb-1 mb-2">{{ $property_details->property_title }}</div>
            <div class="h3 pb-1 mb-2">{{ $property_details->price }}</div>
            <p class="fs-sm pb-1 mb-2">{{ $property_details->locality }}, {{ $property_details->block_name }}, {{ $property_details->district_name }}, {{ $property_details->state_name }} - {{ $property_details->state_name }}</p>
            <div class="d-flex gap-2 mb-4">
               
              <div class="fs-sm"><i class="fi-map fs-base text-secondary-emphasis"></i> {{ $property_details->property_area }}</div>
            </div>

            <!-- Info message (Alert) -->
            <div class="alert d-flex alert-secondary fs-sm m-0" role="alert">
              <i class="fi-info fs-lg pe-1 me-2"></i>
              <div>We estimate this home will sell faster than 94% nearby.</div>
            </div>

            <!-- About -->
            <h2 class="h5 pt-4 pt-sm-5 mt-3 mt-sm-0">About</h2>
            <p class="fs-sm">
			{!! $property_details->property_details !!}
			</p>

            <!-- General info -->
            <h2 class="h5 pt-4 pt-sm-5 mt-3 mt-sm-0">Property Features</h2>
            <table class="table table-borderless w-auto fs-sm">
              <tbody>
				@foreach($property_details->featureValues as $feature)
					<tr>
					  <th scope="row" class="py-2 ps-0 pe-3">{{ ucwords(str_replace('_',' ',$feature->feature_key)) }}</th>
					  <td class="text-body py-2">{{ $feature->feature_value }}</td>
					</tr>
				@endforeach
              </tbody>
            </table>

      

            <!-- Location -->
            <h2 class="h5 pt-4 pt-sm-5 mt-3 mt-sm-0">Location</h2>
            <div class="overflow-x-auto pb-3 mb-2">
              <ul class="nav nav-pills nav-justified flex-nowrap gap-2">
               
              </ul>
            </div>

            <!-- Google map -->
            <table class="table table-borderless w-auto fs-sm">
				<tbody>
					<tr>
					  <th scope="row" class="py-2 ps-0 pe-3">State</th>
					  <td class="text-body py-2">{{ $property_details->state_name }}</td>
					</tr>
					<tr>
					  <th scope="row" class="py-2 ps-0 pe-3">District</th>
					  <td class="text-body py-2">{{ $property_details->district_name }}</td>
					</tr>
					<tr>
					  <th scope="row" class="py-2 ps-0 pe-3">Block</th>
					  <td class="text-body py-2">{{ $property_details->block_name }}</td>
					</tr>
					<tr>
					  <th scope="row" class="py-2 ps-0 pe-3">Address</th>
					  <td class="text-body py-2">{{ $property_details->locality }}</td>
					</tr>
					<tr>
					  <th scope="row" class="py-2 ps-0 pe-3">Pincode</th>
					  <td class="text-body py-2">{{ $property_details->pincode }}</td>
					</tr>
				</tbody>
			</table>

            <!-- Meta + Sharing and wishlist buttons -->
            <div class="d-flex align-items-center justify-content-between gap-3 pt-4">
              <div class="d-flex gap-3 fs-sm">
                <div>Published: <span class="fw-medium text-dark-emphasis">{{ date('M d, Y', strtotime($property_details->created_at)) }}</span></div>
                <div>Views: <span class="fw-medium text-dark-emphasis">158</span></div>
              </div>
              <div class="d-flex gap-2">
                <div class="dropdown" data-bs-toggle="tooltip" data-bs-custom-class="tooltip-sm" title="Share">
                  <button type="button" class="btn btn-icon btn-secondary bg-transparent border-0 animate-scale" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" aria-label="Share">
                    <i class="fi-share-2 animate-target fs-base"></i>
                  </button>
                  <ul class="dropdown-menu dropdown-menu-end" style="--fn-dropdown-min-width: 9.5rem">
                    <li>
                      <a class="dropdown-item" href="#!">
                        <i class="fi-facebook fs-base me-2"></i>
                        Facebook
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="#!">
                        <i class="fi-instagram fs-base me-2"></i>
                        Instagram
                      </a>
                    </li>
                    <li>
                      <a class="dropdown-item" href="#">
                        <i class="fi-linkedin fs-base me-2"></i>
                        LinkedIn
                      </a>
                    </li>
                  </ul>
                </div>
                <button type="button" class="btn btn-icon btn-secondary bg-transparent border-0 animate-pulse" data-bs-toggle="tooltip" data-bs-custom-class="tooltip-sm" title="Wishlist" aria-label="Wishlist">
                  <i class="fi-heart animate-target fs-base"></i>
                </button>
              </div>
            </div>
          </div>


          <!-- Sidebar with contact form that turns into offcanvas on screens < 992px wide (lg breakpoint) -->
          <aside class="col-lg-4 offset-xl-1">
            @php
              $agentName = trim(($agent_details->first_name ?? $property_details->cust_name ?? '') . ' ' . ($agent_details->last_name ?? ''));
              $agentName = $agentName !== '' ? $agentName : 'Agent';
              $agentEmail = $agent_details->email ?? $property_details->cust_email ?? null;
              $agentMobile = $agent_details->mobile ?? $property_details->cust_mobile ?? null;
              $agentCompany = $agent_details->company_name ?? null;
              $agentPhoto = !empty($agent_details->profile_pic)
                ? static_asset('uploads/profile/'.$agent_details->profile_pic)
                : static_asset('assets/assets_web/img/default-user.png');
            @endphp
            <div class="d-none d-lg-block" style="margin-top: -105px"></div>
            <div class="sticky-lg-top">
              <div class="d-none d-lg-block" style="height: 105px"></div>
              <div class="bg-body-tertiary rounded p-4">
                <div class="p-sm-2 p-lg-0 p-xl-2">
                  <div class="d-flex align-items-center position-relative mb-4">
                    <div class="ratio ratio-1x1 flex-shrink-0 bg-body-secondary rounded-circle overflow-hidden" style="width: 80px">
                      <img src="{{ $agentPhoto }}" alt="{{ $agentName }}">
                    </div>
                    <div class="ps-4">
                      <h5 class="mb-1">
                        <a class="hover-effect-underline stretched-link" href="javascript:void(0);">{{ $agentName }}</a>
                      </h5>
                      <p class="fs-sm mb-0">{{ $agentCompany ?? 'Listing agent' }}</p>
                    </div>
                  </div>
                  <ul class="nav flex-column gap-2 mb-4">
                    @if($agentEmail)
                    <li class="nav-item d-flex align-items-center position-relative">
                      <i class="fi-mail me-2"></i>
                      <a class="nav-link hover-effect-underline stretched-link fw-normal text-body p-0" href="mailto:{{ $agentEmail }}">{{ $agentEmail }}</a>
                    </li>
                    @endif
                    @if($agentMobile)
                    <li class="nav-item d-flex align-items-center position-relative">
                      <i class="fi-phone me-2"></i>
                      <a class="nav-link hover-effect-underline stretched-link fw-normal text-body p-0" href="tel:{{ $agentMobile }}">{{ $agentMobile }}</a>
                    </li>
                    @endif
                  </ul>
                  <button type="button" class="btn btn-lg btn-primary w-100" data-bs-toggle="modal" data-bs-target="#tourBooking">Schedule a tour</button>
                  <div class="fs-xs text-center pt-1 pb-2 my-2">It's free, cancel anytime</div>
                  <div class="d-flex align-items-center mb-3">
                    <hr class="w-100 m-0">
                    <div class="mt-n1 px-3">or</div>
                    <hr class="w-100 m-0">
                  </div>
                  <button type="button" class="btn btn-lg btn-outline-dark w-100" data-bs-toggle="modal" data-bs-target="#contactForm">Send message</button>
                </div>
              </div>
            </div>
          </aside>
        </div>
      </div>
    </main>
	
	<!-- Tour booking form modal -->
    <div class="modal fade" id="tourBooking" tabindex="-1" aria-labelledby="tourBookingLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" style="max-width: 400px">
        <form class="modal-content needs-validation" id="schedule-tour-form">
          <div class="modal-header border-0">
            <h5 class="modal-title" id="tourBookingLabel">Schedule a tour</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
		  <input type="hidden" name="property_id" value="{{ $property_details->id }}">
          <div class="modal-body pb-4 pt-0">
			<div class="row">
				<div style="display:none;" id="schedule-tour-form-enq-form-error" class="alert alert-danger col-md-12">
					<ul>
						<div class="errorMsgntainer"></div>
					</ul>
				</div>
			</div>
            <ul class="nav nav-pills nav-justified mb-4">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">In-person</a>
              </li>
              
            </ul>
            <div class="vstack gap-3">
              <div class="position-relative">
                <i class="fi-calendar position-absolute top-50 start-0 translate-middle-y ms-3"></i>
                <input type="date" name="enq_date" class="form-control form-icon-start bg-transparent" placeholder="Choose date *" required>
              </div>
              <div class="position-relative">
                <i class="fi-clock position-absolute top-50 start-0 translate-middle-y ms-3"></i>
                <input type="time" name="enq_time" class="form-control form-icon-start" id="time-12" placeholder="Choose time *" required>
              </div>
              <input type="text" name="name" class="form-control" placeholder="Name *" required>
              <input type="email" name="email" class="form-control" placeholder="Email *" required>
              <input type="tel" name="mobile" min="10" maxlength="10" pattern="[6789][0-9]{9}"  class="form-control" placeholder="Phone number">
            </div>
          </div>
          <div class="modal-footer border-0 pt-0 pb-4 px-4">
            <button type="submit" class="btn btn-lg btn-primary w-100 m-0 mb-3 scheduleTourButton">Schedule a tour</button>
            <p class="fs-xs m-0">This site is protected by reCAPTCHA and the Google <a class="hover-effect-underline text-decoration-none" href="#!">Privacy Policy</a> and <a class="hover-effect-underline text-decoration-none" href="#!">Terms of Service</a> apply.</p>
          </div>
        </form>
      </div>
    </div>


	<!-- Contact form modal -->
    <div class="modal fade" id="contactForm" tabindex="-1" aria-labelledby="contactFormLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" style="max-width: 400px">
        <form class="modal-content needs-validation" id="property-enquiry-form">
			@csrf
          <div class="modal-header border-0">
            <h5 class="modal-title" id="contactFormLabel">Learn more about this property</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
			
		  <input type="hidden" name="property_id" value="{{ $property_details->id }}">
          <div class="modal-body pb-4 pt-0">
            <p class="fs-sm">Complete this form so we can get in touch</p>
			<div class="row">
				<div style="display:none;" id="show-property-enq-form-error" class="alert alert-danger col-md-12">
					<ul>
						<div class="errorMsgntainer"></div>
					</ul>
				</div>
			</div>
            <div class="vstack gap-3">
              <input type="text" name="name" class="form-control" placeholder="Name *" required>
              <input type="email" name="email" class="form-control" placeholder="Email *" required>
              <input type="tel" name="mobile" min="10" maxlength="10" pattern="[6789][0-9]{9}" class="form-control" placeholder="Phone number">
              <textarea class="form-control" name="message" rows="5" placeholder="Write your message" required></textarea>
            </div>
          </div>
          <div class="modal-footer border-0 pt-0 pb-4 px-4">
            <button type="submit" class="btn btn-lg btn-primary w-100 m-0 mb-3 savePropertyEnqData">Send message</button>
            <p class="fs-xs m-0">This site is protected by reCAPTCHA and the Google <a class="hover-effect-underline text-decoration-none" href="#!">Privacy Policy</a> and <a class="hover-effect-underline text-decoration-none" href="#!">Terms of Service</a> apply.</p>
          </div>
        </form>
      </div>
    </div>
	
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
	
	$(document).on('click', '.savePropertyEnqData', function(e) {
		e.preventDefault();

		var clk_btn = $(this);

		clk_btn.prop('disabled', true).html('<i class="fa fa-spinner fa-spin"></i> Sending Message...');

		var formData = new FormData(document.getElementById("property-enquiry-form"));

		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			}
		});

		$.ajax({
			type: "POST",
			url: "{{ route('savePropertyEnquiry') }}",
			data: formData,
			processData: false,
			contentType: false,
			dataType: "JSON",

			success: function(data) {

				if (data.status == true) {

					$('#property-enquiry-form')[0].reset();
					$('#show-property-enq-form-error').hide();
					
					location.reload();

					Swal.fire({
						icon: 'success',
						title: 'Success',
						text: data.message,
						confirmButtonColor: '#3085d6'
					});

					// Restore button
					clk_btn.prop('disabled', false).text('Send Message');

				} else {

					// Restore button
					clk_btn.prop('disabled', false).text('Send Message');

					Swal.fire({
						icon: 'error',
						title: 'Error',
						text: data.message,
						confirmButtonColor: '#3085d6'
					});
				}
			},

			error: function(err) {

				document.getElementById('show-property-enq-form-error').style = "display: block";

				// Restore button
				clk_btn.prop('disabled', false).text('Send Message');

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
	
	$(document).on('click', '.scheduleTourButton', function(e) {
		e.preventDefault();

		var clk_btn = $(this);

		clk_btn.prop('disabled', true).html('<i class="fa fa-spinner fa-spin"></i> Sending Message...');

		var formData = new FormData(document.getElementById("schedule-tour-form"));

		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			}
		});

		$.ajax({
			type: "POST",
			url: "{{ route('saveScheduleTourForm') }}",
			data: formData,
			processData: false,
			contentType: false,
			dataType: "JSON",

			success: function(data) {

				if (data.status == true) {

					$('#schedule-tour-form')[0].reset();
					$('#schedule-tour-form-enq-form-error').hide();
					
					location.reload();

					Swal.fire({
						icon: 'success',
						title: 'Success',
						text: data.message,
						confirmButtonColor: '#3085d6'
					});

					// Restore button
					clk_btn.prop('disabled', false).text('Schedule a tour');

				} else {

					// Restore button
					clk_btn.prop('disabled', false).text('Schedule a tour');

					Swal.fire({
						icon: 'error',
						title: 'Error',
						text: data.message,
						confirmButtonColor: '#3085d6'
					});
				}
			},

			error: function(err) {

				document.getElementById('schedule-tour-form-enq-form-error').style = "display: block";

				// Restore button
				clk_btn.prop('disabled', false).text('Send Message');

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
