<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Pagination\Paginator;
// use Illuminate\Database\Eloquent\SoftDeletes;

class PropertyFeature extends Model
{
    use HasFactory;
    // use SoftDeletes;

    protected $fillable = ['property_type', 'label', 'field_name', 'field_type', 'placeholder', 'options', 'is_required', 'status'];

    protected static function boot()
    {
        parent::boot();
        Paginator::useBootstrap();
    }


}
