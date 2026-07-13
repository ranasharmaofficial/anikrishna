@extends('frontend.layouts.master')
@section('title') Post Property @endsection

@section('meta_tags')
@endsection

@section('content')

<main class="content-wrapper">
  
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Custom styles to match exact colors */
        .bg-mb-red { background-color: #d8232a; }
        .text-mb-red { color: #d8232a; }
        .border-mb-red { border-color: #d8232a; }
    </style>


   
    <main class="max-w-6xl mx-auto my-6 p-4 md:p-8 flex flex-col lg:flex-row gap-8">
        
        <section class="w-full lg:w-2/3 bg-white p-6 md:p-8 rounded-lg shadow-sm border border-gray-200">
            <h1 class="text-2xl font-bold text-gray-900">Sell or Rent your Property</h1>
            <p class="text-sm text-gray-600 mt-1">You are posting this property for <span class="bg-yellow-100 text-yellow-800 font-bold px-1.5 py-0.5 rounded text-xs">FREE!</span></p>

            <form id="propertyDetailsForm" class="mt-8 space-y-8" action="" enctype="multipart/form-data" method="post">
                <div style="display:none;" id="post-property-form-error" class="alert alert-danger col-md-12">
					<ul>
						<div class="errorMsgntainer"></div>
					</ul>
				</div>
                <div>
                    <h2 class="text-base font-bold text-gray-900 border-b pb-2 mb-4">Personal Details</h2>
                    
                    <div class="mb-5">
                        <label class="block text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">I am</label>
                        <div class="flex space-x-6">
                            
							@foreach($user_types as $key => $val)
								<label class="inline-flex items-center cursor-pointer">
									<input @if($property_part_one['user_type']==$val->id) checked @endif type="radio" name="user_type" value="{{ $val->id }}" class="w-4 h-4 text-mb-red focus:ring-mb-red border-gray-300">
									<span class="ml-2 text-sm font-medium text-gray-700">{{ $val->name }}</span>
								</label>
							@endforeach
							
                        </div>
                    </div>

                    <div class="space-y-5 max-w-md">
                        <div>
                            <label for="userName" class="block text-xs font-semibold text-gray-500 uppercase mb-1">Name</label>
                            <input type="text" id="userName" name="name" value="{{ $property_part_one['name'] }}" required placeholder="Enter Your Name" 
                                   class="w-full border-b-2 border-gray-300 focus:border-mb-red outline-none py-1.5 transition text-sm">
                        </div>

                        <div>
                            <label class="block text-xs font-semibold text-gray-500 uppercase mb-1">Mobile</label>
                            <div class="flex">
                                <select id="countryCode" class="border-b-2 border-gray-300 bg-transparent py-1.5 text-sm mr-2 outline-none focus:border-mb-red">
                                    <option value="+91">IND +91</option>
                                </select>
                                <input type="tel" id="userMobile" name="mobile" value="{{ $property_part_one['whatsapp'] }}" required pattern="[0-9]{10}" placeholder="Enter 10 digit mobile number" 
                                       class="w-full border-b-2 border-gray-300 focus:border-mb-red outline-none py-1.5 transition text-sm">
                            </div>
                        </div>

                        <div class="bg-amber-50 border border-amber-200 rounded p-3 flex items-start space-x-2.5">
                            <i class="fab fa-whatsapp text-green-600 text-lg mt-0.5"></i>
                            <p class="text-xs text-amber-900 leading-relaxed">
                                Enter your <span class="font-bold">WhatsApp No.</span> to get enquiries from Buyer/Tenant
                            </p>
                        </div>

                        <div>
                            <label for="userEmail" class="block text-xs font-semibold text-gray-500 uppercase mb-1">Email</label>
                            <input type="email" name="email" id="userEmail" required placeholder="Enter Your Email" 
                                   class="w-full border-b-2 border-gray-300 focus:border-mb-red outline-none py-1.5 transition text-sm">
                        </div>
                    </div>
                </div>

                <div>
                    <h2 class="text-base font-bold text-gray-900 border-b pb-2 mb-4">Property Details</h2>
                    
                    <div class="mb-5">
                        <label class="block text-xs font-semibold text-gray-500 uppercase tracking-wider mb-2">For</label>
                        <div class="flex space-x-6">
                            <label class="inline-flex items-center cursor-pointer">
                                <input type="radio" name="propertyPurpose" value="Sale" @if($property_part_one['purpose']=='sell') checked @endif  class="w-4 h-4 text-mb-red focus:ring-mb-red border-gray-300">
                                <span class="ml-2 text-sm font-medium text-gray-700">Sale</span>
                            </label>
                            <label class="inline-flex items-center cursor-pointer">
                                <input type="radio" name="propertyPurpose" value="Rent" @if($property_part_one['purpose']=='rent') checked @endif  class="w-4 h-4 text-mb-red focus:ring-mb-red border-gray-300">
                                <span class="ml-2 text-sm font-medium text-gray-700">Rent/ Lease</span>
                            </label>
                            <label class="inline-flex items-center cursor-pointer">
                                <input type="radio" name="propertyPurpose" value="PG" @if($property_part_one['purpose']=='pg') checked @endif  class="w-4 h-4 text-mb-red focus:ring-mb-red border-gray-300">
                                <span class="ml-2 text-sm font-medium text-gray-700">PG/Hostel</span>
                            </label>
                        </div>
                    </div>

                    
                    <div class="max-w-md space-y-5 ">
						<label for="propertyType"
							class="block text-xs font-semibold text-gray-500 uppercase mb-1">
							Property Type
						</label>

						<select id="propertyType" name="property_type" required class="w-full border-b-2 border-gray-300 focus:border-red-600 outline-none py-2 bg-transparent transition text-sm text-gray-700">
							<option value="" selected disabled>Select Property Type</option>
							@foreach($property_types as $val)
								<option value="{{ $val->id }}">{{ $val->name }}</option>
							@endforeach
						</select>
					</div>
					</br>
					
					<div style="margin-top:5px !important;" class="space-y-5 max-w-md">
						<label for="property_title" class="block text-xs font-semibold text-gray-500 uppercase mb-1">
							Property Title
						</label>
						<input type="text" name="property_title" id="property_title" required placeholder="Enter Your Property Title" class="w-full border-b-2 border-gray-300 focus:border-mb-red outline-none py-1.5 transition text-sm">
                         
					</div>
					</br>
					
					<div style="margin-top:5px !important;" class="space-y-5 max-w-md">
						<label for="property_area" class="block text-xs font-semibold text-gray-500 uppercase mb-1">
							Enter Property Area (in sq. ft.)
						</label>
						<input type="text" name="property_area" id="property_area" required placeholder="Enter Property Area (in sq. ft.)" class="w-full border-b-2 border-gray-300 focus:border-mb-red outline-none py-1.5 transition text-sm">
                         
					</div>
					</br>
					
					<div style="margin-top:5px !important;" class="space-y-5 max-w-md">
						<label for="property_area" class="block text-xs font-semibold text-gray-500 uppercase mb-1">
							Enter Property Details
						</label>
						<textarea rows="6" cols="6" name="property_details" id="property_details" placeholder="Enter Property Details (not more than 260 words)" class="w-full border-b-2 border-gray-300 focus:border-mb-red outline-none py-1.5 transition text-sm">
						
						</textarea>
                         
					</div>
					</br>
					
					




					
						

					<!-- Dynamic Features -->
					<div id="propertyFeatures" class="mt-6">
						 
					
					</div>



                </div>
				
				<div>
					<h2 class="text-base font-bold text-gray-900 border-b pb-2 mb-4">
						Property Media
					</h2>

					<div class="space-y-5 max-w-md">

						<div>
							<label for="picture" class="block text-xs font-semibold text-gray-500 uppercase mb-1">
								Select Picture<br>
								<small>Can select multiple pictures</small>
							</label>

							<input type="file"
								   multiple
								   accept="image/*"
								   id="picture"
								   name="picture[]"
								   class="w-full border-b-2 border-gray-300 focus:border-mb-red outline-none py-1.5 transition text-sm">

							<!-- Preview Area -->
							<div id="imagePreview" class="grid grid-cols-3 gap-3 mt-4"></div>
						</div>

						<div>
							<label for="video" class="block text-xs font-semibold text-gray-500 uppercase mb-1">
								Select Video<br>
								<small>Maximum 2 videos, 100MB each</small>
							</label>

							<input type="file"
								   multiple
								   accept="video/mp4,video/quicktime,video/x-msvideo,video/x-ms-wmv,video/webm"
								   id="video"
								   name="video[]"
								   class="w-full border-b-2 border-gray-300 focus:border-mb-red outline-none py-1.5 transition text-sm">

							<div id="videoPreview" class="mt-3 space-y-2 text-sm text-gray-700"></div>
							<div id="uploadProgressWrap" class="mt-4 hidden">
								<div class="flex justify-between text-xs text-gray-600 mb-1">
									<span>Uploading media in background...</span>
									<span id="uploadProgressText">0%</span>
								</div>
								<div class="w-full bg-gray-200 rounded-full h-2 overflow-hidden">
									<div id="uploadProgressBar" class="bg-mb-red h-2 rounded-full transition-all" style="width:0%"></div>
								</div>
							</div>
						</div>

					</div>
				</div>

				<script>
				const maxVideoFiles = 2;
				const maxVideoSize = 100 * 1024 * 1024;

				document.getElementById('picture').addEventListener('change', function(e) {

					let preview = document.getElementById('imagePreview');
					preview.innerHTML = '';

					let files = e.target.files;

					Array.from(files).forEach(file => {

						if (!file.type.startsWith('image/')) return;

						let reader = new FileReader();

						reader.onload = function(event) {

							let imgWrapper = document.createElement('div');
							imgWrapper.className = 'border rounded overflow-hidden';

							let img = document.createElement('img');
							img.src = event.target.result;
							img.className = 'w-full h-24 object-cover';

							imgWrapper.appendChild(img);
							preview.appendChild(imgWrapper);
						};

						reader.readAsDataURL(file);
					});
				});

				document.getElementById('video').addEventListener('change', function(e) {
					let preview = document.getElementById('videoPreview');
					preview.innerHTML = '';

					let files = Array.from(e.target.files);
					let hasError = files.length > maxVideoFiles;

					files.forEach(file => {
						if (!file.type.startsWith('video/') || file.size > maxVideoSize) {
							hasError = true;
						}
					});

					if (hasError) {
						e.target.value = '';
						preview.innerHTML = '<div class="text-danger">Please select maximum 2 valid videos. Each video must be 100MB or less.</div>';
						return;
					}

					files.forEach(file => {
						let row = document.createElement('div');
						row.className = 'border rounded px-3 py-2 bg-gray-50';
						row.textContent = file.name + ' (' + (file.size / (1024 * 1024)).toFixed(1) + ' MB)';
						preview.appendChild(row);
					});
				});
				</script>

                <div>
                    <h2 class="text-base font-bold text-gray-900 border-b pb-2 mb-4">Property Location</h2>
                    
                    <div class="space-y-5 max-w-md">
                        <div class="max-w-md">
							<label for="propertyType"
								class="block text-xs font-semibold text-gray-500 uppercase mb-1">
								Select State
							</label>

							<select id="state" name="state" required class="w-full border-b-2 border-gray-300 focus:border-red-600 outline-none py-2 bg-transparent transition text-sm text-gray-700">
								<option value="" selected disabled>Select State</option>
								@foreach($state_list as $val)
									<option value="{{ $val->id }}">{{ $val->name }}</option>
								@endforeach
							</select>
						</div>
						
						<div class="max-w-md">
							<label for="propertyType"
								class="block text-xs font-semibold text-gray-500 uppercase mb-1">
								Select District
							</label>

							<select id="district" name="city" required class="w-full border-b-2 border-gray-300 focus:border-red-600 outline-none py-2 bg-transparent transition text-sm text-gray-700">
								<option value="" selected disabled>Select District</option>
								 
							</select>
						</div>
						
						<div class="max-w-md">
							<label for="propertyType"
								class="block text-xs font-semibold text-gray-500 uppercase mb-1">
								Select Block
							</label>

							<select id="block" name="block" required class="w-full border-b-2 border-gray-300 focus:border-red-600 outline-none py-2 bg-transparent transition text-sm text-gray-700">
								<option value="" selected disabled>Select Block</option>
							</select>
						</div>
						
						<div>
                            <label for="propertyLocality" class="block text-xs font-semibold text-gray-500 uppercase mb-1">Locality</label>
                            <input type="text" id="propertyLocality" required placeholder="Enter Locality" name="locality" class="w-full border-b-2 border-gray-300 focus:border-mb-red outline-none py-1.5 transition text-sm">
                        </div>
						
						<div>
                            <label for="propertyPincode" class="block text-xs font-semibold text-gray-500 uppercase mb-1">Pincode</label>
                            <input type="text" id="propertyPincode" required placeholder="Enter Pincode" name="pincode" class="w-full border-b-2 border-gray-300 focus:border-mb-red outline-none py-1.5 transition text-sm">
                        </div>
						
						<div>
                            <label for="price" class="block text-xs font-semibold text-gray-500 uppercase mb-1">Select Price Range</label>
                            <select id="price" name="price" required class="w-full border-b-2 border-gray-300 focus:border-red-600 outline-none py-2 bg-transparent transition text-sm text-gray-700">
								<option value="" selected disabled>Select Price Range</option>
								@foreach($master_price_list as $val)
									<option value="{{ $val->id }}">₹&nbsp;{{ $val->price_range }}</option>
								@endforeach
							</select>
                        </div>
						
                    </div>
                </div>

                <div class="space-y-3 pt-2">
                    <label class="flex items-start cursor-pointer">
                        <input type="checkbox" required checked class="mt-1 w-4 h-4 text-mb-red rounded border-gray-300 focus:ring-mb-red">
                        <span class="ml-3 text-xs text-gray-600">I am posting this property 'exclusively' on Infratech Hectare</span>
                    </label>
                    <label class="flex items-start cursor-pointer">
                        <input type="checkbox" required checked class="mt-1 w-4 h-4 text-mb-red rounded border-gray-300 focus:ring-mb-red">
                        <span class="ml-3 text-xs text-gray-600">I agree to Infratech Hectare T&C, Privacy Policy, & Cookie Policy</span>
                    </label>
                    <label class="flex items-start cursor-pointer">
                        <input type="checkbox" checked class="mt-1 w-4 h-4 text-mb-red rounded border-gray-300 focus:ring-mb-red">
                        <span class="ml-3 text-xs text-gray-600">I want to receive responses on <i class="fab fa-whatsapp text-green-500 mx-0.5"></i> Whatsapp</span>
                    </label>
                </div>

                <div class="pt-4">
                    <button type="submit" class="post_property_details w-full md:w-auto bg-mb-red text-white font-bold px-8 py-3 rounded text-sm tracking-wide shadow hover:bg-red-700 active:scale-95 transition-all">
                        Login & Post Property
                    </button>
                </div>

            </form>
        </section>

        <aside class="w-full lg:w-1/3 space-y-4">
            <img src="{{ static_asset('assets/assets_web/img/post2.jpg') }}">
        </aside>
		
		

    </main>

    <script>
        $(document).on('change', '#propertyType', function() {

			let property_type = $(this).val();

			$.ajax({
				url: "{{ route('get.property.features') }}",
				type: "POST",
				data: {
					property_type: property_type,
					_token: "{{ csrf_token() }}"
				},
				success: function(response) {
					$('#propertyFeatures').html(response.html);
				}
			});

		}); 
		
		$(document).ready(function () {
			$('#state').on('change', function () {
				var stateID = $(this).val();
				if (stateID) {
					$.ajax({
						url: '{{ url("get-district-by-state") }}/' + stateID,
						type: "GET",
						dataType: "json",
						success: function (data) {
							$('#district').empty();
							$('#district').append('<option value="">Select District</option>');
							$.each(data, function (key, value) {
								$('#district').append('<option value="' + value.id + '">' + value.name + '</option>');
							});
						}
					});
				} else {
					$('#district').empty();
					$('#district').append('<option value="">Select district</option>');
				}
			});
			
			$('#district').on('change', function () {
				var districtID = $(this).val();
				if (districtID) {
					$.ajax({
						url: '{{ url("get-blocks-by-district") }}/' + districtID,
						type: "GET",
						dataType: "json",
						success: function (data) {
							$('#block').empty();
							$('#panchayat').empty();
							$('#block').append('<option value="">Select Block</option>');
							$.each(data, function (key, value) {
								$('#block').append('<option value="' + value.id + '">' + value.name + '</option>');
							});
						}
					});
				} else {
					$('#block').empty();
					$('#block').append('<option value="">Select block</option>');
				}
			});
			
			$('#block').on('change', function () {
				var panchayatID = $(this).val();
				if (panchayatID) {
					$.ajax({
						url: '{{ url("get-panchayat-by-block") }}/' + panchayatID,
						type: "GET",
						dataType: "json",
						success: function (data) {
							$('#panchayat').empty();
							$('#panchayat').append('<option value="">Select Panchayat</option>');
							$.each(data, function (key, value) {
								$('#panchayat').append('<option value="' + value.id + '">' + value.name + '</option>');
							});
						}
					});
				} else {
					$('#panchayat').empty();
					$('#panchayat').append('<option value="">Select Panchayat</option>');
				}
			});
		});
	
		$(document).on('click', '.post_property_details', function(e) {
		e.preventDefault();

		var clk_btn = $(this);

		clk_btn.prop('disabled', true).html('<i class="fa fa-spinner fa-spin"></i> Saving Data...');

		var formData = new FormData(document.getElementById("propertyDetailsForm"));
		var videoFiles = Array.from(document.getElementById('video').files);

		if (videoFiles.length > maxVideoFiles || videoFiles.some(file => !file.type.startsWith('video/') || file.size > maxVideoSize)) {
			clk_btn.prop('disabled', false).text('Login & Post Property');
			Swal.fire({
				icon: 'error',
				title: 'Invalid Video',
				text: 'Please upload maximum 2 videos. Each video must be 100MB or less.',
				confirmButtonColor: '#3085d6'
			});
			return;
		}

		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			}
		});

		$.ajax({
			type: "POST",
			url: "{{ route('savePropertyPartTwoDetails') }}",
			data: formData,
			processData: false,
			contentType: false,
			dataType: "JSON",
			xhr: function() {
				var xhr = $.ajaxSettings.xhr();
				if (xhr.upload) {
					$('#uploadProgressWrap').removeClass('hidden');
					$('#uploadProgressBar').css('width', '0%');
					$('#uploadProgressText').text('0%');
					xhr.upload.addEventListener('progress', function(e) {
						if (e.lengthComputable) {
							var percent = Math.round((e.loaded / e.total) * 100);
							$('#uploadProgressBar').css('width', percent + '%');
							$('#uploadProgressText').text(percent + '%');
						}
					}, false);
				}
				return xhr;
			},

			success: function(data) {

				if (data.status == true) {

					$('#propertyDetailsForm')[0].reset();
					$('#imagePreview, #videoPreview').html('');
					$('#uploadProgressWrap').addClass('hidden');
					$('#post-property-form-error').hide();
					clk_btn.prop('disabled', false).text('Login & Post Property');
					Swal.fire({
						icon: 'success',
						title: 'Success',
						text: data.message,
						confirmButtonColor: '#3085d6'
					});
					window.location.href = data.redirect_url;

				} else {

					// Restore button
					clk_btn.prop('disabled', false).text('Login & Post Property');

					// Swal.fire({
						// icon: 'error',
						// title: 'Error',
						// text: data.message,
						// confirmButtonColor: '#3085d6'
					// });
				}
			},

			error: function(err) {

				document.getElementById('post-property-form-error').style = "display: block";

				// Restore button
				clk_btn.prop('disabled', false).text('Login & Post Property');
				$('#uploadProgressWrap').addClass('hidden');

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
    
     

    </main>
	
	
@endsection
