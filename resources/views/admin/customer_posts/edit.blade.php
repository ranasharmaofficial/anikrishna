@extends('admin.include.master')
@section('title','Publication Editor')
@section('content')
<div class="page-header-breadcrumb mt-3" style="background:linear-gradient(45deg,#f33057,#3858f9)">
    <div class="d-flex justify-content-between align-items-center w-100 p-3">
        <div>
            <h4 class="text-white mb-1">Publication Editor</h4><small class="text-white-50">Prepare and publish the customer submission</small>
        </div><a href="{{ route('admin.customer-posts.show',$post) }}" class="btn btn-light"><i class="ri-eye-line"></i> Preview Submission</a>
    </div>
</div>
<div class="main-content app-content">
    <div class="container-fluid">
        <form id="publicationEditorForm" method="post" enctype="multipart/form-data" action="{{ route('admin.customer-posts.update',$post) }}">@csrf @method('PUT')
            <div id="ajaxFormAlert" class="alert d-none" role="alert"></div>
            @if($errors->any())<div class="alert alert-danger">
                <ul class="mb-0">@foreach($errors->all() as $error)<li>{{ $error }}</li>@endforeach</ul>
            </div>@endif
            <div class="row">
                <div class="col-xl-8">
                    <div class="card custom-card">
                        <div class="card-header">
                            <div class="card-title">Article Content</div>
                        </div>
                        <div class="card-body">
                            <div class="row g-3">
                                <div class="col-12"><label class="form-label">Publication Title *</label><input class="form-control" name="title" value="{{ old('title',$post->title) }}" required></div>
                                <div class="col-12"><label class="form-label">URL Slug</label>
                                    <div class="input-group"><span class="input-group-text">latest-publication/</span><input class="form-control" name="slug" value="{{ old('slug',$post->slug) }}"></div>
                                </div>
                                <div class="col-md-6"><label class="form-label">Section *</label><input class="form-control" name="section" value="{{ old('section',$post->section) }}" required></div>
                                <div class="col-md-6"><label class="form-label">Keywords</label><input class="form-control" name="keywords" value="{{ old('keywords',$post->keywords) }}"></div>
                                <div class="col-12"><label class="form-label">Short Excerpt</label><textarea class="form-control" name="excerpt" rows="3">{{ old('excerpt',$post->excerpt) }}</textarea></div>
                                <div class="col-12"><label class="form-label">Abstract *</label><textarea id="summernote1" name="abstract" required>{!! old('abstract',$post->abstract) !!}</textarea></div>
                                <div class="col-12"><label class="form-label">Full Publication Content</label><textarea id="publicationContent" name="content">{!! old('content',$post->content) !!}</textarea></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4">
                    <div class="card custom-card">
                        <div class="card-header">
                            <div class="card-title">Publish Settings</div>
                        </div>
                        <div class="card-body">
                            <div class="mb-3"><label class="form-label">Status *</label><select class="form-select" name="status">@foreach(['draft'=>'Draft','submitted'=>'Under Review','approved'=>'Approved / Live','rejected'=>'Rejected'] as $value=>$label)<option value="{{ $value }}" @selected(old('status',$post->status)===$value)>{{ $label }}</option>@endforeach</select><small class="text-muted">Only Approved posts appear publicly.</small></div>
                            <div class="mb-3"><label class="form-label">Publication Date</label><input type="date" class="form-control" name="published_date" value="{{ old('published_date',optional($post->published_date)->format('Y-m-d')) }}"></div>
                            <div class="mb-3"><label class="form-label">Featured Image</label><input type="file" class="form-control" name="featured_image" accept="image/jpeg,image/png,image/webp">@if($post->featured_image)<img class="img-fluid rounded mt-2" src="{{ $post->featured_image_url }}">@endif</div>
                            <div class="row g-2">
                                <div class="col-6"><label class="form-label">Volume</label><input class="form-control" name="volume" value="{{ old('volume',$post->volume) }}"></div>
                                <div class="col-6"><label class="form-label">Issue</label><input class="form-control" name="issue" value="{{ old('issue',$post->issue) }}"></div>
                                <div class="col-6"><label class="form-label">Pages</label><input class="form-control" name="page_range" value="{{ old('page_range',$post->page_range) }}"></div>
                                <div class="col-6"><label class="form-label">DOI</label><input class="form-control" name="doi" value="{{ old('doi',$post->doi) }}"></div>
                            </div>
                            <div class="mt-3"><label class="form-label">Internal Editor Notes</label><textarea class="form-control" id="summernote2" name="editor_comments" rows="4">{{ old('editor_comments',$post->editor_comments) }}</textarea></div>
                        </div>
                        <div class="card-footer d-grid gap-2"><button class="btn btn-primary btn-lg"><i class="ri-save-line"></i> Save Publication</button><a class="btn btn-light" href="{{ route('admin.customer-posts.index') }}">Back</a></div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection
