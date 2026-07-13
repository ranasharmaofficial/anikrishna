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
				<th>Property Type</th>
				<th>Label</th>
				<th>Field Name</th>
				<th>Field Type</th>
				<th>Placeholder</th>
				<th>Options</th>
				<th>Is Required</th>
				<th>Created At</th>
				<th class="text-right">Actions</th>
			</tr>
		</thead>
		<tbody>
			@foreach ($property_features as $key => $value)
				@php
					$options = json_decode($value->options, true);
				@endphp
				<tr>
					<td>{{ ($property_features->currentPage() - 1) * $property_features->perPage() + ($key + 1) }}</td>
					<td>{{ $value->property_type_name }}</td>
					<td>{{ $value->label }}</td>
					<td>{{ $value->field_name }}</td>
					<td>{{ $value->field_type }}</td>
					<td>{{ $value->placeholder }}</td>
					<td>
						@foreach($options as $option)
							<label>{{ $option }}</label>
						@endforeach
					</td>
					<td>
						@if($value->is_required==0)
							<span class="badge bg-danger">No</span>
						@endif

						@if($value->is_required==1)
							<span class="badge bg-success">YES</span>
						@endif
					</td>
					<td>{{ date('d-M-Y', strtotime($value->created_at)) }}</td>
					<td class="text-right">
						<a class="btn btn-icon btn-sm btn-primary-light rounded-pill" href="{{ route('admin.editPropertyFeatures', $value->id) }}"><i class="ri-edit-line"></i></a>
					</td>
				</tr>
			@endforeach
		</tbody>
	</table>

		<div style="float:right;" class="mt-3 justify-content-center">
			{{ $property_features->links() }}
		</div>
