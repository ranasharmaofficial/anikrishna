@extends('frontend.layouts.master')
@section('title') Owner Properties @endsection

@section('meta_tags')

@endsection
@section('content')

	<style>
	
	/* Filter Card */
	.rtp-filter-card {
		background: #fff;
		border-radius: 18px;
		padding: 30px;
		box-shadow: 0 10px 30px rgba(0,0,0,0.08);
		border: 1px solid #edf0f5;
	}

	.rtp-filter-title {
		font-size: 28px;
		font-weight: 700;
		color: #1f2937;
		margin-bottom: 25px;
	}

	/* Main Grid */
	.rtp-budget-grid {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
		gap: 22px;
		align-items: end;
	}

	/* Budget Options */
	.rtp-budget-option {
		display: flex;
		align-items: center;
		gap: 10px;
		background: #f8fafc;
		border: 1px solid #e5e7eb;
		border-radius: 12px;
		padding: 12px 15px;
		cursor: pointer;
		transition: all 0.3s ease;
		font-size: 15px;
		font-weight: 500;
	}

	.rtp-budget-option:hover {
		border-color: #ff6b35;
		background: #fff7f3;
		transform: translateY(-2px);
	}

	.rtp-budget-option input[type="checkbox"] {
		width: 18px;
		height: 18px;
		accent-color: #ff6b35;
	}

	/* Select Fields */
	.rtp-budget-grid select {
		width: 100%;
		height: 52px;
		border: 1px solid #dbe1ea;
		border-radius: 12px;
		padding: 0 15px;
		background: #fff;
		font-size: 15px;
		transition: all 0.3s ease;
		box-shadow: none;
	}

	.rtp-budget-grid select:focus {
		border-color: #ff6b35;
		box-shadow: 0 0 0 4px rgba(255,107,53,.12);
		outline: none;
	}

	/* Labels */
	.rtp-budget-grid label.block {
		font-size: 13px;
		font-weight: 600;
		color: #6b7280;
		text-transform: uppercase;
		letter-spacing: .5px;
		margin-bottom: 8px;
	}

	/* Input Containers */
	.max-w-md {
		width: 100%;
		max-width: 100%;
	}

	/* Apply Button */
	.rtp-btn-apply {
		height: 52px;
		border: none !important;
		border-radius: 30px !important;
		background: linear-gradient(135deg,#ff7b42,#ff5f2e) !important;
		color: #fff !important;
		font-size: 16px;
		font-weight: 600;
		padding: 0 35px;
		transition: all .3s ease;
		box-shadow: 0 8px 20px rgba(255,95,46,.25);
	}

	.rtp-btn-apply:hover {
		transform: translateY(-3px);
		box-shadow: 0 12px 25px rgba(255,95,46,.35);
	}

	/* Responsive */
	@media (max-width: 768px) {
		.rtp-filter-card {
			padding: 20px;
		}

		.rtp-filter-title {
			font-size: 22px;
		}

		.rtp-budget-grid {
			grid-template-columns: 1fr;
			gap: 15px;
		}

		.rtp-btn-apply {
			width: 100%;
		}
	}

	</style>
   <div class="top-banner2">
        <img src="{{ static_asset('assets/assets_web/img/top-banner.jpg') }}" width="100%">
    </div>

    <!-- Page content -->
    <main class="content-wrapper">
        <div class="backk">
            <nav class="bi-filter-navbar">
                <div style="display:none;" class="bi-nav-inner bi-nav-centered">

                    <div class="bi-search-input-wrapper">
                        <div class="bi-fixed-location-tag">Bihar <span class="bi-tag-close">×</span></div>
                        <input type="text" class="bi-inline-search-field" placeholder="Add More..." />
                        <span class="bi-search-icon-inside">🔍</span>
                    </div>

                    <div class="bi-dropdown-container">
                        <div class="bi-dropdown-pill" onclick="toggleBiDropdown(event, 'bi-drop-buy')">
                            <span id="bi-selected-buy">Buy</span> <span class="bi-chevron">▼</span>
                        </div>
                        <select class="">
							<option value="Buy"></option>
							<option value="Rent"></option>
							<option value="Lease"></option>
						</select>
                    </div>
					
					<div class="bi-dropdown-container">
                        <div class="bi-dropdown-pill" onclick="toggleBiDropdown(event, 'bi-drop-buy')">
                            <span id="bi-selected-buy">Buy</span> <span class="bi-chevron">▼</span>
                        </div>
                        <ul id="bi-drop-buy" class="bi-dropdown-menu">
                            <li onclick="selectBiValue('bi-selected-buy', 'Buy', 'bi-drop-buy')">Buy</li>
                            <li onclick="selectBiValue('bi-selected-buy', 'Rent', 'bi-drop-buy')">Rent</li>
                            <li onclick="selectBiValue('bi-selected-buy', 'Lease', 'bi-drop-buy')">Lease</li>
                        </ul>
                    </div>

                    <!-- DROPDOWN 2: LOCALITIES -->
                    <div class="bi-dropdown-container">
                        <div class="bi-dropdown-pill" onclick="toggleBiDropdown(event, 'bi-drop-locality')">
                            <span id="bi-selected-locality">Select Locality</span> <span class="bi-chevron">▼</span>
                        </div>
                        <ul id="bi-drop-locality" class="bi-dropdown-menu">
                            <li onclick="selectBiValue('bi-selected-locality', 'Boring Road', 'bi-drop-locality')">Boring Road</li>
                            <li onclick="selectBiValue('bi-selected-locality', 'Kankarbagh', 'bi-drop-locality')">Kankarbagh</li>
                            <li onclick="selectBiValue('bi-selected-locality', 'Mithanpura', 'bi-drop-locality')">Mithanpura</li>
                            <li onclick="selectBiValue('bi-selected-locality', 'Gola Road', 'bi-drop-locality')">Gola Road</li>
                        </ul>
                    </div>

                    <div class="bi-dropdown-container">
                        <div class="bi-dropdown-pill" onclick="toggleBiDropdown(event, 'bi-drop-type')">
                            <span id="bi-selected-type">Flat/BHK</span> <span class="bi-chevron">▼</span>
                        </div>
                        <ul id="bi-drop-type" class="bi-dropdown-menu">
                            <li onclick="selectBiValue('bi-selected-type', '1 BHK Flat', 'bi-drop-type')">1 BHK Flat</li>
                            <li onclick="selectBiValue('bi-selected-type', '2 BHK Flat', 'bi-drop-type')">2 BHK Flat</li>
                            <li onclick="selectBiValue('bi-selected-type', '3 BHK Flat', 'bi-drop-type')">3 BHK Flat</li>
                            <li onclick="selectBiValue('bi-selected-type', 'Independent House', 'bi-drop-type')">Independent House</li>
                            <li onclick="selectBiValue('bi-selected-type', 'Plot / Land', 'bi-drop-type')">Plot / Land</li>
                        </ul>
                    </div>

                    <div class="bi-dropdown-container">
                        <div class="bi-dropdown-pill" onclick="toggleBiDropdown(event, 'bi-drop-budget')">
                            <span id="bi-selected-budget">Budget</span> <span class="bi-chevron">▼</span>
                        </div>
                        <ul id="bi-drop-budget" class="bi-dropdown-menu">
                            <li onclick="selectBiValue('bi-selected-budget', 'Under ₹10,000', 'bi-drop-budget')">Under ₹10,000</li>
                            <li onclick="selectBiValue('bi-selected-budget', '₹10,000 - ₹20,000', 'bi-drop-budget')">₹10,000 - ₹20,000</li>
                            <li onclick="selectBiValue('bi-selected-budget', '₹20,000 - ₹50,000', 'bi-drop-budget')">₹20,000 - ₹50,000</li>
                            <li onclick="selectBiValue('bi-selected-budget', '₹50,000 +', 'bi-drop-budget')">₹50,000 +</li>
                        </ul>
                    </div>

                    <div class="bi-dropdown-container">
                        <div class="bi-dropdown-pill" onclick="toggleBiDropdown(event, 'bi-drop-posted')">
                            <span id="bi-selected-posted">Posted By</span> <span class="bi-chevron">▼</span>
                        </div>
                        <ul id="bi-drop-posted" class="bi-dropdown-menu">
                            <li onclick="selectBiValue('bi-selected-posted', 'All Sellers', 'bi-drop-posted')">All Sellers</li>
                            <li onclick="selectBiValue('bi-selected-posted', 'Owner', 'bi-drop-posted')">Owner</li>
                            <li onclick="selectBiValue('bi-selected-posted', 'Agent / Broker', 'bi-drop-posted')">Agent / Broker</li>
                            <li onclick="selectBiValue('bi-selected-posted', 'Builder / Developer', 'bi-drop-posted')">Builder / Developer</li>
                        </ul>
                    </div>

                </div>
            </nav>

            <div class="rtp-portal-container">

                <main class="rtp-content-column rent2">
                    <p>
                        <h3>Owner Properties for Rent in Bihar</h3></p>
						
						<section class="rtp-filter-card">
							<h3 class="rtp-filter-title">What is your budget?</h3>
							<div class="rtp-budget-grid">
								@foreach($master_price_list as $price)
								<label class="rtp-budget-option">
									<input type="checkbox" class="budget-filter" name="budget[]" value="{{ $price->id }}">
									₹ {{ $price->price_range }}
								</label>
								@endforeach
								
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
								
								<div class="max-w-md">
									<label for="state"
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
								
								

								<button type="button" style="background: coral;color: #fff !important;" class="rtp-btn-apply btn btn-primary">Apply Filter</button>
							</div>
						</section>

                     
                    
                    <section class="rtp-main-container">
						<div class="rtp-listings-wrapper" id="property-listing-area">
							@include('frontend.property.ajax_property_list')
						</div>
					</section>

                </main>

                <aside class="rtp-sidebar-column">
                    <img src="{{ static_asset('assets/assets_web/img/post.jpg') }}">
                    @foreach($agentList as $val)
						<div class="rtp-agent-widget">
							<span class="rtp-preferred-badge">Preferred Agent</span>
							<div class="rtp-agent-profile">
								<img src="{{ static_asset('uploads/profile/'.$val->profile_pic) }}" alt="{{ $val->company_name }}" class="rtp-agent-avatar">
								<div class="rtp-agent-info">
									<h4>{{ $val->first_name }}</h4>
									<p>{{ $val->company_name }} • Operating since {{ date('Y', strtotime($val->created_at)) }}</p>
								</div>
							</div>
							<ul class="rtp-agent-features">
								<li>Has maximum property options</li>
								<li>Is the top agent of the locality</li>
								<li>Is trusted by all users</li>
							</ul>
							{{--<button class="rtp-btn-secondary" style="width:100%">View Profile</button>--}}
						</div>
					@endforeach

                    

                </aside>

            </div>
        </div>


    </main>
   
   <script>
   $(document).on('click', '.rtp-btn-apply', function() {

		let budgets = [];
		let state = $('#state').val();
		let district = $('#district').val();
		let block = $('#block').val();
		let propertyType = $('#propertyType').val();

		$('.budget-filter:checked').each(function() {
			budgets.push($(this).val());
		});
		
		console.log('state '+ state);
		

		$.ajax({
			url: "{{ route('property.filter') }}",
			type: "POST",
			data: {
				state: state,
				district: district,
				block: block,
				propertyType: propertyType,
				budgets: budgets,
				_token: "{{ csrf_token() }}"
			},
			beforeSend: function() {
				$('#property-listing-area').html(
					'<div class="text-center p-5">Loading...</div>'
				);
			},
			success: function(response) {
				$('#property-listing-area').html(response.html);
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
   </script>
@endsection
