<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tuku extends Model
{
    protected $fillable = [
        'photos', 'notes', 'class_id', 'editer'
    ];

    public function pictures()
    {
        return $this->hasMany(Picture::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class,'user_id','id');
    }

    //多图上传
    public function getPhotosAttribute($value)
    {
        return explode(',', $value);

    }

    public function setPhotosAttribute($value)
    {
        $this->attributes['photos'] = implode(',', $value);
    }
}
