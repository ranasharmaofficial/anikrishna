@extends('admin.include.master')
@section('title', 'Edit Property')
@section('content')
	<!-- Page Header -->
	<div style="background:linear-gradient(45deg, #f33057, rgb( 56, 88, 249 ) );"  class="d-sm-flex d-block align-items-center justify-content-between page-header-breadcrumb">
		<div>
			<h4 class="fw-medium mb-2">Property</h4>
			<div class="ms-sm-1 ms-0">
				<nav>
					<ol class="breadcrumb mb-0">
						<li class="breadcrumb-item"><a href="{{ url('admin/dashboard') }}">Dashboard</a></li>
						<li class="breadcrumb-item active fw-normal" aria-current="page">Update Property Details</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
	<!-- Page Header Close -->
<div class="main-content app-content">
    <div class="container-fluid py-4">
        <div class="card custom-card">
            <div class="card-header"><h5 class="mb-0">Edit Property #{{ $property->id }}</h5></div>
            <div class="card-body">
                @include('property._edit_form', [
                    'updateRoute' => route('admin.properties.update', $property->id),
                    'cancelRoute' => route('admin.viewPropertyDetails', $property->id),
                    'isAdmin' => true,
                ])
            </div>
        </div>
    </div>
</div>
@endsection
