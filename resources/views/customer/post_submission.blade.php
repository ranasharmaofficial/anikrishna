@extends('frontend.layouts.master')
@section('title') Post Submission @endsection
@section('content')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"></script>
<script>
    window.summernoteJQ = window.jQuery;

</script>
<section class="common-banner">
    <div class="container">
        <div class="row">
            <div class="common-banner__content text-center">
                <h2 class="title-animation">Post Submission</h2>
            </div>
        </div>
    </div>
    <div class="banner-bg">
        <img src="{{ static_asset('assets/assets_web/images/volunteer-bg.png') }}" alt="">
    </div>
</section>
<div class="member_dash_wrapper post-dashboard-wrapper">
    @include('customer.partials.left_bar')
    <div class="member_dash_content">
        <div class="submission-page">
            <div class="submission-shell">
                <div class="submission-top">
                    <div><small>{{ $post->section }}</small>
                        <h1>Make a Submission: <span id="stepName">Details</span></h1>
                    </div><button type="button" class="outline-btn ajax-save" data-action="draft">Save for Later</button>
                </div>
                <div class="stepper">
                    @foreach(['Details','Upload Files','Contributors','For the Editors','Review'] as $i=>$label)
                    <button type="button" class="step {{ $i===0?'active':'' }}" data-step="{{ $i }}"><b>{{ $i+1 }}</b><span>{{ $label }}</span></button>
                    @endforeach
                </div>
                @if($errors->any())<div class="form-alert">{{ $errors->first() }}</div>@endif
                <form id="submissionForm" method="post" enctype="multipart/form-data" action="{{ route('customer.posts.save',$post) }}">@csrf
                    <input type="hidden" name="section" value="{{ $post->section }}"><input type="hidden" name="contributors" id="contributorsJson" value="{{ json_encode($post->contributors ?: []) }}">
                    <section class="wizard-panel active" data-panel="0">
                        <aside>
                            <h3>Submission Details</h3>
                            <p>Provide the following details to help us manage your submission.</p>
                        </aside>
                        <main>
                            <label>Title <em>*</em><input name="title" required value="{{ old('title',$post->title) }}"></label>
                            <label>Keywords<div class="tag-editor" id="keywordEditor">
                                    <div id="keywordTags" class="tag-list"></div><input type="text" id="keywordInput" placeholder="Type a keyword and press Enter">
                                </div><input type="hidden" name="keywords" id="keywordsValue" value="{{ old('keywords',$post->keywords) }}"><small>Press Enter or comma after each keyword.</small></label>
                            <label>Abstract <em>*</em><textarea name="abstract" id="abstract" class="summernote-editor" required>{{ old('abstract',$post->abstract) }}</textarea></label>
                        </main>
                    </section>
                    <section class="wizard-panel" data-panel="1">
                        <aside>
                            <h3>Upload Files</h3>
                            <p>Add documents or images needed to evaluate your submission. Maximum 10 MB each.</p>
                        </aside>
                        <main>
                            <div class="file-box">
                                <h3>Files</h3><input type="file" name="documents[]" id="documents" multiple accept=".pdf,.doc,.docx,.txt,.jpg,.jpeg,.png"><label for="documents" class="outline-btn">Add Files</label>
                                <div id="fileNames"></div>@foreach($post->files??[] as $file)<p>📄 {{ $file['name'] }}</p>@endforeach
                            </div>
                        </main>
                    </section>
                    <section class="wizard-panel" data-panel="2">
                        <aside>
                            <h3>Contributors</h3>
                            <p>Add all authors and contributors to this post.</p>
                        </aside>
                        <main>
                            <div class="file-box">
                                <div class="box-title">
                                    <h3>Contributors</h3><button type="button" id="addContributor" class="outline-btn">Add Contributor</button>
                                </div>
                                <div id="contributorList"></div>
                            </div>
                        </main>
                    </section>
                    <section class="wizard-panel" data-panel="3">
                        <aside>
                            <h3>For the Editors</h3>
                            <p>Provide anything our editorial staff should know when evaluating your submission.</p>
                        </aside>
                        <main><label>Comments for the Editor<textarea name="editor_comments" id="editor_comments" class="summernote-editor">{{ old('editor_comments',$post->editor_comments) }}</textarea></label></main>
                    </section>
                    <section class="wizard-panel" data-panel="4">
                        <aside>
                            <h3>Review and Submit</h3>
                            <p>Review the information before completing your submission.</p>
                        </aside>
                        <main id="reviewBox"></main>
                    </section>
                    <footer><button type="button" id="backBtn" class="outline-btn" disabled>Back</button>
                        <div><span id="saveStatus" style="margin-right:12px;color:#68777b"></span><button type="button" class="outline-btn ajax-save" data-action="draft">Save for Later</button><button type="button" id="continueBtn" class="primary-btn">Continue</button><button type="button" id="submitBtn" class="primary-btn" style="display:none">Submit</button></div>
                    </footer>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="contributor-modal" id="contributorModal" role="dialog" aria-modal="true" aria-labelledby="contributorModalTitle">
    <div class="modal-card">
        <div class="modal-header-custom">
            <div><span class="modal-title-icon"><i class="fa-regular fa-user"></i></span>
                <div>
                    <h2 id="contributorModalTitle">Add Contributor</h2>
                    <p>Enter the author or contributor details below.</p>
                </div>
            </div><button type="button" class="modal-x" id="closeModal" aria-label="Close">&times;</button>
        </div>
        <div class="modal-body-custom">
            <div class="modal-grid">
				<label>Family Name <em>*</em><input id="cFamily" placeholder="Enter family name"></label>
				<label>Given Name <em>*</em><input id="cGiven" placeholder="Enter given name"></label>
				<label>Preferred Public Name<input id="cPublicName" placeholder="Name used for publication"></label>
				<label>Email Address <em>*</em><input type="email" id="cEmail" placeholder="name@example.com"></label>
				<label>Country<input id="cCountry" placeholder="Enter country"></label>
				<label>Homepage URL<input type="url" id="cHomepage" placeholder="https://example.com"></label>
				<label>ORCID iD<input id="cOrcid" placeholder="0000-0000-0000-0000"></label>
				<label>Affiliation<input id="cAffiliation" placeholder="University or institution"></label>
				<label class="wide">Bio Statement<textarea id="cBio" class="summernote-editor"></textarea></label>
                <fieldset class="wide contributor-choice">
                    <legend>Contributor's role</legend><label><input type="radio" name="cRole" value="Author" checked> Author</label><label><input type="radio" name="cRole" value="Translator"> Translator</label>
                </fieldset><label class="wide publication-check"><input type="checkbox" id="cPublication" checked> Include this contributor when identifying authors in lists of publications.</label>
            </div>
        </div>
        <div class="modal-footer-custom"><button type="button" class="modal-cancel" id="cancelContributor">Cancel</button><button type="button" id="saveContributor" class="primary-btn"><i class="fa-solid fa-plus"></i> Add Contributor</button></div>
    </div>
