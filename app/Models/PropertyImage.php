<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Pagination\Paginator;
// use Illuminate\Database\Eloquent\SoftDeletes;

class PropertyImage extends Model
{
    use HasFactory;
    // use SoftDeletes;

    protected $fillable = ['property_id', 'image'];

    protected static function boot()
    {
        parent::boot();
        Paginator::useBootstrap();
    }


}
