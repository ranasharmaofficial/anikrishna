<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Pagination\Paginator;

class PropertyEnquiry extends Model
{
    protected $fillable = [
        'property_id',
        'name',
        'mobile',
        'email',
        'message',
        'status',
        'created_at',
        'updated_at',
    ];

    /**
    * Boot the model.
    */
    protected static function boot(){
        parent::boot();
        Paginator::useBootstrap();
    }

}
