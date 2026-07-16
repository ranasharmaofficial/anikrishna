<?php

namespace App\Http\Controllers\Concerns;

use App\Models\Block;
use App\Models\District;
use App\Models\MasterPrice;
use App\Models\MasterProperty;
use App\Models\Property;
use App\Models\PropertyFeature;
use App\Models\PropertyFeatureValue;
use App\Models\PropertyImage;
use App\Models\PropertyVideo;
use App\Models\State;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

trait EditsProperties
{
    protected function propertyEditData(Property $property): array
    {
        $property->load(['images', 'videos', 'featureValues', 'user']);
         $customerDetails = customerDetails();
        return [
            'customerDetails' => $customerDetails,
            'property' => $property,
            'propertyTypes' => MasterProperty::where('status', 1)->orderBy('name')->get(),
            'states' => State::where('status', 1)->orderBy('name')->get(),
            'districts' => District::where('state_id', $property->state_id)->orderBy('name')->get(),
            'blocks' => Block::where('district_id', $property->city_id)->orderBy('name')->get(),
            'prices' => MasterPrice::where('status', 1)->get(),
            'features' => PropertyFeature::where('property_type', $property->property_type_id)
                ->where('status', 1)->get(),
            'featureValues' => $property->featureValues->pluck('feature_value', 'feature_key'),
        ];
    }

    protected function updatePropertyRecord(Request $request, Property $property, bool $isAdmin): void
    {
        $validated = $request->validate([
            'purpose' => ['required', Rule::in(['Sale', 'Rent', 'PG'])],
            'property_type_id' => 'required|exists:master_properties,id',
            'property_title' => 'required|string|max:255',
            'property_area' => 'required|string|max:100',
            'property_details' => 'nullable|string|max:5000',
            'state_id' => 'required|exists:states,id',
            'city_id' => 'required|exists:districts,id',
            'block_id' => 'required|exists:blocks,id',
            'locality' => 'required|string|max:255',
            'pincode' => 'required|digits:6',
            'price' => 'required|exists:master_prices,id',
            'features' => 'nullable|array',
            'images' => 'nullable|array|max:10',
            'images.*' => 'image|mimes:jpg,jpeg,png,webp|max:5120',
            'videos' => 'nullable|array|max:2',
            'videos.*' => 'file|mimetypes:video/mp4,video/quicktime,video/x-msvideo,video/x-ms-wmv,video/webm|max:102400',
            'delete_images' => 'nullable|array',
            'delete_images.*' => 'integer',
            'delete_videos' => 'nullable|array',
            'delete_videos.*' => 'integer',
            'status' => $isAdmin ? ['required', Rule::in([0, 1, 2])] : 'nullable',
        ]);

        $allowedFeatures = PropertyFeature::where('property_type', $validated['property_type_id'])
            ->where('status', 1)->get()->keyBy('field_name');

        foreach ($allowedFeatures as $feature) {
            if ($feature->is_required && blank(data_get($validated, 'features.'.$feature->field_name))) {
                throw \Illuminate\Validation\ValidationException::withMessages([
                    'features.'.$feature->field_name => $feature->label.' is required.',
                ]);
            }
        }

        $existingVideoCount = $property->videos()->count();
        $deleteVideoCount = PropertyVideo::where('property_id', $property->id)
            ->whereIn('id', $validated['delete_videos'] ?? [])->count();
        $newVideoCount = count($request->file('videos', []));
        if (($existingVideoCount - $deleteVideoCount + $newVideoCount) > 2) {
            throw \Illuminate\Validation\ValidationException::withMessages([
                'videos' => 'Maximum 2 property videos are allowed.',
            ]);
        }

        DB::transaction(function () use ($request, $validated, $property, $isAdmin, $allowedFeatures) {
            $slug = Str::slug($validated['property_title']) ?: 'property';
            $baseSlug = $slug;
            $suffix = 1;
            while (Property::where('property_slug', $slug)->whereKeyNot($property->id)->exists()) {
                $slug = $baseSlug.'-'.$suffix++;
            }

            $property->update([
                'purpose' => $validated['purpose'],
                'property_type_id' => $validated['property_type_id'],
                'property_title' => $validated['property_title'],
                'property_slug' => $slug,
                'property_area' => $validated['property_area'],
                'property_details' => $validated['property_details'] ?? null,
                'state_id' => $validated['state_id'],
                'city_id' => $validated['city_id'],
                'block_id' => $validated['block_id'],
                'locality' => $validated['locality'],
                'pincode' => $validated['pincode'],
                'price' => $validated['price'],
                'status' => $isAdmin ? $validated['status'] : 0,
            ]);

            PropertyFeatureValue::where('property_id', $property->id)->delete();
            foreach (($validated['features'] ?? []) as $key => $value) {
                if ($allowedFeatures->has($key) && filled($value)) {
                    PropertyFeatureValue::create([
                        'property_id' => $property->id,
                        'feature_key' => $key,
                        'feature_value' => $value,
                    ]);
                }
            }

            $imagesToDelete = PropertyImage::where('property_id', $property->id)
                ->whereIn('id', $validated['delete_images'] ?? [])->get();
            foreach ($imagesToDelete as $image) {
                $path = public_path('uploads/all/'.$image->image);
                if (File::exists($path)) {
                    File::delete($path);
                }
                $image->delete();
            }

            $videosToDelete = PropertyVideo::where('property_id', $property->id)
                ->whereIn('id', $validated['delete_videos'] ?? [])->get();
            foreach ($videosToDelete as $video) {
                $path = public_path('uploads/all/'.$video->video);
                if (File::exists($path)) {
                    File::delete($path);
                }
                $video->delete();
            }

            foreach ($request->file('images', []) as $image) {
                $filename = now()->format('YmdHis').'_'.Str::random(12).'.'.$image->getClientOriginalExtension();
                $image->move(public_path('uploads/all'), $filename);
                PropertyImage::create(['property_id' => $property->id, 'image' => $filename]);
            }

            foreach ($request->file('videos', []) as $video) {
                File::ensureDirectoryExists(public_path('uploads/all'));
                $filename = now()->format('YmdHis').'_'.Str::random(12).'.'.$video->getClientOriginalExtension();
                $video->move(public_path('uploads/all'), $filename);
                PropertyVideo::create(['property_id' => $property->id, 'video' => $filename]);
            }
        });
    }
}
