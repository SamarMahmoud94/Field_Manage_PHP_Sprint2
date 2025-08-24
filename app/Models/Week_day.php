<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WeekDay extends Model
{
    protected $table = 'Week_day';

    public $timestamps = false;

    protected $fillable = ['name'];

    public function slots()
    {
        return $this->hasMany(FieldSlot::class, 'week_day_id');
    }
}
