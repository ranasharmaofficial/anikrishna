@extends('frontend.layouts.master')

@section('title') Add Post @endsection

@section('content')
<section class="common-banner">
    <div class="container">
        <div class="row">
            <div class="common-banner__content text-center">
                <h2 class="title-animation">Add Post</h2>
            </div>
        </div>
    </div>
    <div class="banner-bg">
        <img src="{{ static_asset('assets/assets_web/images/volunteer-bg.png') }}" alt="">
    </div>
</section>

<div class="member_dash_wrapper add-post-dashboard">
    @include('customer.partials.left_bar')

    <div class="member_dash_content">
        <div class="member_dash_card add-post-card">
            <div class="add-post-heading">
                <span class="add-post-kicker">New submission</span>
                <h1>Add a post</h1>
                <p>
                    Please complete the form below to submit your post. Provide as much detail as
                    possible so it can be reviewed and published correctly.
                </p>
                <p>You can review and correct all information before submitting.</p>
            </div>

            <form method="post" action="{{ route('customer.posts.start') }}" class="add-post-form" id="startPostForm">
                @csrf

                <div class="add-post-field">
                    <label for="post-title">Title <span aria-hidden="true">*</span></label>
                    <div class="title-input-wrap">
                        <input
                            type="text"
                            id="post-title"
                            name="title"
                            value="{{ old('title') }}"
                            maxlength="180"
                            required
                            aria-required="true"
                        >
                        <i class="fa-solid fa-font" aria-hidden="true"></i>
                    </div>
                    @error('title') <small class="field-error">{{ $message }}</small> @enderror
                </div>

                <fieldset class="section-options">
                    <legend>Section <span aria-hidden="true">*</span></legend>
                    <p>Select the section that best describes your post.</p>

                    @php
                        $sections = [
                            'Articles',
                            'Latest News',
                            'Events',
                            'Announcements',
                            'Success Stories',
                            'Community Updates',
                            'Research & Insights',
                            'Health & Wellness',
                            'Education',
                            'Other',
                        ];
                    @endphp

                    <div class="section-list">
                        @foreach ($sections as $section)
                            <label>
                                <input
                                    type="radio"
                                    name="section"
                                    value="{{ $section }}"
                                    {{ old('section') === $section ? 'checked' : '' }}
                                    {{ $loop->first ? 'required' : '' }}
                                >
                                <span>{{ $section }}</span>
                            </label>
                        @endforeach
                    </div>
                    @error('section') <small class="field-error">{{ $message }}</small> @enderror
                </fieldset>

                <div class="add-post-actions">
                    <button type="submit" class="add-post-submit" id="startPostButton">Save and continue</button>
                    <span id="startPostStatus" style="margin-left:12px;color:#68777b"></span>
                </div>
            </form>
        </div>
    </div>
</div>

<style>
    .add-post-dashboard { align-items: flex-start; }
    .add-post-card { background: #eef1f3; padding: 42px 24px; }
    .add-post-heading,
    .add-post-form { max-width: 620px; margin-inline: auto; }
    .add-post-heading { background: #fff; padding: 34px 38px 12px; border: 1px solid #dfe3e6; border-bottom: 0; }
    .add-post-heading h1 { margin: 4px 0 16px; color: #263b40; font-size: 30px; }
    .add-post-heading p { color: #56666a; font-size: 14px; line-height: 1.7; margin-bottom: 10px; }
    .add-post-kicker { color: #168092; font-size: 12px; font-weight: 700; letter-spacing: .09em; text-transform: uppercase; }
    .add-post-form { background: #fff; padding: 16px 38px 38px; border: 1px solid #dfe3e6; border-top: 0; }
    .add-post-field { margin-top: 24px; }
    .add-post-field > label,
    .section-options legend { color: #263b40; font-size: 15px; font-weight: 700; }
    .add-post-field label span,
    .section-options legend span { color: #be1e62; }
    .title-input-wrap { position: relative; margin-top: 7px; }
    .title-input-wrap input,
    .add-post-field textarea { width: 100%; border: 1px solid #bac4c7; border-radius: 0; background: #fff; color: #263b40; outline: none; transition: border-color .2s, box-shadow .2s; }
    .title-input-wrap input { height: 44px; padding: 8px 44px 8px 12px; }
    .add-post-field textarea { min-height: 125px; margin-top: 7px; padding: 11px 12px; resize: vertical; }
    .title-input-wrap input:focus,
    .add-post-field textarea:focus { border-color: #168092; box-shadow: 0 0 0 2px rgba(22, 128, 146, .13); }
    .title-input-wrap i { position: absolute; top: 50%; right: 14px; color: #526368; transform: translateY(-50%); }
    .section-options { position: relative; margin-top: 28px; padding: 25px 18px 18px; border: 1px solid #cfd6d8; }
    .section-options legend { position: absolute; top: -13px; left: 14px; width: auto; padding: 3px 7px; background: #edf0f1; line-height: 20px; }
    .section-options > p { color: #56666a; font-size: 13px; margin: 0 0 14px; }
    .section-list { display: grid; gap: 9px; }
    .section-list label { display: flex; align-items: center; width: fit-content; margin: 0; color: #405156; font-size: 13px; cursor: pointer; }
    .section-list input { width: 15px; height: 15px; margin: 0 8px 0 0; accent-color: #168092; }
    .field-help { display: block; margin-top: 6px; color: #718084; font-size: 12px; }
    .field-error { display: block; margin-top: 6px; color: #b42318; }
    .add-post-actions { margin-top: 26px; }
    .add-post-submit { border: 0; border-radius: 3px; background: #168092; padding: 12px 25px; color: #fff; font-weight: 700; transition: background .2s; }
    .add-post-submit:hover { background: #106b79; }
    .add-post-dashboard .member_dash_menu a[href="{{ route('customer.addPost') }}"] { background: #168092; color: #fff; }

    @media (max-width: 767px) {
        .add-post-card { padding: 20px 10px; }
        .add-post-heading { padding: 25px 20px 10px; }
        .add-post-form { padding: 12px 20px 28px; }
        .add-post-heading h1 { font-size: 25px; }
    }
</style>
<script>
document.addEventListener('DOMContentLoaded',()=>{const form=document.getElementById('startPostForm'),button=document.getElementById('startPostButton'),status=document.getElementById('startPostStatus');form.addEventListener('submit',async e=>{e.preventDefault();if(!form.reportValidity())return;button.disabled=true;status.textContent='Saving…';try{const response=await fetch(form.action,{method:'POST',body:new FormData(form),headers:{Accept:'application/json','X-Requested-With':'XMLHttpRequest'}});const result=await response.json();if(!response.ok)throw new Error(result.message||Object.values(result.errors||{}).flat().join('\n'));status.textContent='Saved';window.location.href=result.redirect}catch(error){status.textContent='Save failed';alert(error.message)}finally{button.disabled=false}})});
</script>
@endsection
