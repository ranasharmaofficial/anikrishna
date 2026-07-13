<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;

class CustomerPost extends Model
{
    protected $fillable = ['user_id','title','slug','section','keywords','abstract','content','excerpt','doi','volume','issue','page_range','featured_image','published_date','files','contributors','editor_comments','status','submitted_at','published_at','abstract_views','download_count'];
    protected $casts = ['files'=>'array','contributors'=>'array','submitted_at'=>'datetime','published_at'=>'datetime','published_date'=>'date'];
    public function user() { return $this->belongsTo(User::class); }
}
