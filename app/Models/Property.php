<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Pagination\Paginator;

class Property extends Model
{
    use HasFactory;
    // use SoftDeletes;

    protected $fillable = ['user_id','user_type','purpose','property_type_id', 'property_title', 'property_slug', 'property_area', 'property_details', 'state_id','city_id','block_id','locality', 'price', 'pincode','status'];

    public function images()
    {
        return $this->hasMany(PropertyImage::class);
    }

    public function videos()
    {
        return $this->hasMany(PropertyVideo::class);
    }

    public function featureValues()
    {
        return $this->hasMany(PropertyFeatureValue::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    protected static function boot()
    {
        parent::boot();
        Paginator::useBootstrap();
    }


}
