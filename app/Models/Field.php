<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Field extends Model
{
    protected $table = 'field';
    public $timestamps = false; 
    protected $fillable = ['name', 'images', 'players_capacity'];

    public function slots()
    {
        return $this->hasMany(FieldSlot::class, 'field_id');
    }
}
