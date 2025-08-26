<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FieldSlot extends Model
{
    protected $table = 'fieldslots';

    protected $fillable = ['field_id', 'week_day_id', 'from_time', 'to_time', 'price_per_hour'];

    public function field()
    {
        return $this->belongsTo(Field::class, 'field_id');
    }

    public function weekDay()
    {
        return $this->belongsTo(WeekDay::class, 'week_day_id');
    }

    public function bookings()
    {
        return $this->hasMany(Booking::class, 'field_slot_id');
    }
}