</div>
<div id="pageAlertArea" class="page-alert-area" aria-live="polite"></div>
<div class="submit-confirm-modal" id="submitConfirmModal" role="dialog" aria-modal="true" aria-labelledby="submitConfirmTitle">
    <div class="submit-confirm-card">
        <div class="submit-confirm-icon"><i class="fa-regular fa-paper-plane"></i></div>
        <h3 id="submitConfirmTitle">Submit this post?</h3>
        <p>Once submitted, your post will be sent to the editorial team for review.</p>
        <div class="submit-confirm-actions"><button type="button" id="cancelSubmit" class="modal-cancel">Cancel</button><button type="button" id="confirmSubmit" class="primary-btn"><i class="fa-solid fa-check"></i> Yes, submit post</button></div>
    </div>
</div>
<style>
    .post-dashboard-wrapper {
        align-items: flex-start
    }

    .post-dashboard-wrapper .member_dash_content {
        min-width: 0
    }

    .post-dashboard-wrapper .member_dash_menu a[href="{{ route('customer.addPost') }}"] {
        background: #168092;
        color: #fff
    }

    .submission-page {
        background: #edf0f1;
        padding: 40px 20px 65px;
        color: #35454a;
        min-height: 720px
    }

    .submission-shell {
        max-width: 1050px;
        margin: auto
    }

    .submission-top {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 28px
    }

    .submission-top h1 {
        font-size: 27px;
        margin: 6px 0
    }

    .stepper {
        display: flex;
        background: #fff;
        padding: 16px 20px;
        margin-bottom: 32px
    }

    .step {
        flex: 1;
        border: 0;
        background: none;
        display: flex;
        align-items: center;
        gap: 8px;
        color: #7a8588;
        font-weight: 700;
        font-size: 12px
    }

    .step:after {
        content: "";
        height: 1px;
        background: #ccd4d6;
        flex: 1
    }

    .step:last-child:after {
        display: none
    }

    .step b {
        border: 2px solid #cbd3d5;
        border-radius: 50%;
        width: 28px;
        height: 28px;
        display: grid;
        place-items: center
    }

    .step.active,
    .step.done {
        color: #187e95
    }

    .step.active b,
    .step.done b {
        border-color: #187e95
    }

    .step.done b {
        background: #187e95;
        color: #fff
    }

    .wizard-panel {
        display: none;
        background: #fff;
        min-height: 390px;
        padding: 38px;
        grid-template-columns: 31% 69%;
        gap: 30px
    }

    .wizard-panel.active {
        display: grid
    }

    .wizard-panel aside p,
    label small {
        font-size: 13px;
        line-height: 1.55;
        color: #667579
    }

    .wizard-panel h3 {
        font-size: 17px
    }

    .wizard-panel label {
        display: block;
        font-weight: 700;
        margin-bottom: 20px
    }

    .wizard-panel em {
        color: #b62161;
        font-style: normal
    }

    .wizard-panel input,
    .wizard-panel textarea,
    .modal-card input {
        display: block;
        width: 100%;
        border: 1px solid #bec8ca;
        padding: 10px;
        margin-top: 7px;
        outline: none
    }

    .wizard-panel input:focus,
    .wizard-panel textarea:focus {
        border-color: #187e95
    }

    .file-box {
        border: 1px solid #ccd4d6;
        padding: 18px
    }

    .file-box>input {
        display: none
    }

    .box-title {
        display: flex;
        justify-content: space-between;
        align-items: center
    }

    .outline-btn,
    .primary-btn {
        padding: 9px 13px;
        border: 1px solid #187e95;
        background: #fff;
        color: #187e95;
        font-weight: 700
    }

    .primary-btn {
        background: #187e95;
        color: #fff
    }

    footer {
        display: flex;
        justify-content: space-between;
        background: #fff;
        border-top: 1px solid #d6dcde;
        padding: 22px 38px
    }

    .form-alert {
        padding: 12px;
        background: #fee2e2;
        color: #991b1b;
        margin-bottom: 15px
    }

    .contributor-row {
        border-top: 1px solid #ddd;
        padding: 12px 0;
        display: flex;
        justify-content: space-between
    }

    .contributor-modal {
        display: none;
        position: fixed;
        inset: 0;
        background: #0009;
        z-index: 9999;
        padding: 30px;
        overflow: auto
    }

    .contributor-modal.open {
        display: block
    }

    .modal-card {
        position: relative;
        max-width: 680px;
        margin: auto;
        background: #fff;
        padding: 32px
    }

    .modal-x {
        position: absolute;
        right: 18px;
        top: 12px;
        border: 0;
        background: none;
        font-size: 26px
    }

    .modal-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 15px
    }

    .modal-grid label {
        font-weight: 700
    }

    .modal-grid .wide {
        grid-column: 1/-1
    }

    .review-card {
        border: 1px solid #ccd4d6;
        margin-bottom: 18px;
        padding: 18px
    }

    .review-card h3 {
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px
    }

    @media(max-width:750px) {
        .step span {
            display: none
        }

        .wizard-panel.active {
            grid-template-columns: 1fr;
            padding: 22px
        }

        .modal-grid {
            grid-template-columns: 1fr
        }

        .modal-grid .wide {
            grid-column: auto
        }

        .submission-top h1 {
            font-size: 21px
        }

        .submission-page {
            padding: 25px 10px 45px
        }
    }

    .file-box>label.outline-btn {
        display: block;
        width: 100%;
        margin: 12px 0 18px;
        cursor: pointer;
        text-align: left
    }

    .selected-file {
        display: flex;
        align-items: center;
        gap: 12px;
        padding: 13px 0;
        border-bottom: 1px solid #e3e7e8
    }

    .selected-file__icon {
        width: 38px;
        height: 38px;
        border-radius: 5px;
        background: #e8f5f7;
        color: #187e95;
        display: grid;
        place-items: center
    }

    .selected-file__info {
        min-width: 0;
        flex: 1
    }

    .selected-file__name {
        display: block;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        font-weight: 700
    }

    .selected-file__size {
        display: block;
        color: #7a878a;
        font-size: 12px
    }

    .file-remove,
    .contributor-remove {
        border: 0;
        background: #fff0f3;
        color: #b4234d;
        padding: 8px 11px;
        border-radius: 4px;
        font-weight: 700
    }

    .contributor-row {
        display: grid !important;
        grid-template-columns: 48px minmax(0, 1fr) auto !important;
        gap: 14px !important;
        align-items: center !important;
        padding: 17px 0 !important;
        border-top: 0 !important;
        border-bottom: 1px solid #e0e5e6 !important;
        line-height: normal !important
    }

    .contributor-avatar {
        width: 44px;
        height: 44px;
        border-radius: 50%;
        background: #e5f3f5;
        color: #14798d;
        display: grid;
        place-items: center;
        font-weight: 800
    }

    .contributor-info,
    .contributor-info * {
        position: static !important;
        transform: none !important;
        float: none !important
    }

    .contributor-name {
        display: block !important;
        margin: 0 0 6px !important;
        color: #263b40 !important;
        font-size: 15px !important;
        line-height: 1.25 !important
    }

    .contributor-meta {
        display: flex !important;
        flex-wrap: wrap !important;
        gap: 5px 13px !important;
        color: #68777b !important;
        font-size: 12px !important;
        line-height: 1.4 !important
    }

    .contributor-meta span {
        display: inline-flex !important;
        gap: 5px !important
    }

    .empty-contributors {
        padding: 25px 5px !important;
        margin: 0 !important;
        color: #78868a !important;
        text-align: center !important
    }

    @media(max-width:750px) {
        .contributor-row {
            grid-template-columns: 40px 1fr !important
        }

        .contributor-remove {
            grid-column: 2;
            width: max-content
        }
    }

    .contributor-modal {
        padding: 24px !important;
        background: rgba(16, 28, 32, .68) !important;
        backdrop-filter: blur(2px)
    }

    .contributor-modal.open {
        display: flex !important;
        align-items: center;
        justify-content: center
    }

    .modal-card {
        width: 100%;
        max-width: 720px !important;
        margin: 0 !important;
        border: 0;
        border-radius: 10px;
        padding: 0 !important;
        overflow: hidden;
        box-shadow: 0 24px 70px rgba(0, 0, 0, .28);
        animation: modalIn .2s ease-out
    }

    .modal-header-custom {
        display: flex;
        align-items: flex-start;
        justify-content: space-between;
        padding: 22px 25px;
        border-bottom: 1px solid #e2e7e8;
        background: #fff
    }

    .modal-header-custom>div {
        display: flex;
        align-items: center;
        gap: 13px
    }

    .modal-title-icon {
        width: 42px;
        height: 42px;
        border-radius: 50%;
        display: grid;
        place-items: center;
        background: #e7f4f5;
        color: #168092
    }

    .modal-header-custom h2 {
        margin: 0;
        color: #263b40;
        font-size: 20px;
        line-height: 1.3
    }

    .modal-header-custom p {
        margin: 3px 0 0;
        color: #788589;
        font-size: 12px
    }

    .modal-x {
        position: static !important;
        width: 34px;
        height: 34px;
        display: grid;
        place-items: center;
        border-radius: 5px;
        color: #66777b;
        font-size: 25px !important;
        line-height: 1
    }

    .modal-x:hover {
        background: #f1f4f4
    }

    .modal-body-custom {
        padding: 25px;
        background: #fff
    }

    .modal-grid {
        gap: 19px 18px !important
    }

    .modal-grid label {
        margin: 0;
        color: #35494e;
        font-size: 13px
    }

    .modal-grid label em {
        color: #b4234d;
        font-style: normal
    }

    .modal-card .modal-grid input {
        height: 44px;
        margin-top: 7px;
        border: 1px solid #cbd4d6;
        border-radius: 5px;
        padding: 10px 12px;
        font-size: 14px
    }

    .modal-card .modal-grid input:focus {
        border-color: #168092;
        box-shadow: 0 0 0 3px rgba(22, 128, 146, .12)
    }

    .modal-footer-custom {
        display: flex;
        justify-content: flex-end;
        gap: 10px;
        padding: 16px 25px;
        border-top: 1px solid #e2e7e8;
        background: #f8fafa
    }

    .modal-footer-custom .primary-btn,
    .modal-cancel {
        border-radius: 5px;
        padding: 10px 17px
    }

    .modal-cancel {
        border: 1px solid #cbd4d6;
        background: #fff;
        color: #53666b;
        font-weight: 700
    }

    .modal-footer-custom .primary-btn i {
        margin-right: 6px
    }

    @keyframes modalIn {
        from {
            opacity: 0;
            transform: translateY(-12px) scale(.98)
        }

        to {
            opacity: 1;
            transform: none
        }
    }

    @media(max-width:600px) {
        .contributor-modal {
            padding: 12px !important;
            align-items: flex-end !important
        }

        .modal-card {
            border-radius: 10px 10px 0 0
        }

        .modal-header-custom,
        .modal-body-custom,
        .modal-footer-custom {
            padding-left: 18px;
            padding-right: 18px
        }

        .modal-header-custom p,
        .modal-title-icon {
            display: none
        }

        .modal-footer-custom button {
            flex: 1
        }
    }

    .review-stack {
        display: grid;
        gap: 16px
    }

    .review-section {
        border: 1px solid #d8e0e2;
        border-radius: 7px;
        background: #fff;
        overflow: hidden
    }

    .review-section__head {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 15px 18px;
        border-bottom: 1px solid #e3e8e9;
        background: #f9fbfb
    }

    .review-section__title {
        display: flex;
        align-items: center;
        gap: 10px;
        margin: 0 !important;
        color: #294147 !important;
        font-size: 15px !important
    }

    .review-section__title i {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        display: grid;
        place-items: center;
        background: #e6f3f5;
        color: #168092;
        font-size: 13px
    }

    .review-edit {
        border: 0;
        background: none;
        color: #168092;
        font-size: 12px;
        font-weight: 800
    }

    .review-section__body {
        padding: 17px 18px
    }

    .review-detail-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 17px
    }

    .review-item {
        min-width: 0
    }

    .review-item--wide {
        grid-column: 1/-1
    }

    .review-label {
        display: block !important;
        position: static !important;
        margin: 0 0 5px !important;
        color: #879397 !important;
        font-size: 10px !important;
        font-weight: 800 !important;
        line-height: 1.3 !important;
        letter-spacing: .08em !important;
        text-transform: uppercase !important
    }

    .review-value {
        display: block !important;
        position: static !important;
        margin: 0 !important;
        color: #30464b !important;
        font-size: 14px !important;
        font-weight: 500 !important;
        line-height: 1.55 !important;
        white-space: pre-wrap !important
    }

    .review-file-list {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 10px
    }

    .review-file {
        display: flex;
        align-items: center;
        gap: 10px;
        min-width: 0;
        padding: 11px 12px;
        border: 1px solid #e0e6e7;
        border-radius: 5px;
        background: #fbfcfc
    }

    .review-file i {
        flex: 0 0 34px;
        width: 34px;
        height: 34px;
        border-radius: 5px;
        display: grid;
        place-items: center;
        background: #e7f3f5;
        color: #168092
    }

    .review-file span {
        min-width: 0;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        color: #40565b;
        font-size: 12px;
        font-weight: 700
    }

    .review-contributor-list {
        display: grid;
        gap: 9px
    }

    .review-contributor {
        display: flex;
        align-items: center;
        gap: 11px;
        padding: 9px 0
    }

    .review-contributor-avatar {
        width: 36px;
        height: 36px;
        flex: 0 0 36px;
        border-radius: 50%;
        display: grid;
        place-items: center;
        background: #e5f3f5;
        color: #14798d;
        font-size: 11px;
        font-weight: 800
    }

    .review-contributor strong {
        display: block;
        color: #30464b;
        font-size: 13px
    }

    .review-contributor small {
        display: block;
        color: #7b898c;
        font-size: 11px
    }

    .review-empty {
        margin: 0 !important;
        padding: 8px 0;
        color: #899598 !important;
        font-size: 13px !important
    }

    @media(max-width:650px) {

        .review-detail-grid,
        .review-file-list {
            grid-template-columns: 1fr
        }

        .review-item--wide {
            grid-column: auto
        }

        .review-section__body {
            padding: 15px
        }
    }

    .page-alert-area {
        position: fixed;
        top: 90px;
        right: 24px;
        z-index: 10050;
        width: min(420px, calc(100% - 32px));
        display: grid;
        gap: 10px
    }

    .page-alert {
        display: flex;
        align-items: flex-start;
        gap: 12px;
        padding: 14px 15px;
        border: 1px solid transparent;
        border-radius: 7px;
        background: #fff;
        box-shadow: 0 10px 30px rgba(0, 0, 0, .16);
        animation: alertIn .22s ease
    }

    .page-alert--danger {
        border-color: #f1b7bd;
        background: #fff2f3;
        color: #842029
    }

    .page-alert--success {
        border-color: #a9d7bd;
        background: #edf9f2;
        color: #0f5132
    }

    .page-alert--warning {
        border-color: #f1d392;
        background: #fff8e7;
        color: #664d03
    }

    .page-alert__icon {
        font-size: 18px;
        line-height: 1.3
    }

    .page-alert__body {
        flex: 1
    }

    .page-alert__body strong {
        display: block;
        margin-bottom: 2px;
        font-size: 14px
    }

    .page-alert__body span {
        display: block;
        font-size: 12px;
        line-height: 1.45;
        white-space: pre-line
    }

    .page-alert__close {
        border: 0;
        background: transparent;
        color: inherit;
        font-size: 20px;
        line-height: 1;
        opacity: .65
    }

    .submit-confirm-modal {
        display: none;
        position: fixed;
        inset: 0;
        z-index: 10040;
        padding: 20px;
        background: rgba(16, 28, 32, .68);
        backdrop-filter: blur(2px)
    }

    .submit-confirm-modal.open {
        display: flex;
        align-items: center;
        justify-content: center
    }

    .submit-confirm-card {
        width: 100%;
        max-width: 430px;
        padding: 30px;
        border-radius: 10px;
        background: #fff;
        text-align: center;
        box-shadow: 0 24px 70px rgba(0, 0, 0, .28);
        animation: modalIn .2s ease-out
    }

    .submit-confirm-icon {
        width: 62px;
        height: 62px;
        margin: 0 auto 17px;
        border-radius: 50%;
        display: grid;
        place-items: center;
        background: #e6f3f5;
        color: #168092;
        font-size: 24px
    }

    .submit-confirm-card h3 {
        margin: 0 0 8px;
        color: #263b40;
        font-size: 21px
    }

    .submit-confirm-card p {
        margin: 0 auto 23px;
        color: #718084;
        font-size: 13px;
        line-height: 1.6
    }

    .submit-confirm-actions {
        display: flex;
        justify-content: center;
        gap: 10px
    }

    .submit-confirm-actions button {
        padding: 10px 17px;
        border-radius: 5px
    }

    .submit-confirm-actions .primary-btn i {
        margin-right: 6px
    }

    @keyframes alertIn {
        from {
            opacity: 0;
            transform: translateX(15px)
        }

        to {
            opacity: 1;
            transform: none
        }
    }

    @media(max-width:500px) {
        .page-alert-area {
            top: 75px;
            right: 16px
        }

        .submit-confirm-actions {
            flex-direction: column-reverse
        }

        .submit-confirm-actions button {
            width: 100%
        }
    }

    .rich-editor {
        margin-top: 7px;
        border: 1px solid #bec8ca;
        background: #fff
    }

    .rich-editor:focus-within {
        border-color: #168092;
        box-shadow: 0 0 0 3px rgba(22, 128, 146, .1)
    }

    .rich-toolbar {
        display: flex;
        align-items: center;
        gap: 2px;
        padding: 6px 8px;
        border-bottom: 1px solid #dce2e3;
        background: #f8fafa
    }

    .rich-toolbar button {
        width: 32px;
        height: 30px;
        border: 0;
        border-radius: 3px;
        background: transparent;
        color: #405459;
        font-size: 13px
    }

    .rich-toolbar button:hover {
        background: #e5f1f3;
        color: #168092
    }

    .rich-content {
        min-height: 160px;
        padding: 12px;
        color: #30464b;
        font-size: 14px;
        font-weight: 400;
        line-height: 1.6;
        outline: 0
    }

    .rich-editor textarea {
        display: none !important
    }

    .contributor-bio-editor .rich-content {
        min-height: 110px
    }

    .tag-editor {
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        gap: 7px;
        min-height: 46px;
        margin-top: 7px;
        padding: 7px 9px;
        border: 1px solid #bec8ca;
        background: #fff;
        cursor: text
    }

    .tag-editor:focus-within {
        border-color: #168092;
        box-shadow: 0 0 0 3px rgba(22, 128, 146, .1)
    }

    .tag-list {
        display: contents
    }

    .keyword-tag {
        display: inline-flex;
        align-items: center;
        gap: 7px;
        padding: 5px 8px;
        border-radius: 4px;
        background: #e5f3f5;
        color: #146f80;
        font-size: 12px;
        font-weight: 700
    }

    .keyword-tag button {
        border: 0;
        background: none;
        color: #146f80;
        font-size: 16px;
        line-height: 1;
        padding: 0
    }

    .tag-editor>input {
        flex: 1;
        min-width: 180px;
        width: auto !important;
        height: 30px !important;
        margin: 0 !important;
        padding: 3px !important;
        border: 0 !important;
        box-shadow: none !important
    }

    .contributor-choice {
        padding: 13px 15px;
        border: 1px solid #d7dfe1;
        border-radius: 5px
    }

    .contributor-choice legend {
        float: none;
        width: auto;
        margin: 0 0 8px;
        padding: 0 5px;
        color: #35494e;
        font-size: 12px;
        font-weight: 800
    }

    .contributor-choice label {
        display: inline-flex;
        align-items: center;
        gap: 7px;
        margin-right: 25px
    }

    .contributor-choice input,
    .publication-check input {
        width: 15px !important;
        height: 15px !important;
        margin: 0 !important;
        display: inline-block !important;
        accent-color: #168092
    }

    .publication-check {
        display: flex !important;
        align-items: center;
        gap: 9px;
        padding: 13px 15px;
        border: 1px solid #d7dfe1;
        border-radius: 5px;
        font-weight: 500 !important
    }

    .modal-card {
        max-height: calc(100vh - 40px);
        overflow: auto !important
    }

    .note-editor.note-frame {
        margin-top: 7px;
        border: 1px solid #bec8ca;
        border-radius: 4px;
        box-shadow: none
    }

    .note-editor.note-frame:focus-within {
        border-color: #168092;
        box-shadow: 0 0 0 3px rgba(22, 128, 146, .1)
    }

    .note-editor .note-toolbar {
        padding: 7px 8px;
        border-bottom: 1px solid #dce2e3;
        background: #f8fafa
    }

    .note-editor .note-btn {
        padding: 5px 9px;
        border: 1px solid #d9e0e1;
        background: #fff;
        color: #405459
    }

    .note-editor .note-editable {
        color: #30464b;
        font-size: 14px;
        font-weight: 400;
        line-height: 1.65;
        background: #fff
    }

    .note-editor .note-placeholder {
        color: #a0aaad;
        font-weight: 400
    }

    .modal-card .note-editor {
        width: 100%
    }

    .modal-card .note-editable {
        min-height: 120px
    }

    .note-modal {
        z-index: 10060 !important
    }

    .note-popover {
        z-index: 10061 !important
    }

