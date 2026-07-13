@extends('admin.include.master')
@section('title', 'Edit Property Features')
@section('content')

<!-- Page Header -->
            <div style="background:linear-gradient(45deg, #f33057, rgb( 56, 88, 249 ) );"  class="d-sm-flex d-block align-items-center justify-content-between page-header-breadcrumb">
                <div>
                    <h4 class="fw-medium mb-2">Property Features</h4>
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
                                        Edit Property Features
                                    </div>
                                </div>
								<div class="card-body">
									 
									<div class="row formtype">
										<div class="col-md-12">
											@if ($errors->any())
												<div class="alert alert-danger">
													<ul>
														@foreach ($errors->all() as $error)
															<li>{{ $error }}</li>
														@endforeach
													</ul>
												</div>
											@endif
										</div>

										<form id="save-features-form" action="{{ route('admin.updatePropertyFeatures', $property_feature->id) }}" method="POST">
											@csrf
											
											<div style="display:none;" id="show-form-error" class="alert alert-danger col-md-12">
												<ul>
													<div class="errorMsgntainer"></div>
												</ul>
											</div>
											<input type="hidden" name="id" value="{{ $property_feature->id }}">
											<div class="row">
											
												<div class="col-md-6 mb-3">
													<label>Property Type</label>
													<select name="property_type" id="property_type" class="form-control">
														<option value="">Select</option>
														@foreach($master_property as $val)
															<option @if($property_feature->property_type==$val->id) selected @endif value="{{$val->id}}">{{ $val->name }}</option>
														@endforeach
													</select>
												</div>

												<div class="col-md-6 mb-3">
													<label>Feature Label</label>
													<input type="text" value="{{ $property_feature->label }}" name="label" class="form-control" placeholder="Bedrooms,Bathroom">
												</div>

												<div class="col-md-6 mb-3">
													<label>Field Name</label>
													<input type="text" value="{{ $property_feature->field_name }}" name="field_name" class="form-control" placeholder="bedrooms, bathroom">
												</div>

												<div class="col-md-6 mb-3">
													<label>Field Type</label>
													<select name="field_type" id="field_type" required class="form-control">
														<option value="">Select</option>
														<option @if($property_feature->field_type=='text') selected @endif value="text">Text</option>
														<option @if($property_feature->field_type=='number') selected @endif value="number">Number</option>
														<option @if($property_feature->field_type=='textarea') selected @endif value="textarea">Textarea</option>
														<option @if($property_feature->field_type=='select') selected @endif value="select">Dropdown</option>
														<option @if($property_feature->field_type=='radio') selected @endif value="radio">Radio</option>
														<option @if($property_feature->field_type=='checkbox') selected @endif value="checkbox">Checkbox</option>
														<option @if($property_feature->field_type=='date') selected @endif value="date">Date</option>
													</select>
												</div>

												<div class="col-md-6 mb-3">
													<label>Placeholder</label>
													<input type="text" value="{{ $property_feature->placeholder }}" name="placeholder" class="form-control">
												</div>
												@php
													$options = json_decode($property_feature->options, true);
												@endphp
												<div class="col-md-12 mb-3 @if($property_feature->field_type!='select') d-none @endif" id="options_div">
													<label>Options</label>
													<textarea name="options" class="form-control" rows="4" placeholder="1,2,3,4,5">
													
														{{ implode(',', json_decode($property_feature->options, true) ?? []) }}</textarea>

														<small class="text-muted">
															Comma separated values
														</small>
												</div>

												<div class="col-md-6 mb-3">
													<label>Required</label>
													<select name="is_required" class="form-control">
														<option @if($property_feature->is_required==1) selected @endif value="1">Yes</option>
														<option @if($property_feature->is_required==0) selected @endif value="0">No</option>
													</select>
												</div>

												<div class="col-md-6 mb-3">
													<label>Status</label>
													<select name="status" class="form-control">
														<option @if($property_feature->status==1) selected @endif value="1">Active</option>
														<option @if($property_feature->status==0) selected @endif value="0">Inactive</option>
													</select>
												</div>

												<div class="col-md-12">
													<button type="submit"
															class="btn btn-primary updateFeatures">
														Update Feature
													</button>
												</div>

											</div>
										</form>
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

	$(document).on('click', '.updateFeatures', function(e) {
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
		var clk_btn = $(".updateFeatures");
		clk_btn.prop('disabled', true);
		var formData = new FormData(document.getElementById("save-features-form"));

		$.ajaxSetup({
			headers: {
				'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
			}
		});

		$.ajax({
			type: "POST",
			url: "{{ route('admin.updatePropertyFeatures', $property_feature->id) }}",
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
