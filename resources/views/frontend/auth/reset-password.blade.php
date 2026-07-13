@extends('frontend.layouts.master')
@section('title') Reset Password @endsection

@section('content')
<main class="content-wrapper">
    <section class="lrc-auth-section">
        <div class="lrc-global-container">
            <div class="lrc-auth-split-card">
                <div class="lrc-showcase-panel">
                    <div class="lrc-showcase-content">
                        <span class="lrc-panel-badge"><i class="fa-solid fa-lock"></i> Secure Account Recovery</span>
                        <h2 class="lrc-panel-title">Choose a New Password</h2>
                        <p class="lrc-panel-subtitle">Use at least eight characters and keep your account credentials private.</p>
                    </div>
                </div>
                <div class="lrc-forms-panel">
                    <div class="lrc-form-wrapper active">
                        <h3 class="lrc-view-heading">Reset Password</h3>
                        <p class="lrc-view-subheading">Enter and confirm your new password below.</p>

                        @if($errors->any())
                            <div class="alert alert-danger">{{ $errors->first() }}</div>
                        @endif

                        <form class="lrc-interactive-form" action="{{ route('password.update') }}" method="POST">
                            @csrf
                            <input type="hidden" name="token" value="{{ $token }}">
                            <input type="hidden" name="email" value="{{ $email }}">
                            <div class="lrc-form-group">
                                <label class="lrc-field-label">New Password</label>
                                <input type="password" name="password" class="lrc-input-control" minlength="8" required autofocus>
                            </div>
                            <div class="lrc-form-group">
                                <label class="lrc-field-label">Confirm New Password</label>
                                <input type="password" name="password_confirmation" class="lrc-input-control" minlength="8" required>
                            </div>
                            <button type="submit" class="lrc-btn-submit">Reset Password</button>
                            <p class="text-center mt-3"><a href="{{ route('loginRegister') }}" class="lrc-inline-link">&larr; Back to Sign In</a></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
@endsection
