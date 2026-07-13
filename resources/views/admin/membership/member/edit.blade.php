@extends('admin.include.master')
@section('title', 'Edit Member Details')
@section('content')

    <style>
        table.table-bordered td,
        table.table-bordered th {
            border: 1px solid #dee2e6 !important;
        }
    </style>

    <div style="background:linear-gradient(45deg,#f33057,rgb(56,88,249));"
        class="d-sm-flex d-block align-items-center justify-content-between page-header-breadcrumb">
        <div>
            <h4 class="fw-medium mb-2">{{ $page_title }}</h4>
            <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item">{{ $page_title }}</li>
                <li class="breadcrumb-item active">Members</li>
            </ol>
        </div>
    </div>

    <div class="main-content app-content">
        <div class="container-fluid">
            <div class="card card-table">

                <div class="card-header d-flex align-items-center justify-content-between">
					<h5 class="card-title">Edit Member</h5>
					<a href="{{ url('admin/member-list') }}" class="btn btn-danger ms-auto">
						Member List
					</a>
				</div>

                <div class="card-body">

                    <form class="card-body" id="fund-transfer-to-branch-form" method="post" action="{{ route('admin.member.updateMemberDetailsByAdmin') }}" enctype="multipart/form-data">
									@csrf
									<div class="row formtype">

										<div style="display:none;" id="show-form-error" class="alert alert-danger col-md-12">
											<ul>
												<div class="errorMsgntainer"></div>
											</ul>
										</div>

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

										<input type="hidden" name="id" value="{{ $member->id }}">

										<div class="col-sm-4 mb-3">
                                            <label for="title" class="col-form-label">Enter Membership Number</label>
                                            <input class="form-control" type="text" name="membership_number" readonly required placeholder="Enter amount" id="membership_number" value="{{ $member->membership_number }}">
                                        </div>
										<div class="col-sm-4 mb-3">
                                            <label for="title" class="col-form-label">Enter Membership Number</label>
                                            <input class="form-control" type="text" name="name" required placeholder="Enter amount" id="name" value="{{ $member->name }}">
                                        </div>
										<div class="col-sm-4 mb-3">
                                            <label for="title" class="col-form-label">Enter Father/Husband Name</label>
                                            <input class="form-control" type="text" name="father_husband" required placeholder="Enter amount" id="father_husband" value="{{ $member->father_husband }}">
                                        </div>
										<div class="col-sm-4 mb-3">
                                            <label for="title" class="col-form-label">Enter Address</label>
                                            <input class="form-control" type="text" name="address" required placeholder="Enter address" id="address" value="{{ $member->address }}">
                                        </div>
										<div class="col-sm-4 mb-3">
                                            <label for="title" class="col-form-label">Select State</label>
                                            <select class="form-control" name="state" id="state">
												@foreach($state_bihar_list as $val)
													<option @if($member->state==$val->id) selected @endif value="{{ $val->id }}">{{ $val->name }}</option>
												@endforeach
											</select>
                                        </div>
										<div class="col-sm-4 mb-3">
                                            <label for="title" class="col-form-label">Select District</label>
                                            <select class="form-control" name="district" id="district">
												@foreach($district_bihar_list as $val)
													<option @if($member->district==$val->id) selected @endif value="{{ $val->id }}">{{ $val->name }}</option>
												@endforeach
											</select>
                                        </div>
										<div class="col-sm-4 mb-3">
                                            <label for="title" class="col-form-label">Post</label>
                                            <input class="form-control" type="text" name="post" placeholder="Enter post" id="post" value="{{ $member->post }}">
                                        </div>
										<div class="col-sm-4 mb-3">
                                            <label for="title" class="col-form-label">Pincode</label>
                                            <input class="form-control" type="text" name="pincode" placeholder="Enter Pincode" id="pincode" value="{{ $member->pincode }}">
                                        </div>
										
										<div class="col-sm-4 mb-3">
                                            <label for="title" class="col-form-label">Mobile</label>
                                            <input class="form-control" type="text" name="mobile" placeholder="Enter Mobile" id="mobile" value="{{ $member->mobile }}">
                                        </div>
										<div class="col-sm-4 mb-3">
                                            <label for="title" class="col-form-label">WhatsApp</label>
                                            <input class="form-control" type="text" name="whatsapp" placeholder="Enter whatsapp" id="whatsapp" value="{{ $member->whatsapp }}">
                                        </div>
										 
										
										<div class="col-md-4 mb-3">
											<label class="pretty-label">आयुष्मती (लड़की का नेम )</label>
											<input type="text" name="ayushmati_girl_name" value="{{ $member->ayushmati_girl_name }}"  placeholder="आयुष्मती (लड़की का नेम )" class="form-control">
										</div>
										<div class="col-md-4 mb-3">
											<label class="pretty-label">उम्र </label>
											<input type="number" name="ayushmati_age" value="{{ $member->ayushmati_age }}"  placeholder="उम्र" class="form-control">
										</div>
										<div class="col-md-4 mb-3">
											<label class="pretty-label">योग्यता </label>
											<select type="text" name="ayushmati_qualification" placeholder="योग्यता" class="form-control">
												<option value="">Select योग्यता</option>
												<option @if($member->ayushmati_qualification=='Post Graduation') selected @endif value="Post Graduation">Post Graduation</option>
												<option @if($member->ayushmati_qualification=='Graduation') selected @endif value="Graduation">Graduation</option>
												<option @if($member->ayushmati_qualification=='Intermediate') selected @endif value="Intermediate">Intermediate</option>
												<option @if($member->ayushmati_qualification=='Matric') selected @endif value="Matric">Matric</option>
												<option @if($member->ayushmati_qualification=='Study') selected @endif value="Study">Study</option>
												<option @if($member->ayushmati_qualification=='Other') selected @endif value="Other">Other</option>
											</select>
										</div>
										<div class="col-md-4 mb-3">
											<label class="pretty-label">पेशा (क्या करती है )</label>
											<select type="text" name="ayushmati_father_occupation" placeholder="पेशा (क्या करती है )" class="form-control">
												<option value="">Select पेशा (क्या करती है )</option>
												<option @if($member->ayushmati_father_occupation=='House Wife') selected @endif value="House Wife">House Wife</option>
												<option @if($member->ayushmati_father_occupation=='Govt. Job') selected @endif  value="Govt. Job">Govt. Job</option>
												<option @if($member->ayushmati_father_occupation=='Private Job') selected @endif  value="Private Job">Private Job</option>
												<option @if($member->ayushmati_father_occupation=='Farmer') selected @endif  value="Farmer">Farmer</option>
												<option @if($member->ayushmati_father_occupation=='Business') selected @endif  value="Business">Business</option>
												<option @if($member->ayushmati_father_occupation=='Teaching') selected @endif  value="Teaching">Teaching</option>
												<option @if($member->ayushmati_father_occupation=='Silai') selected @endif  value="Silai">Silai/Kadhai</option>
												<option @if($member->ayushmati_father_occupation=='Jeevika') selected @endif  value="Jeevika">Jeevika</option>
												<option @if($member->ayushmati_father_occupation=='NM') selected @endif  value="NM">NM</option>
												<option @if($member->ayushmati_father_occupation=='Doctor') selected @endif  value="Doctor">Doctor</option>
												<option @if($member->ayushmati_father_occupation=='Other') selected @endif  value="Other">Other</option>
											</select>
										</div>
										<div class="col-md-4 mb-3">
											<label class="pretty-label">पिता/पति का नाम </label>
											<input type="text" value="{{ $member->ayushmati_father_husband_name }}" name="ayushmati_father_husband_name" placeholder="पिता/पति का नाम " class="form-control">
										</div>
										
										<div class="col-md-6 mb-3">
											<label class="pretty-label">शुभ विवाह महिना (संभावना )</label>
											<input type="month" value="{{ $member->ayushmati_expected_marriage_month }}" name="ayushmati_expected_marriage_month" placeholder="शुभ विवाह महिना (संभावना )" class="form-control">
										</div>
										<div class="col-md-6 mb-3">
											<label class="pretty-label">शुभ विवाह वर्ष (संभावना )</label>
											<select type="year" name="ayushmati_expected_marriage_year" placeholder="शुभ विवाह वर्ष (संभावना )" class="form-control">
												<option value="">Select Year</option>
												<option @if($member->ayushmati_expected_marriage_year=='2026') selected @endif value="2026">2026</option>
												<option @if($member->ayushmati_expected_marriage_year=='2027') selected @endif value="2027">2027</option>
												<option @if($member->ayushmati_expected_marriage_year=='2028') selected @endif value="2028">2028</option>
												<option @if($member->ayushmati_expected_marriage_year=='2029') selected @endif value="2029">2029</option>
												<option @if($member->ayushmati_expected_marriage_year=='2030') selected @endif value="2030">2030</option>
												<option @if($member->ayushmati_expected_marriage_year=='2031') selected @endif value="2031">2031</option>
												<option @if($member->ayushmati_expected_marriage_year=='2032') selected @endif value="2032">2032</option>
												<option @if($member->ayushmati_expected_marriage_year=='2033') selected @endif value="2033">2033</option>
												<option @if($member->ayushmati_expected_marriage_year=='2034') selected @endif value="2034">2034</option>
											</select>
										</div>
										
										
										 

										
                                    </div>
									
									<div id="form-step-3" class="">
											<div class="physical-card-box">
												<h3 class="section-title">बहन का विवरण</h3>

												<div class="row">
													<div class="col-md-4 mb-3">
														<label class="pretty-label">पहला बहन का नाम </label>
														<input type="text" value="{{ $member->sister_name_1 }}" name="sister_name_1" placeholder="पहला बहन का नाम" class="form-control">
													</div>
													<div class="col-md-4 mb-3">
														<label class="pretty-label">योग्यता </label>
														<select type="text" name="sister_qualification_1" placeholder="योग्यता" class="form-control">
                                                            <option value="">Select योग्यता</option>
                                                            <option @if($member->sister_qualification_1=='Post Graduation') selected @endif value="Post Graduation">Post Graduation</option>
                                                            <option @if($member->sister_qualification_1=='Graduation') selected @endif value="Graduation">Graduation</option>
                                                            <option @if($member->sister_qualification_1=='Intermediate') selected @endif value="Intermediate">Intermediate</option>
                                                            <option @if($member->sister_qualification_1=='Matric') selected @endif value="Matric">Matric</option>
                                                            <option @if($member->sister_qualification_1=='Study') selected @endif value="Study">Study</option>
                                                            <option @if($member->sister_qualification_1=='Other') selected @endif value="Other">Other</option>
                                                        </select>
													</div>
													<div class="col-md-4 mb-3">
														<label class="pretty-label">उम्र </label>
														<input type="number" value="{{ $member->sister_age_1 }}"  name="sister_age_1" placeholder="उम्र" class="form-control">
													</div>
												</div>

												<div class="row mb-3">
													<div class="col-md-4 mb-3">
														<label class="pretty-label">दूसरा बहन का नाम </label>
														<input type="text" value="{{ $member->sister_name_2 }}" name="sister_name_2" placeholder="दूसरा बहन का नाम" class="form-control">
													</div>
													<div class="col-md-4 mb-3">
														<label class="pretty-label">योग्यता </label>
														<select type="text" name="sister_qualification_2" placeholder="योग्यता" class="form-control">
                                                            <option value="">Select योग्यता</option>
                                                            <option  @if($member->sister_qualification_2=='Post Graduation') selected @endif value="Post Graduation">Post Graduation</option>
                                                            <option  @if($member->sister_qualification_2=='Graduation') selected @endif value="Graduation">Graduation</option>
                                                            <option  @if($member->sister_qualification_2=='Intermediate') selected @endif value="Intermediate">Intermediate</option>
                                                            <option  @if($member->sister_qualification_2=='Matric') selected @endif value="Matric">Matric</option>
                                                            <option  @if($member->sister_qualification_2=='Study') selected @endif value="Study">Study</option>
                                                            <option  @if($member->sister_qualification_2=='Other') selected @endif value="Other">Other</option>
                                                        </select>
													</div>
													<div class="col-md-4 mb-3">
														<label class="pretty-label">उम्र </label>
														<input type="number" value="{{ $member->sister_age_2 }}"  name="sister_age_2" placeholder="उम्र" class="form-control">
													</div>
												</div>

												<div class="row mb-3">
													<div class="col-md-4 mb-3">
														<label class="pretty-label">तीसरा बहन का नाम </label>
														<input type="text" value="{{ $member->sister_name_3 }}" name="sister_name_3" placeholder="तीसरा बहन का नाम" class="form-control">
													</div>
													<div class="col-md-4 mb-3">
														<label class="pretty-label">योग्यता </label>
														<select type="text" name="sister_qualification_3" placeholder="योग्यता" class="form-control">
                                                            <option value="">Select योग्यता</option>
                                                            <option  @if($member->sister_qualification_3=='Post Graduation') selected @endif value="Post Graduation">Post Graduation</option>
                                                            <option  @if($member->sister_qualification_3=='Graduation') selected @endif value="Graduation">Graduation</option>
                                                            <option  @if($member->sister_qualification_3=='Intermediate') selected @endif value="Intermediate">Intermediate</option>
                                                            <option  @if($member->sister_qualification_3=='Matric') selected @endif value="Matric">Matric</option>
                                                            <option  @if($member->sister_qualification_3=='Study') selected @endif value="Study">Study</option>
                                                            <option  @if($member->sister_qualification_3=='Other') selected @endif value="Other">Other</option>
                                                        </select>

													</div>
													<div class="col-md-4 mb-3">
														<label class="pretty-label">उम्र </label>
														<input type="number" value="{{ $member->sister_age_3 }}"  name="sister_age_3" placeholder="उम्र" class="form-control">
													</div>
												</div>

												 
											</div>
										</div>
										
										<div id="form-step-4" class="">
											<div class="physical-card-box">
												<h3 class="section-title">शादी में देने वाला गिफ्ट पैकेज लेने की संभावना</h3>
												<div class="package-options mt-3 mb-3">
													<label class="package-box">
														<input type="radio" @if($member->expected_marriage_package) checked @endif name="expected_marriage_package" value="51000">
														<span>₹51,000 Package</span>
													</label>

													<label class="package-box">
														<input type="radio" @if($member->expected_marriage_package) checked @endif name="expected_marriage_package" value="99000">
														<span>₹99,000 Package</span>
													</label>

													<label class="package-box">
														<input type="radio" @if($member->expected_marriage_package) checked @endif name="expected_marriage_package" value="175000">
														<span>₹1,75,000 Package</span>
													</label>
												</div>

												 


											</div>
										</div>

										<div id="form-step-5" class="">
											<div class="physical-card-box">

												<div class="row mb-3">
													<div class="col-md-4 mb-3">
														<label>Select Photo</label>
														<input type="file" class="form-control" accept="image/*" name="profile_pic">
														
														<img src="{{ static_asset($member->profile_pic) }}" class="img-fluid mt-3" style="height:150px;">
													</div>
												</div>

												
											</div>
										</div>
										
									<button type="submit" class="btn btn-success mt-3">Update Member Details</button>
								</form>

                     

                </div>
            </div>
        </div>
    </div>

    <script>
        function fetchMembers(page = 1) {
            $.ajax({
                url: "{{ route('admin.member.list') }}",
                type: "GET",
                data: {
                    page: page,
                    membership_number: $('#membership_number').val(),
                    name: $('#name').val(),
                    mobile: $('#mobile').val(),
                    status: $('#status').val()
                },
                success: function (data) {
                    $('#member-table').html(data);
                }
            });
        }

        $(document).on('click', '.pagination a', function (e) {
            e.preventDefault();
            let page = $(this).attr('href').split('page=')[1];
            fetchMembers(page);
        });

        $('#membership_number, #name, #mobile').on('keyup', function () {
            fetchMembers();
        });
        $('#status').on('change', function () {
            fetchMembers();
        });

        $('#resetFilter').on('click', function () {
            $('#membership_number,#name,#mobile').val('');
            $('#status').val('');
            fetchMembers();
        });
    </script>

@endsection