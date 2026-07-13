<table class="table table-bordered table-striped">
    <thead>
        <tr>
            <th>ID</th>
            <th>User Type</th>
            <th>Name</th>
            <th>Mobile</th>
            <th>Email</th>
            <th>Username</th>
            
            <th>Status</th>
            <th>Photo</th>
            {{--<th>Action</th>--}}
        </tr>
    </thead>
    <tbody>
        @foreach($users as $key => $user)
            @php
                $check_user_details_added = \App\Models\UserDetail::where('user_id', $user->id)->count();
             @endphp
            <tr>
                <td>{{ $key + 1 }}</td>
                <td>{{ $user->userType }}</td>
                <td>{{ $user->first_name }}</td>
                <td>{{ $user->mobile }}</td>
                <td>{{ $user->email }}</td>
                <td>{{ $user->username }}</td>
				{{--<td>{{ $user->password }}</td>--}}
                <td>
					{{-- $user->status ? 'Active' : 'Inactive' --}}
					@if($user->status==1)
						<span class="badge bg-success">Active</span>
					@endif
					@if($user->status==0)
						<span class="badge bg-danger">In Active</span>
					@endif
				</td>
                <td>
                    <img onclick="updateStaffPhoto(this)" id="{{ $user->id }}" style="cursor:pointer;"
                        src="{{ static_asset('uploads/profile/'.$user->profile_pic) }}" width="60"
                        onerror="this.onerror=null;this.src='https://www.pulsecarshalton.co.uk/wp-content/uploads/2016/08/jk-placeholder-image.jpg';"
                        alt="{{ $user->first_name }}" class="img-fluid">
                </td>
                {{--<td>
                    <a href="{{ route('admin.staffs.edit', $user->id) }}"
                        class="btn btn-icon btn-sm btn-danger-light rounded-pill"><i class="ri-edit-line"></i></a>
                </td>--}}
            </tr>
        @endforeach
    </tbody>
</table>

{{ $users->links() }}