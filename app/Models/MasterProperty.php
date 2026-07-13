<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Pagination\Paginator;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterProperty extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = ['name','created_by'];

    protected static function boot()
    {
        parent::boot();
        Paginator::useBootstrap();
    }


}
