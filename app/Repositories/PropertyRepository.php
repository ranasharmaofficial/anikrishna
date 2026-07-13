<?php
namespace App\Repositories;
use App\Repositories\Interfaces\PropertyRepositoryInterface;
use App\Models\MasterProperty;
use App\Models\PropertyFeature;
use App\Models\State;
use App\Models\City;
use App\Models\Property;
use App\Models\PropertyFeatureValue;
use App\Models\PropertyImage;
use App\Models\PropertyVideo;
use App\Models\MasterPrice;

class PropertyRepository implements PropertyRepositoryInterface
{
    public function allCountries(){
        return Country::select('id', 'country_name', 'country_code')->where('id', 101)->get();
    }

    public function allPropertTypes(){
        return MasterProperty::select('*')->get();
    }

    public function viewPropertyDetails($id){
        return $property = Property::with([
                            'images',
                            'videos',
                            'featureValues.feature',
                            'user'
                        ])->findOrFail($id);;
    }

    public function deletePropertyDetails($id){
        $delete_property = Property::find($id);
        $section_ids = PropertyImage::where('property_id', $id)->pluck('id');
        if(sizeof($section_ids)>0){
            $delete_section = PropertyImage::whereIn('id', $section_ids)->delete();
        }
        $video_ids = PropertyVideo::where('property_id', $id)->pluck('id');
        if(sizeof($video_ids)>0){
            $delete_videos = PropertyVideo::whereIn('id', $video_ids)->delete();
        }
        $section_data_ids = PropertyFeatureValue::where('property_id', $id)->pluck('id');
        if(sizeof($section_data_ids)>0){
            $delete_section_data = PropertyFeatureValue::whereIn('id', $section_data_ids)->delete();
        }
        $delete_property->delete();
    }

    public function getPrices(){
        return MasterPrice::select('*')->get();
    }

}
