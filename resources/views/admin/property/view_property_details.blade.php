@extends('admin.include.master')
@section('title', 'Property Details')
@section('content')

<style>
.property-wrapper{
    max-width:1200px;
    margin:auto;
}

.property-card{
    background:#fff;
    border-radius:15px;
    padding:25px;
    margin-bottom:25px;
    box-shadow:0 4px 20px rgba(0,0,0,.08);
}

.section-title{
    font-size:28px;
    font-weight:700;
    color:#0f172a;
    margin-bottom:20px;
    border-left:5px solid #2563eb;
    padding-left:12px;
}

.property-price{
    font-size:32px;
    font-weight:700;
    color:#16a34a;
}

.property-location{
    color:#64748b;
    font-size:15px;
}

.gallery{
    display:grid;
    grid-template-columns:repeat(auto-fill,minmax(250px,1fr));
    gap:15px;
}

.gallery img{
    width:100%;
    height:220px;
    object-fit:cover;
    border-radius:12px;
    transition:.3s;
}

.gallery img:hover{
    transform:scale(1.04);
}

.info-grid{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:20px;
}

.info-box{
    background:#f8fafc;
    padding:15px;
    border-radius:12px;
}

.info-box label{
    display:block;
    color:#64748b;
    font-size:13px;
    margin-bottom:5px;
}

.info-box span{
    font-weight:600;
    color:#0f172a;
}

.feature-grid{
    display:grid;
    grid-template-columns:repeat(auto-fill,minmax(180px,1fr));
    gap:20px;
}

