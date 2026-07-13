@extends('admin.include.master')
@section('title', 'Approved Property')
@section('content')

<!-- Page Header -->
            <div style="background:linear-gradient(45deg, #f33057, rgb( 56, 88, 249 ) );"  class="d-sm-flex d-block align-items-center justify-content-between page-header-breadcrumb">
                <div>
                    <h4 class="fw-medium mb-2">Property</h4>
                    <div class="ms-sm-1 ms-0">
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="{{ url('admin/dashboard') }}">Dashboard</a></li>
                                <li class="breadcrumb-item active fw-normal" aria-current="page">Approved Property</li>
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
                                <div class="card-header d-flex justify-content-between align-items-center">
									<h5 class="mb-0">Approved Property</h5>
									{{--<a href="{{ route('admin.addPropertyFeatures') }}" class="btn btn-danger btn-sm float-end">
									   Add Property Features
									</a>--}}
								</div>
								<div class="card-body">
									<div class="row formtype">
										<form id="filterForm">
											<div class="row">
												<div class="col-md-3 mb-3">
													<div class="form-group">
														<label>Select Property Type <span class="text-danger">*</span></label>
														<select name="property_type" id="property_type" class="form-control">
															<option value="">Select Property Type</option>
															@foreach($master_property as $val)
																<option value="{{$val->id}}">{{ $val->name }}</option>
															@endforeach
														</select>
													</div>
												</div>

												<div class="col-md-3 mb-3">
													<div class="form-group">
														<label>Search <span class="text-danger">*</span></label>
														<div class="input-group">
															<input type="text" class="form-control" name="search" id="search" placeholder="Search by Name, Mobile, Email">
														</div>
													</div>
												</div>
												<div class="col-md-3">
													<div class="form-group mt-4">
														<button class="btn btn-danger btn-sm" id="resetSearchBtn" title="Reset Search">
															Reset
														</button>

													</div>
												</div>
											</div>
										</form>
										 
                                     
									</div>
									
									<div class="table-responsive">
										<div id="user-table">
											@include('admin.property.approved_property.approved_property_table_ajax', ['upcoming_property_list' => $upcoming_property_list])
										</div>
									</div>
									
								</div>

                    </div>
                    <!-- End:: row-1 -->



                </div>
            </div>
            <!--APP-CONTENT CLOSE-->
<script>
	/* fetching agreement data area start */

 function fetchPropertyFeatures(page = 1) {
        let property_type = $('#property_type').val();
        let search = $('#search').val();
		$.ajax({
            url: "{{ route('admin.fetchapprovedPropertyList') }}?page=" + page,
            method: "GET",
            data: {
                property_type,
                search
            },
            success: function (data) {
                $('#user-table').html(data);
            }
        });
    }

    // Trigger on pagination click
    $(document).on('click', '.pagination a', function (e) {
        e.preventDefault();
        let page = $(this).attr('href').split('page=')[1];
        fetchPropertyFeatures(page);
    });

    // Trigger on filter change
    $('#property_type').change(function () {
        fetchPropertyFeatures();
    });

    // Trigger on search
    $('#search').on('keyup', function () {
        fetchPropertyFeatures();
    });

    // Reset filters
    $('#resetSearchBtn').on('click', function (e) {
        e.preventDefault();
        $('#property_type').val('');
        $('#search').val('');
        fetchPropertyFeatures();
    });

/* fetching agreement data area end*/

</script>

@endsection

@section('script')
    <script>

    </script>
@endsection
