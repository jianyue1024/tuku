<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Picture extends Model
{
    protected $fillable = [
        'title', 'size', 'width', 'height',
        'tuku_id', 'user_id', 'class_id', 'notes',
        'recommend', 'retime','recommend_at','created_at','updated_at'
    ];

    public function tuku()
    {
        return $this->belongsTo(Tuku::class,'tuku_id','id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class,'class_id','id');
    }
}