.feature-card{
    background:linear-gradient(135deg,#ffffff,#f8fafc);
    border:1px solid #e2e8f0;
    border-radius:15px;
    padding:20px;
    text-align:center;
    transition:.3s;
}

.feature-card:hover{
    transform:translateY(-4px);
    box-shadow:0 8px 20px rgba(0,0,0,.08);
}

.feature-label{
    color:#64748b;
    font-size:14px;
    margin-bottom:10px;
}

.feature-value{
    font-size:28px;
    font-weight:700;
    color:#1e293b;
}

.contact-box{
    display:flex;
    align-items:center;
    gap:20px;
}

.contact-avatar{
    width:70px;
    height:70px;
    border-radius:50%;
    background:#2563eb;
    color:#fff;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:28px;
    font-weight:700;
}
</style>

<!-- Page Header -->
            <div style="background:linear-gradient(45deg, #f33057, rgb( 56, 88, 249 ) );"  class="d-sm-flex d-block align-items-center justify-content-between page-header-breadcrumb">
                <div>
                    <h4 class="fw-medium mb-2">Property Details</h4>
                    <div class="ms-sm-1 ms-0">
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="{{ url('admin/dashboard') }}">Dashboard</a></li>
                                <li class="breadcrumb-item active fw-normal" aria-current="page">Property Features</li>
                            </ol>
                        </nav>
                    </div>
                </div>
			</div>
            <!-- Page Header Close -->



            <!--APP-CONTENT START-->
            <div class="main-content app-content">
                <div class="container-fluid">


                    <!-- Start:: row-1 -->
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card custom-card">
                                <div class="card-header">
                                    <div class="card-title">
                                        Add Property Features
                                    </div>
                                </div>
								<div class="card-body">
									 
									<div class="row formtype">
										<div class="col-md-12">
											<div class="property-card">

												<h3 class="section-title">
													Property Features
												</h3>

												<div class="feature-grid">

													@foreach($property->featureValues as $feature)

														<div class="feature-card">

															<div class="feature-label">
																{{ ucwords(str_replace('_',' ',$feature->feature_key)) }}
															</div>

															<div class="feature-value">
																{{ $feature->feature_value }}
															</div>

														</div>

													@endforeach

												</div>

											</div>
											<div class="property-card">

    <h3 class="section-title">
        Property Information
    </h3>
	@php
		$property_type_name = \App\Models\MasterProperty::where('id', $property->property_type_id)->first();
		$property_pricing = \App\Models\MasterPrice::where('id', $property->price)->pluck('price_range')->first();
		$user_type_name = \App\Models\UserType::where('id', $property->user_type)->pluck('name')->first();
	@endphp
    <div class="info-grid">

        <div class="info-box">
            <label>Property Type</label>
            <span>{{ $property_type_name->name ?? '' }}</span>
        </div>
		
		<div class="info-box">
            <label>Property Title</label>
            <span>{{ $property->property_title ?? '' }}</span>
        </div>
		
		<div class="info-box">
            <label>Property Area</label>
            <span>{{ $property->property_area ?? '' }}</span>
        </div>
		
		<div class="info-box">
            <label>Property Price</label>
            <span>{{ $property_pricing ?? '' }}</span>
        </div>

        <div class="info-box">
            <label>Purpose</label>
            <span>{{ $property->purpose }}</span>
        </div>

        <div class="info-box">
            <label>Posted By</label>
            <span>{{ $user_type_name }}</span>
        </div>

        <div class="info-box">
            <label>Pincode</label>
            <span>{{ $property->pincode }}</span>
        </div>

    </div>

</div>


<div class="property-card">

    <h3 class="section-title">
        Property Images
    </h3>

    <div class="gallery">

        @foreach($property->images as $image)

            <img src="{{ static_asset('uploads/all/'.$image->image) }}">

        @endforeach

    </div>

</div>


<div class="property-card">

    <h3 class="section-title">
        Property Videos
    </h3>

    <div class="gallery">

        @foreach($property->videos as $video)

            <video controls preload="metadata" style="width:100%;max-width:360px;height:220px;object-fit:cover">
                <source src="{{ static_asset('uploads/all/'.$video->video) }}">
            </video>

        @endforeach

    </div>

</div>


<div class="property-card">

    <h3 class="section-title">
        Contact Details
    </h3>

    <div class="contact-box">

        <div class="contact-avatar">
            {{ substr($property->user->name ?? 'U',0,1) }}
        </div>

        <div>
            <h4>{{ $property->user->name ?? '' }}</h4>
            <p>{{ $property->user->email ?? '' }}</p>
            <p>{{ $property->user->mobile ?? '' }}</p>
        </div>

    </div>

</div>

<div class="property-card">

    <h3 class="section-title">
        Approve/Reject Property
    </h3>

    <div class="container">
		<form class="row" method="post" action="{{ route('admin.updatePropertyStatus') }}">
			@csrf
			<div class="row"> 
				<input type="hidden" name="id" value="{{ $property->id }}">
				<div class="col-sm-4">
					<div class="form-group">
						<label>Select Status</label>
						<select class="form-control" name="status">
							<option value="">Select Status</option>
							<option @if($property->status==0) selected @endif value="0">Pending</option>
							<option @if($property->status==1) selected @endif value="1">Approved</option>
							<option @if($property->status==2) selected @endif value="2">Reject</option>
						</select>
					</div>
				</div>
				<div class="col-sm-4">
					<button class="btn btn-success mt-3">UPDATE</button>
				</div>
			</div>
		</form>

    </div>

</div>

										</div>

										 
                                    </div>
									
								</div>
                            </div>
                        </div>

                    </div>
                    <!-- End:: row-1 -->



                </div>
            </div>
            <!--APP-CONTENT CLOSE-->

	<script>
	
	$(document).on('change','#field_type',function(){

		var type = $(this).val();

		if(type == 'select' || type == 'radio' || type == 'checkbox'){
			$('#options_div').removeClass('d-none');
		}else{
			$('#options_div').addClass('d-none');
		}

	});

	$(document).on('click', '.saveFeatures', function(e) {
		e.preventDefault();

		Swal.fire({
			title: "Are you sure?",
			text: "Do you really want to save Features?",
			icon: "warning",
			showCancelButton: true,
			confirmButtonText: "Yes, Save",
			cancelButtonText: "Cancel",
		}).then((result) => {
			if (result.isConfirmed) {
				// Call function to submit AJAX
				submitFundTransfer();
			}
		});
	});


	function submitFundTransfer() {
		var clk_btn = $(".saveFund");
		clk_btn.prop('disabled', true);
		var formData = new FormData(document.getElementById("save-features-form"));

		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			}
		});

		$.ajax({
			type: "POST",
			url: "{{ route('admin.property-features.store') }}",
			data: formData,
			processData: false,
			contentType: false,
			dataType: "JSON",

			success: function(data) {
				if (data.status == true) {
					Swal.fire({
						icon: "success",
						title: "Success",
						text: data.message,
						timer: 1500,
						showConfirmButton: false
					});
					document.getElementById('show-form-error').style = "display: none";
					location.reload();
				} else if(data.status == false) {
					Swal.fire({
						icon: "error",
						title: "Error!",
						text: data.message ?? "Something went wrong!",
						timer: 1500,
						showConfirmButton: false
					});
					clk_btn.prop('disabled', false);
				}
			},
			error: function(err) {
				document.getElementById('show-form-error').style = "display: block";
				clk_btn.prop('disabled', false);
				let error = err.responseJSON;
				$('.errorMsgntainer').html(""); // clear old errors
				$.each(error.errors, function(index, value) {
					$('.errorMsgntainer').append('<span class="text-danger">' + value + '</span><br>');
				});
			}
		});
	}
	
		$('#branch').change(function () {

			let branch = $(this).val();
			let userTypeId = $('#user_type').val();

			$('#user_id').html('<option value="">Loading...</option>');

			if (branch && userTypeId) {
				$.ajax({
					url: "{{ route('admin.get.branchmanagers') }}",
					type: "POST",
					data: {
						_token: "{{ csrf_token() }}",
						user_type_id: userTypeId,
						branch: branch
					},
					success: function (data) {
						let options = '<option value="">Select Branch Manager</option>';
						$.each(data, function (key, row) {
							options += `<option value="${row.id}">${row.first_name} - ${row.employee_code}</option>`;
						});
						$('#user_id').html(options);
					}
				});
			}
		});
	</script>

@endsection

@section('script')
    <script>

    </script>
@endsection
