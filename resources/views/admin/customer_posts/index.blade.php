@extends('admin.include.master')
@section('title','Customer Posts')
@section('content')
<div class="page-header-breadcrumb mt-3" style="background:linear-gradient(45deg,#f33057,#3858f9)">
    <h4 class="text-white p-3">Customer Posts</h4>
</div>
<div class="main-content app-content">
    <div class="container-fluid">
        <div class="card custom-card">
            <div class="card-header">
                <div class="card-title">Post Submissions</div>
            </div>
            <div class="card-body">
                <form class="row g-2 mb-3">
                    <div class="col-md-4"><input class="form-control" name="search" value="{{ request('search') }}" placeholder="Search title"></div>
                    <div class="col-md-3"><select class="form-control" name="status">
                            <option value="">All statuses</option>@foreach(['draft','submitted','approved','rejected'] as $s)<option value="{{ $s }}" @selected(request('status')===$s)>{{ ucfirst($s) }}</option>@endforeach
                        </select></div>
                    <div class="col"><button class="btn btn-primary">Search</button> <a href="{{ route('admin.customer-posts.index') }}" class="btn btn-light">Reset</a></div>
                </form>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Title</th>
                                <th>Customer</th>
                                <th>Section</th>
                                <th>Status</th>
                                <th>Submitted</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>@forelse($posts as $post)<tr>
                                <td>{{ $post->id }}</td>
                                <td>{{ $post->title }}</td>
                                <td>{{ $post->user->first_name ?? 'Customer #'.$post->user_id }}</td>
                                <td>{{ $post->section }}</td>
                                <td><span class="badge bg-{{ $post->status==='approved'?'success':($post->status==='rejected'?'danger':'info') }}">{{ ucfirst($post->status) }}</span></td>
                                <td>{{ optional($post->submitted_at)->format('d M Y, h:i A') ?? '—' }}</td>
                                <td><a href="{{ route('admin.customer-posts.show',$post) }}" class="btn btn-sm btn-primary-light"><i class="ri-eye-line"></i> Review</a> <a href="{{ route('admin.customer-posts.edit',$post) }}" class="btn btn-sm btn-info-light"><i class="ri-edit-line"></i> Edit</a></td>
                            </tr>@empty<tr>
                                <td colspan="7" class="text-center">No posts found.</td>
                            </tr>@endforelse</tbody>
                    </table>
                </div>{{ $posts->withQueryString()->links() }}
            </div>
        </div>
    </div>
</div>
@endsection
