<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FieldSlot extends Model
{
    protected $table = 'FieldSlots';

    protected $fillable = ['field_id', 'week_day_id', 'from_time', 'to_time', 'price_per_hour'];

    public function field()
    {
        return $this->belongsTo(Field::class);
    }

    public function weekDay()
    {
        return $this->belongsTo(WeekDay::class);
    }

    public function bookings()
    {
        return $this->hasMany(Booking::class);
    }
}
