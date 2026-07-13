<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Pagination\Paginator;
// use Illuminate\Database\Eloquent\SoftDeletes;

class PropertyFeatureValue extends Model
{
    use HasFactory;
    // use SoftDeletes;

    protected $fillable = ['property_id', 'feature_key', 'feature_value'];

    public function feature()
    {
        return $this->belongsTo(
            PropertyFeature::class,
            'property_feature_id',
            'id'
        );
    }

    protected static function boot()
    {
        parent::boot();
        Paginator::useBootstrap();
    }


}