</style>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        let current = 0
            , contributors = JSON.parse(document.getElementById('contributorsJson').value || '[]')
            , queuedFiles = []
            , savedFiles = {!! json_encode($post->files ?: [], JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_AMP | JSON_HEX_QUOT) !!};
        const panels = [...document.querySelectorAll('.wizard-panel')]
            , steps = [...document.querySelectorAll('.step')]
            , names = ['Details', 'Upload Files', 'Contributors', 'For the Editors', 'Review'];
        summernoteJQ('.summernote-editor').summernote({
            height: 180
            , placeholder: 'Write your text here...'
            , dialogsInBody: true
            , disableDragAndDrop: true
            , toolbar: [
                ['style', ['style']]
                , ['font', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']]
                , ['para', ['ul', 'ol', 'paragraph']]
                , ['insert', ['link']]
                , ['view', ['fullscreen', 'codeview']]
            ]
        });
        let keywords = (document.getElementById('keywordsValue').value || '').split(',').map(value => value.trim()).filter(Boolean);
        const renderKeywords = () => {
            keywordTags.innerHTML = keywords.map((tag, index) => `<span class="keyword-tag">${clean(tag)}<button type="button" data-keyword="${index}" aria-label="Remove">&times;</button></span>`).join('');
            keywordsValue.value = keywords.join(', ');
            keywordTags.querySelectorAll('button').forEach(button => button.onclick = () => {
                keywords.splice(Number(button.dataset.keyword), 1);
                renderKeywords()
            })
        };
        const addKeywords = value => {
            value.split(',').map(item => item.trim()).filter(Boolean).forEach(item => {
                if (!keywords.some(saved => saved.toLowerCase() === item.toLowerCase())) keywords.push(item)
            });
            keywordInput.value = '';
            renderKeywords()
        };
        keywordInput.addEventListener('keydown', event => {
            if (event.key === 'Enter' || event.key === ',') {
                event.preventDefault();
                addKeywords(keywordInput.value)
            }
        });
        keywordInput.addEventListener('blur', () => {
            if (keywordInput.value.trim()) addKeywords(keywordInput.value)
        });
        keywordEditor.addEventListener('click', () => keywordInput.focus());

        function show(n) {
            current = n;
            panels.forEach((p, i) => p.classList.toggle('active', i === n));
            steps.forEach((s, i) => {
                s.classList.toggle('active', i === n);
                s.classList.toggle('done', i < n)
            });
            stepName.textContent = names[n];
            backBtn.disabled = n === 0;
            continueBtn.style.display = n === 4 ? 'none' : '';
            submitBtn.style.display = n === 4 ? 'inline-block' : 'none';
            if (n === 4) review()
        }
        continueBtn.onclick = () => {
            if (current === 0 && !document.getElementById('submissionForm').reportValidity()) return;
            show(Math.min(4, current + 1))
        };
        backBtn.onclick = () => show(Math.max(0, current - 1));
        steps.forEach((s, i) => s.onclick = () => show(i));
        const clean = value => String(value || '').replace(/[&<>'"]/g, char => ({
            '&': '&amp;'
            , '<': '&lt;'
            , '>': '&gt;'
            , "'": '&#39;'
            , '"': '&quot;'
        } [char]));
        const fileSize = bytes => bytes < 1024 ? bytes + ' B' : bytes < 1048576 ? (bytes / 1024).toFixed(1) + ' KB' : (bytes / 1048576).toFixed(1) + ' MB';

        function syncFiles() {
            const transfer = new DataTransfer();
            queuedFiles.forEach(file => transfer.items.add(file));
            documents.files = transfer.files;
            fileNames.innerHTML = queuedFiles.length ? queuedFiles.map((file, i) => `<div class="selected-file"><span class="selected-file__icon">▤</span><span class="selected-file__info"><span class="selected-file__name">${clean(file.name)}</span><span class="selected-file__size">${fileSize(file.size)}</span></span><button type="button" class="file-remove" data-file="${i}">Remove</button></div>`).join('') : '<p class="empty-contributors">No new files selected.</p>';
            document.querySelectorAll('.file-remove').forEach(button => button.onclick = () => {
                queuedFiles.splice(Number(button.dataset.file), 1);
                syncFiles()
            })
        }
        window.clearPostFileQueue = () => {
            queuedFiles = [];
            syncFiles()
        };
        documents.onchange = () => {
            [...documents.files].forEach(file => {
                if (!queuedFiles.some(saved => saved.name === file.name && saved.size === file.size && saved.lastModified === file.lastModified)) queuedFiles.push(file)
            });
            syncFiles()
        };

        function render() {
            contributorList.innerHTML = contributors.length ? contributors.map((c, i) => {
                const initials = ((c.given || '').charAt(0) + (c.family || '').charAt(0)).toUpperCase();
                return `<div class="contributor-row"><span class="contributor-avatar">${clean(initials||'C')}</span><div class="contributor-info"><strong class="contributor-name">${clean(c.public_name||c.given+' '+c.family)}</strong><div class="contributor-meta"><span>✉ ${clean(c.email)}</span>${c.affiliation?`<span>⌂ ${clean(c.affiliation)}</span>`:''}${c.country?`<span>◎ ${clean(c.country)}</span>`:''}<span>● ${clean(c.role||'Author')}</span></div></div><button type="button" class="contributor-remove remove-c" data-i="${i}">Remove</button></div>`
            }).join('') : '<p class="empty-contributors">No contributors added yet.</p>';
            contributorsJson.value = JSON.stringify(contributors);
            document.querySelectorAll('.remove-c').forEach(b => b.onclick = () => {
                contributors.splice(Number(b.dataset.i), 1);
                render()
            })
        }
        const closeContributorModal = () => contributorModal.classList.remove('open');
        addContributor.onclick = () => {
            contributorModal.classList.add('open');
            setTimeout(() => cGiven.focus(), 100)
        };
        closeModal.onclick = closeContributorModal;
        cancelContributor.onclick = closeContributorModal;
        contributorModal.onclick = event => {
            if (event.target === contributorModal) closeContributorModal()
        };
        document.addEventListener('keydown', event => {
            if (event.key === 'Escape') closeContributorModal()
        });
        saveContributor.onclick = () => {
            if (!cGiven.value || !cFamily.value || !cEmail.value) {
                window.showPageAlert('Please enter given name, family name and email address.', 'warning');
                return
            }
            contributors.push({
                given: cGiven.value
                , family: cFamily.value
                , public_name: cPublicName.value
                , email: cEmail.value
                , country: cCountry.value
                , homepage: cHomepage.value
                , orcid: cOrcid.value
                , bio: summernoteJQ('#cBio').summernote('code')
                , affiliation: cAffiliation.value
                , role: document.querySelector('[name="cRole"]:checked').value
                , include_publication: cPublication.checked
            });
            ['cGiven', 'cFamily', 'cPublicName', 'cEmail', 'cCountry', 'cHomepage', 'cOrcid', 'cAffiliation'].forEach(id => document.getElementById(id).value = '');
            summernoteJQ('#cBio').summernote('reset');
            document.querySelector('[name="cRole"][value="Author"]').checked = true;
            cPublication.checked = true;
            closeContributorModal();
            render()
        };

        function review() {
            const f = document.getElementById('submissionForm')
                , plain = html => {
                    const node = document.createElement('div');
                    node.innerHTML = html || '';
                    return node.textContent.trim()
                }
                , allFiles = [...savedFiles.map(file => ({
                    name: file.name
                })), ...queuedFiles]
                , filesHtml = allFiles.length ? allFiles.map(file => `<div class="review-file"><i class="fa-regular fa-file-lines"></i><span title="${clean(file.name)}">${clean(file.name)}</span></div>`).join('') : '<p class="review-empty">No files have been added.</p>'
                , contributorsHtml = contributors.length ? contributors.map(c => {
                    const initials = ((c.given || '').charAt(0) + (c.family || '').charAt(0)).toUpperCase();
                    return `<div class="review-contributor"><span class="review-contributor-avatar">${clean(initials||'C')}</span><div><strong>${clean(c.public_name||c.given+' '+c.family)} <small>(${clean(c.role||'Author')})</small></strong><small>${clean(c.email)}${c.affiliation?' · '+clean(c.affiliation):''}</small></div></div>`
                }).join('') : '<p class="review-empty">No contributors have been added.</p>';
            reviewBox.innerHTML = `<div class="review-stack"><section class="review-section"><header class="review-section__head"><h3 class="review-section__title"><i class="fa-regular fa-file-lines"></i> Submission Details</h3><button type="button" class="review-edit" data-review-step="0">Edit</button></header><div class="review-section__body review-detail-grid"><div class="review-item review-item--wide"><span class="review-label">Title</span><p class="review-value">${clean(f.title.value)||'—'}</p></div><div class="review-item"><span class="review-label">Section</span><p class="review-value">${clean(f.section.value)||'—'}</p></div><div class="review-item"><span class="review-label">Keywords</span><p class="review-value">${clean(f.keywords.value)||'—'}</p></div><div class="review-item review-item--wide"><span class="review-label">Abstract</span><p class="review-value">${clean(plain(f.abstract.value))||'—'}</p></div></div></section><section class="review-section"><header class="review-section__head"><h3 class="review-section__title"><i class="fa-solid fa-paperclip"></i> Files <small>(${allFiles.length})</small></h3><button type="button" class="review-edit" data-review-step="1">Edit</button></header><div class="review-section__body"><div class="review-file-list">${filesHtml}</div></div></section><section class="review-section"><header class="review-section__head"><h3 class="review-section__title"><i class="fa-solid fa-users"></i> Contributors <small>(${contributors.length})</small></h3><button type="button" class="review-edit" data-review-step="2">Edit</button></header><div class="review-section__body"><div class="review-contributor-list">${contributorsHtml}</div></div></section><section class="review-section"><header class="review-section__head"><h3 class="review-section__title"><i class="fa-regular fa-message"></i> For the Editors</h3><button type="button" class="review-edit" data-review-step="3">Edit</button></header><div class="review-section__body"><p class="review-value">${clean(plain(f.editor_comments.value))||'No comments provided.'}</p></div></section></div>`;
            document.querySelectorAll('[data-review-step]').forEach(button => button.onclick = () => show(Number(button.dataset.reviewStep)))
        }
        syncFiles();
        renderKeywords();
        render();
        show(0)
    });

