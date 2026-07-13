<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Pagination\Paginator;

class MasterPrice extends Model
{
    protected $fillable = [
        'price_range',
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
