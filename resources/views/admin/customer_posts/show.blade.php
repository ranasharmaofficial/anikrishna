@extends('admin.include.master')
@section('title','Review Submission')
@section('content')
<div class="page-header-breadcrumb mt-3" style="background:linear-gradient(45deg,#f33057,#3858f9)">
    <div class="d-flex justify-content-between align-items-center w-100 p-3">
        <div>
            <h4 class="text-white mb-1">Review Submission #{{ $post->id }}</h4><small class="text-white-50">Submitted {{ optional($post->submitted_at)->format('d M Y, h:i A') }}</small>
        </div><a href="{{ route('admin.customer-posts.edit',$post) }}" class="btn btn-light"><i class="ri-edit-line"></i> Open Publication Editor</a>
    </div>
</div>
<div class="main-content app-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-8">
                <div class="card custom-card">
                    <div class="card-header">
                        <div class="card-title">Submission Details</div>
                    </div>
                    <div class="card-body">
                        <h3>{{ $post->title }}</h3>
                        <p><span class="badge bg-info">{{ $post->section }}</span> <span class="badge bg-secondary">{{ ucfirst($post->status) }}</span></p>
                        <h6>Keywords</h6>
                        <p>{{ $post->keywords ?: '—' }}</p>
                        <h6>Abstract</h6>
                        <div class="border rounded p-3 bg-light">{!! $post->abstract ?: '<span class="text-muted">No abstract</span>' !!}</div>
                        <h6 class="mt-4">Comments for Editor</h6>
                        <div class="border rounded p-3">{!! $post->editor_comments ?: '<span class="text-muted">No comments</span>' !!}</div>
                    </div>
                </div>
                <div class="card custom-card">
                    <div class="card-header">
                        <div class="card-title">Uploaded Files ({{ count($post->files ?? []) }})</div>
                    </div>
                    <div class="card-body">
                        <div class="list-group">@forelse($post->files??[] as $file)<div class="list-group-item d-flex justify-content-between align-items-center">
                                <div><i class="ri-file-text-line fs-4 me-2 text-primary"></i><strong>{{ $file['name'] }}</strong></div>
                                <div><a target="_blank" href="{{ str_starts_with($file['path'], 'uploads/') ? asset($file['path']) : asset('storage/'.$file['path']) }}" class="btn btn-sm btn-primary-light"><i class="ri-eye-line"></i> Open / Read</a> <a download href="{{ str_starts_with($file['path'], 'uploads/') ? asset($file['path']) : asset('storage/'.$file['path']) }}" class="btn btn-sm btn-success-light"><i class="ri-download-line"></i> Download</a></div>
                            </div>@empty<p class="text-muted mb-0">No files uploaded.</p>@endforelse</div>
                    </div>
                </div>
            </div>
            <div class="col-xl-4">
                <div class="card custom-card">
                    <div class="card-header">
                        <div class="card-title">Customer</div>
                    </div>
                    <div class="card-body"><strong>{{ $post->user->first_name ?? 'Customer' }}</strong>
                        <p class="text-muted mb-0">{{ $post->user->email ?? '' }}<br>{{ $post->user->mobile ?? '' }}</p>
                    </div>
                </div>
                <div class="card custom-card">
                    <div class="card-header">
                        <div class="card-title">Contributors ({{ count($post->contributors ?? []) }})</div>
                    </div>
                    <div class="card-body">@forelse($post->contributors??[] as $c)<div class="border rounded p-3 mb-2"><strong>{{ $c['public_name'] ?? trim(($c['given']??'').' '.($c['family']??'')) }}</strong> <span class="badge bg-info">{{ $c['role']??'Author' }}</span><small class="d-block text-muted mt-1">{{ $c['email']??'' }}<br>{{ $c['affiliation']??'' }} @if(!empty($c['country'])) · {{ $c['country'] }} @endif</small>@if(!empty($c['orcid']))<div>ORCID: {{ $c['orcid'] }}</div>@endif @if(!empty($c['homepage']))<a target="_blank" rel="noopener" href="{{ $c['homepage'] }}">Homepage</a>@endif @if(!empty($c['bio']))<div class="mt-2 pt-2 border-top">{!! $c['bio'] !!}</div>@endif</div>@empty<p class="text-muted">No contributors.</p>@endforelse</div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
@endsection