@section('script')
<script>
    $(function() {
        $('#publicationContent').summernote({
            height: 400
            , dialogsInBody: true
        });

        const form = document.getElementById('publicationEditorForm');
        const alertBox = document.getElementById('ajaxFormAlert');
        const saveButton = form.querySelector('button[type="submit"]');
        const originalButtonHtml = saveButton.innerHTML;

        function showAlert(message, type) {
            alertBox.className = 'alert alert-' + type;
            alertBox.textContent = message;
            alertBox.scrollIntoView({
                behavior: 'smooth'
                , block: 'center'
            });
        }

        function clearValidation() {
            form.querySelectorAll('.is-invalid').forEach(el => el.classList.remove('is-invalid'));
            form.querySelectorAll('.ajax-invalid-feedback').forEach(el => el.remove());
        }

        function showValidation(errors) {
            Object.entries(errors || {}).forEach(([name, messages]) => {
                const field = form.querySelector('[name="' + CSS.escape(name) + '"]');
                if (!field) return;
                field.classList.add('is-invalid');
                const feedback = document.createElement('div');
                feedback.className = 'invalid-feedback d-block ajax-invalid-feedback';
                feedback.textContent = messages[0];
                const editor = field.nextElementSibling && field.nextElementSibling.classList.contains('note-editor') ?
                    field.nextElementSibling : field;
                editor.insertAdjacentElement('afterend', feedback);
            });
        }

        form.addEventListener('submit', async function(event) {
            event.preventDefault();
            clearValidation();
            alertBox.className = 'alert d-none';
            $('.summernote, #summernote1, #publicationContent').each(function() {
                if ($(this).next('.note-editor').length) $(this).val($(this).summernote('code'));
            });

            saveButton.disabled = true;
            saveButton.innerHTML = '<span class="spinner-border spinner-border-sm me-1"></span> Saving...';

            try {
                const response = await fetch(form.action, {
                    method: 'POST'
                    , body: new FormData(form)
                    , headers: {
                        'Accept': 'application/json'
                        , 'X-Requested-With': 'XMLHttpRequest'
                    }
                });
                const result = await response.json();
                if (!response.ok) {
                    showValidation(result.errors);
                    throw new Error(result.message || 'Please correct the highlighted fields.');
                }

                showAlert(result.message, 'success');
                if (result.post.slug) form.querySelector('[name="slug"]').value = result.post.slug;
                const image = form.querySelector('input[name="featured_image"]');
                image.value = '';
                if (result.post.featured_image_url) {
                    let preview = image.parentElement.querySelector('img');
                    if (!preview) {
                        preview = document.createElement('img');
                        preview.className = 'img-fluid rounded mt-2';
                        image.insertAdjacentElement('afterend', preview);
                    }
                    preview.src = result.post.featured_image_url + '?v=' + Date.now();
                }
            } catch (error) {
                showAlert(error.message || 'Unable to save the submission.', 'danger');
            } finally {
                saveButton.disabled = false;
                saveButton.innerHTML = originalButtonHtml;
            }
        });
    });

</script>
@endsection