</script>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const form = document.getElementById('submissionForm')
            , status = document.getElementById('saveStatus')
            , confirmBox = document.getElementById('submitConfirmModal');
        window.showPageAlert = (message, type = 'danger') => {
            const titles = {
                    danger: 'Something went wrong'
                    , success: 'Success'
                    , warning: 'Please check'
                }
                , icons = {
                    danger: 'fa-circle-exclamation'
                    , success: 'fa-circle-check'
                    , warning: 'fa-triangle-exclamation'
                }
                , alert = document.createElement('div');
            alert.className = `page-alert page-alert--${type}`;
            alert.innerHTML = `<i class="fa-solid ${icons[type]} page-alert__icon"></i><div class="page-alert__body"><strong>${titles[type]}</strong><span></span></div><button type="button" class="page-alert__close" aria-label="Close">&times;</button>`;
            alert.querySelector('span').textContent = message;
            alert.querySelector('button').onclick = () => alert.remove();
            pageAlertArea.appendChild(alert);
            setTimeout(() => alert.remove(), 6000)
        };
        const askSubmit = () => new Promise(resolve => {
            confirmBox.classList.add('open');
            const finish = value => {
                confirmBox.classList.remove('open');
                confirmSubmit.onclick = null;
                cancelSubmit.onclick = null;
                resolve(value)
            };
            confirmSubmit.onclick = () => finish(true);
            cancelSubmit.onclick = () => finish(false)
        });
        async function save(action) {
            if (action === 'submit' && !form.reportValidity()) {
                window.showPageAlert('Please complete all required fields before submitting.', 'warning');
                return
            }
            if (action === 'submit' && !await askSubmit()) return;
            const data = new FormData(form);
            data.set('action', action);
            status.textContent = 'Saving…';
            document.querySelectorAll('.ajax-save,#submitBtn').forEach(b => b.disabled = true);
            try {
                const response = await fetch(form.action, {
                    method: 'POST'
                    , body: data
                    , headers: {
                        'Accept': 'application/json'
                        , 'X-Requested-With': 'XMLHttpRequest'
                    }
                });
                const result = await response.json();
                if (!response.ok) {
                    const errors = result.errors ? Object.values(result.errors).flat().join('\n') : result.message;
                    throw new Error(errors || 'Unable to save.')
                }
                status.textContent = 'Saved just now';
                if (action === 'draft') {
                    window.showPageAlert('Your draft has been saved successfully.', 'success');
                    if (window.clearPostFileQueue) window.clearPostFileQueue()
                }
                if (result.redirect) window.location.href = result.redirect;
            } catch (error) {
                status.textContent = 'Save failed';
                window.showPageAlert(error.message, 'danger')
            } finally {
                document.querySelectorAll('.ajax-save,#submitBtn').forEach(b => b.disabled = false)
            }
        }
        document.querySelectorAll('.ajax-save').forEach(b => b.addEventListener('click', () => save(b.dataset.action)));
        document.getElementById('submitBtn').addEventListener('click', () => save('submit'));
        form.addEventListener('submit', e => {
            e.preventDefault();
            save('draft')
        });
    });

</script>
@endsection
