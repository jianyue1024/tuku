<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Log extends Model
{
    protected $fillable = [
        'user_id', 'pic_id', 'class_id', 'sum',
        'ip', 'notes','created_at','updated_at'
    ];

    public function user()
    {
        return $this->belongsTo(User::class,'user_id','id');
    }

    public function category()
    {
        return $this->belongsTo(Category::class,'class_id','id');
    }
}
