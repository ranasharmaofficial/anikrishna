@extends('admin.include.master')
@section('title', $pageTitle)
@section('content')

<div style="background:linear-gradient(45deg, #f33057, rgb(56, 88, 249));" class="d-sm-flex d-block align-items-center justify-content-between page-header-breadcrumb">
    <div>
        <h4 class="fw-medium mb-2">{{ $pageTitle }}</h4>
        <div class="ms-sm-1 ms-0">
            <nav>
                <ol class="breadcrumb mb-0">
                    <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Dashboard</a></li>
                    <li class="breadcrumb-item active fw-normal" aria-current="page">{{ $pageTitle }}</li>
                </ol>
            </nav>
        </div>
    </div>
</div>

<div class="main-content app-content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xl-12">
                <div class="card custom-card">
                    <div class="card-header">
                        <h5 class="mb-0">{{ $pageTitle }}</h5>
                    </div>
                    <div class="card-body">
                        <form method="GET" class="row align-items-end mb-3">
                            <div class="col-md-5">
                                <label for="search" class="form-label">Search</label>
                                <input type="text" class="form-control" id="search" name="search"
                                    value="{{ request('search') }}" placeholder="Name, mobile, email or property">
                            </div>
                            <div class="col-md-3 mt-2 mt-md-0">
                                <button type="submit" class="btn btn-primary">Search</button>
                                <a href="{{ url()->current() }}" class="btn btn-light">Reset</a>
                            </div>
                        </form>

                        <div class="table-responsive">
                            <table class="table table-bordered text-nowrap align-middle">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Property</th>
                                        <th>Customer</th>
                                        @if($recordType === 'tour')
                                            <th>Tour Schedule</th>
                                        @endif
                                        <th>Message</th>
                                        <th>Status</th>
                                        <th>Received At</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @forelse($records as $key => $record)
                                        <tr>
                                            <td>{{ ($records->currentPage() - 1) * $records->perPage() + $key + 1 }}</td>
                                            <td>{{ $record->property_title ?: 'Property #'.$record->property_id }}</td>
                                            <td>
                                                <div><strong>{{ $record->name ?: '-' }}</strong></div>
                                                <div>{{ $record->mobile ?: '-' }}</div>
                                                <div>{{ $record->email ?: '-' }}</div>
                                            </td>
                                            @if($recordType === 'tour')
                                                <td>
                                                    {{ $record->enq_date ? date('d-M-Y', strtotime($record->enq_date)) : '-' }}
                                                    {{ $record->enq_time ? date('h:i A', strtotime($record->enq_time)) : '' }}
                                                </td>
                                            @endif
                                            <td class="text-wrap" style="min-width: 220px;">{{ $record->message ?: '-' }}</td>
                                            <td>
                                                <span class="badge {{ $record->status ? 'bg-success' : 'bg-secondary' }}">
                                                    {{ $record->status ? 'Received' : 'Inactive' }}
                                                </span>
                                            </td>
                                            <td>{{ $record->created_at ? $record->created_at->format('d-M-Y h:i A') : '-' }}</td>
                                            <td>
                                                @if($record->property_id)
                                                    <a href="{{ route('admin.viewPropertyDetails', $record->property_id) }}" class="btn btn-primary btn-sm">
                                                        View Property
                                                    </a>
                                                @else
                                                    -
                                                @endif
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="{{ $recordType === 'tour' ? 8 : 7 }}" class="text-center py-4">
                                                No records found.
                                            </td>
                                        </tr>
                                    @endforelse
                                </tbody>
                            </table>
                        </div>

                        <div class="d-flex justify-content-end mt-3">
                            {{ $records->links() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
