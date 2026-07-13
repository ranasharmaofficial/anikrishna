@extends('admin.include.master')
@section('title','Dashboard')
@section('content')
<div class="page-header-breadcrumb" style="background:linear-gradient(45deg,#cf337b,#3858f9)"><div class="p-3"><h4 class="fw-medium mb-2 text-white">Hi, Welcome back!</h4><ol class="breadcrumb mb-0"><li class="breadcrumb-item text-white">Dashboard</li><li class="breadcrumb-item active text-white-50">Post Overview</li></ol></div></div>
<div class="main-content app-content"><div class="container-fluid"><div class="row row-sm">
@php
$cards=[
 ['Total Posts',$data['total_posts'],'ri-file-list-3-line','primary',route('admin.customer-posts.index')],
 ['Pending Review',$data['pending_posts'],'ri-time-line','warning',route('admin.customer-posts.index',['status'=>'submitted'])],
 ['Approved / Live',$data['approved_posts'],'ri-checkbox-circle-line','success',route('admin.customer-posts.index',['status'=>'approved'])],
 ['Rejected Posts',$data['rejected_posts'],'ri-close-circle-line','danger',route('admin.customer-posts.index',['status'=>'rejected'])],
 ['Draft Posts',$data['draft_posts'],'ri-draft-line','info',route('admin.customer-posts.index',['status'=>'draft'])],
 ['Publication Views',$data['post_views'],'ri-eye-line','purple',route('admin.customer-posts.index',['status'=>'approved'])],
 ['File Downloads',$data['post_downloads'],'ri-download-cloud-line','orange',route('admin.customer-posts.index',['status'=>'approved'])],
];
@endphp
@foreach($cards as $card)<div class="col-xl-3 col-lg-4 col-md-6 col-sm-12"><a href="{{ $card[4] }}" class="text-decoration-none"><div class="card custom-card overflow-hidden post-stat-card"><div class="card-body d-flex align-items-center"><span class="post-stat-icon bg-{{ $card[3] }}-transparent text-{{ $card[3] }}"><i class="{{ $card[2] }}"></i></span><div class="ms-3"><p class="text-muted mb-1">{{ $card[0] }}</p><h3 class="mb-0">{{ number_format($card[1]) }}</h3></div><i class="ri-arrow-right-line ms-auto text-muted"></i></div></div></a></div>@endforeach
</div>
<div class="card custom-card mt-2"><div class="card-header d-flex justify-content-between"><div class="card-title">Recent Post Submissions</div><a href="{{ route('admin.customer-posts.index') }}" class="btn btn-sm btn-primary-light">View All Posts</a></div><div class="card-body p-0"><div class="table-responsive"><table class="table table-hover mb-0"><thead><tr><th>Post</th><th>Customer</th><th>Section</th><th>Status</th><th>Submitted</th><th>Action</th></tr></thead><tbody>@forelse($data['recent_posts'] as $post)<tr><td><strong>{{ Str::limit($post->title,60) }}</strong></td><td>{{ $post->user->first_name ?? 'Customer #'.$post->user_id }}</td><td>{{ $post->section }}</td><td><span class="badge bg-{{ $post->status==='approved'?'success':($post->status==='rejected'?'danger':($post->status==='submitted'?'warning':'info')) }}-transparent text-{{ $post->status==='approved'?'success':($post->status==='rejected'?'danger':($post->status==='submitted'?'warning':'info')) }}">{{ $post->status==='submitted'?'Pending Review':ucfirst($post->status) }}</span></td><td>{{ optional($post->submitted_at ?: $post->created_at)->format('d M Y') }}</td><td><a href="{{ route('admin.customer-posts.show',$post) }}" class="btn btn-sm btn-primary-light"><i class="ri-eye-line"></i> Review</a></td></tr>@empty<tr><td colspan="6" class="text-center py-5 text-muted">No posts submitted yet.</td></tr>@endforelse</tbody></table></div></div></div>
</div></div>
<style>.post-stat-card{transition:transform .2s,box-shadow .2s}.post-stat-card:hover{transform:translateY(-3px);box-shadow:0 10px 25px rgba(30,55,75,.12)}.post-stat-icon{width:64px;height:64px;flex:0 0 64px;border-radius:9px;display:grid;place-items:center;font-size:29px}.bg-purple-transparent{background:#eee9ff}.text-purple{color:#7557dc}.bg-orange-transparent{background:#fff0e3}.text-orange{color:#ef7d25}</style>
@endsection
