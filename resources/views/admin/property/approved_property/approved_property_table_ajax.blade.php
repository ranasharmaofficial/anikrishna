<style>
    .table tbody tr {
        background-color: transparent !important;
    }

    .table tbody tr > td {
        background-color: inherit !important;
    }
</style>
	<table id="" class="table table-bordered text-nowrap mt-3" style="width:100%">
		<thead>
			<tr>
				<th>#</th>
				<th>Type</th>
				<th>Purpose</th>
				<th>Property Type</th>
				<th>Customer</th>
				<th>Address</th>
				<th>Price</th>
				<th>Status</th>
				<th>Created At</th>
				<th class="text-right">Actions</th>
			</tr>
		</thead>
		<tbody>
			@foreach ($upcoming_property_list as $key => $value)
				 
				<tr>
					<td>{{ ($upcoming_property_list->currentPage() - 1) * $upcoming_property_list->perPage() + ($key + 1) }}</td>
					<td>{{ $value->user_type }}</td>
					<td>{{ $value->purpose }}</td>
					<td>{{ $value->property_type_name }}</td>
					<td>
						<p><strong>Name:&nbsp;</strong>{{ $value->cust_name }}</p>
						<p><strong>Mobile:&nbsp;</strong>{{ $value->cust_mobile }}</p>
						<p><strong>Email:&nbsp;</strong>{{ $value->cust_email }}</p>
					</td>
					<td>
						<p><strong>State:&nbsp;</strong>{{ $value->state_name }}</p>
						<p><strong>City:&nbsp;</strong>{{ $value->district_name }}</p>
						<p><strong>Block:&nbsp;</strong>{{ $value->block_name }}</p>
						<p><strong>Locality:&nbsp;</strong>{{ $value->locality }}</p>
						<p><strong>Pincode:&nbsp;</strong>{{ $value->pincode }}</p>
					</td>
					<td>{{ $value->price }}</td>
					<td>
						@if($value->status==0)
							<button class="badge bg-danger">PENDING</button>
						@endif
						@if($value->status==1)
							<button class="badge bg-success">APPROVED</button>
						@endif
						@if($value->status==2)
							<button class="badge bg-warning">REJECTED</button>
						@endif
					</td>
					<td>{{ date('d-M-Y', strtotime($value->created_at)) }}</td>
					<td class="text-right">
					<a onclick="return confirm('Are you sure, you want to delete this?')" href="{{route('admin.deletePropertyDetails',$value->id)}}" class="btn btn-icon btn-sm btn-danger-light rounded-pill"><i class="ri-delete-bin-line"></i></a>
					<a class="btn btn-icon btn-sm btn-primary-light rounded-pill" title="Edit" href="{{ route('admin.properties.edit', $value->id) }}"><i class="ri-edit-line"></i></a>
					{{--<a class="btn btn-icon btn-sm btn-primary-light rounded-pill" href="{{ route('admin.editPropertyFeatures', $value->id) }}"><i class="ri-edit-line"></i></a>--}}
						<a class="btn btn-primary btn-sm" href="{{ route('admin.viewPropertyDetails', $value->id) }}">View&nbsp;Property&nbsp;Details</a>
					</td>
				</tr>
			@endforeach
		</tbody>
	</table>

		<div style="float:right;" class="mt-3 justify-content-center">
			{{ $upcoming_property_list->links() }}
		</div>
