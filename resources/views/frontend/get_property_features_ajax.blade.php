@if($features->count())

    <h3 class="text-lg font-semibold mb-4">
        Property Features
    </h3>

    <div class="grid md:grid-cols-3 gap-4">

        @foreach($features as $feature)

            <div>

                <label class="block mb-1">
                    {{ $feature->label }}
                    @if($feature->is_required)
                        <span class="text-red-500">*</span>
                    @endif
                </label>

                @if($feature->field_type == 'select')

                    @php
                        $options = json_decode($feature->options, true) ?? [];
                    @endphp

                    <select
                        name="features[{{ $feature->field_name }}]"
                        class="w-full border p-2 rounded">

                        <option value="">
                            Select {{ $feature->label }}
                        </option>

                        @foreach($options as $option)
                            <option value="{{ $option }}">
                                {{ $option }}
                            </option>
                        @endforeach

                    </select>

                @elseif($feature->field_type == 'number')

                    <input
                        type="number"
                        name="features[{{ $feature->field_name }}]"
                        placeholder="{{ $feature->placeholder }}"
                        class="w-full border p-2 rounded">

                @elseif($feature->field_type == 'text')

                    <input
                        type="text"
                        name="features[{{ $feature->field_name }}]"
                        placeholder="{{ $feature->placeholder }}"
                        class="w-full border p-2 rounded">

                @elseif($feature->field_type == 'textarea')

                    <textarea
                        name="features[{{ $feature->field_name }}]"
                        placeholder="{{ $feature->placeholder }}"
                        class="w-full border p-2 rounded"
                        rows="3"></textarea>

                @endif

            </div>

        @endforeach

    </div>

@else

    <div class="alert alert-warning">
        No features found for this property type.
    </div>

@endif