@if($errors->any())
    <div class="alert alert-danger">
        <ul class="mb-0">@foreach($errors->all() as $error)<li>{{ $error }}</li>@endforeach</ul>
    </div>
@endif

<form action="{{ $updateRoute }}" method="POST" enctype="multipart/form-data" id="property-edit-form">
    @csrf
    @method('PUT')

    <div class="row g-3">
        <div class="col-md-4">
            <label class="form-label">Purpose <span class="text-danger">*</span></label>
            <select name="purpose" class="form-select" required>
                @foreach(['Sale', 'Rent', 'PG'] as $purpose)
                    <option value="{{ $purpose }}" @selected(old('purpose', ucfirst(strtolower($property->purpose))) === $purpose)>{{ $purpose }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-md-4">
            <label class="form-label">Property Type <span class="text-danger">*</span></label>
            <select name="property_type_id" id="property_type_id" class="form-select" required>
                @foreach($propertyTypes as $type)
                    <option value="{{ $type->id }}" @selected(old('property_type_id', $property->property_type_id) == $type->id)>{{ $type->name }}</option>
                @endforeach
            </select>
        </div>
        @if($isAdmin)
            <div class="col-md-4">
                <label class="form-label">Status <span class="text-danger">*</span></label>
                <select name="status" class="form-select" required>
                    <option value="0" @selected(old('status', $property->status) == 0)>Pending</option>
                    <option value="1" @selected(old('status', $property->status) == 1)>Approved</option>
                    <option value="2" @selected(old('status', $property->status) == 2)>Rejected</option>
                </select>
            </div>
        @endif

        <div class="col-md-8">
            <label class="form-label">Property Title <span class="text-danger">*</span></label>
            <input name="property_title" class="form-control" maxlength="255" required value="{{ old('property_title', $property->property_title) }}">
        </div>
        <div class="col-md-4">
            <label class="form-label">Area <span class="text-danger">*</span></label>
            <input name="property_area" class="form-control" maxlength="100" required value="{{ old('property_area', $property->property_area) }}" placeholder="e.g. 1200 sq. ft.">
        </div>
        <div class="col-12">
            <label class="form-label">Property Details</label>
            <textarea name="property_details" class="form-control" rows="5" maxlength="5000">{{ old('property_details', $property->property_details) }}</textarea>
        </div>

        <div class="col-12"><hr><h5>Property Features</h5></div>
        <div class="col-12" id="property-features">
            <div class="row g-3">
                @forelse($features as $feature)
                    @php($currentValue = old('features.'.$feature->field_name, $featureValues->get($feature->field_name)))
                    <div class="col-md-4">
                        <label class="form-label">{{ $feature->label }} @if($feature->is_required)<span class="text-danger">*</span>@endif</label>
                        @if($feature->field_type === 'select')
                            <select name="features[{{ $feature->field_name }}]" class="form-select" @required($feature->is_required)>
                                <option value="">Select {{ $feature->label }}</option>
                                @foreach(json_decode($feature->options, true) ?? [] as $option)
                                    <option value="{{ $option }}" @selected($currentValue == $option)>{{ $option }}</option>
                                @endforeach
                            </select>
                        @elseif($feature->field_type === 'textarea')
                            <textarea name="features[{{ $feature->field_name }}]" class="form-control" rows="3" @required($feature->is_required)>{{ $currentValue }}</textarea>
                        @else
                            <input type="{{ $feature->field_type === 'number' ? 'number' : 'text' }}" name="features[{{ $feature->field_name }}]" class="form-control" value="{{ $currentValue }}" placeholder="{{ $feature->placeholder }}" @required($feature->is_required)>
                        @endif
                    </div>
                @empty
                    <p class="text-muted mb-0">No features configured for this property type.</p>
                @endforelse
            </div>
        </div>

        <div class="col-12"><hr><h5>Location and Price</h5></div>
        <div class="col-md-4">
            <label class="form-label">State <span class="text-danger">*</span></label>
            <select name="state_id" id="edit_state" class="form-select" required>
                @foreach($states as $state)<option value="{{ $state->id }}" @selected(old('state_id', $property->state_id) == $state->id)>{{ $state->name }}</option>@endforeach
            </select>
        </div>
        <div class="col-md-4">
            <label class="form-label">District <span class="text-danger">*</span></label>
            <select name="city_id" id="edit_district" class="form-select" required>
                @foreach($districts as $district)<option value="{{ $district->id }}" @selected(old('city_id', $property->city_id) == $district->id)>{{ $district->name }}</option>@endforeach
            </select>
        </div>
        <div class="col-md-4">
            <label class="form-label">Block <span class="text-danger">*</span></label>
            <select name="block_id" id="edit_block" class="form-select" required>
                @foreach($blocks as $block)<option value="{{ $block->id }}" @selected(old('block_id', $property->block_id) == $block->id)>{{ $block->name }}</option>@endforeach
            </select>
        </div>
        <div class="col-md-5">
            <label class="form-label">Locality <span class="text-danger">*</span></label>
            <input name="locality" class="form-control" required value="{{ old('locality', $property->locality) }}">
        </div>
        <div class="col-md-3">
            <label class="form-label">Pincode <span class="text-danger">*</span></label>
            <input name="pincode" class="form-control" inputmode="numeric" pattern="[0-9]{6}" maxlength="6" required value="{{ old('pincode', $property->pincode) }}">
        </div>
        <div class="col-md-4">
            <label class="form-label">Price Range <span class="text-danger">*</span></label>
            <select name="price" class="form-select" required>
                @foreach($prices as $price)<option value="{{ $price->id }}" @selected(old('price', $property->price) == $price->id)>{{ $price->price_range }}</option>@endforeach
            </select>
        </div>

        <div class="col-12"><hr><h5>Property Images</h5></div>
        @foreach($property->images as $image)
            <div class="col-6 col-md-3">
                <div class="card h-100">
                    <img src="{{ static_asset('uploads/property/'.$image->image) }}" class="card-img-top" style="height:140px;object-fit:cover" alt="Property image">
                    <label class="card-body py-2 text-danger"><input type="checkbox" name="delete_images[]" value="{{ $image->id }}" class="form-check-input me-1"> Remove</label>
                </div>
            </div>
        @endforeach
        <div class="col-12">
            <label class="form-label">Add Images <small class="text-muted">(JPG, PNG or WebP; up to 5MB each)</small></label>
            <input type="file" name="images[]" class="form-control" accept="image/jpeg,image/png,image/webp" multiple>
        </div>

        <div class="col-12"><hr><h5>Property Videos</h5></div>
        @foreach($property->videos as $video)
            <div class="col-12 col-md-6">
                <div class="card h-100">
                    <video class="w-100" style="height:180px;object-fit:cover" controls preload="metadata">
                        <source src="{{ static_asset('uploads/property/videos/'.$video->video) }}">
                    </video>
                    <label class="card-body py-2 text-danger"><input type="checkbox" name="delete_videos[]" value="{{ $video->id }}" class="form-check-input me-1"> Remove</label>
                </div>
            </div>
        @endforeach
        <div class="col-12">
            <label class="form-label">Add Videos <small class="text-muted">(MP4, MOV, AVI, WMV or WebM; maximum 2 videos, 100MB each)</small></label>
            <input type="file" name="videos[]" class="form-control" accept="video/mp4,video/quicktime,video/x-msvideo,video/x-ms-wmv,video/webm" multiple>
        </div>

        <div class="col-12 d-flex gap-2 mt-4">
            <button class="btn btn-primary" type="submit">Update Property</button>
            <a href="{{ $cancelRoute }}" class="btn btn-outline-secondary">Cancel</a>
        </div>
    </div>
</form>

@section('script')
<script>
$(function () {
    $('#property_type_id').on('change', function () {
        $.post("{{ route('get.property.features') }}", {_token: '{{ csrf_token() }}', property_type: this.value})
            .done(function (response) { $('#property-features').html(response.html); });
    });
    $('#edit_state').on('change', function () {
        $.get('{{ url('get-district-by-state') }}/' + this.value, function (items) {
            $('#edit_district').html('<option value="">Select District</option>');
            $('#edit_block').html('<option value="">Select Block</option>');
            $.each(items, function (_, item) { $('#edit_district').append(new Option(item.name, item.id)); });
        });
    });
    $('#edit_district').on('change', function () {
        $.get('{{ url('get-blocks-by-district') }}/' + this.value, function (items) {
            $('#edit_block').html('<option value="">Select Block</option>');
            $.each(items, function (_, item) { $('#edit_block').append(new Option(item.name, item.id)); });
        });
    });
});
</script>
@endsection
