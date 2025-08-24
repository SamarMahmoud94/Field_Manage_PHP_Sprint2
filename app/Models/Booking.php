<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    protected $table = 'Booking';

    protected $fillable = ['player_id', 'team_id', 'field_slot_id', 'date', 'status', 'price'];

    public function player()
    {
        return $this->belongsTo(User::class, 'player_id');
    }

    public function team()
    {
        return $this->belongsTo(Team::class);
    }

    public function fieldSlot()
    {
        return $this->belongsTo(FieldSlot::class);
    }

    public function statusChanges()
    {
        return $this->hasMany(BookingStatusChange::class);
    }

    public function review()
    {
        return $this->hasOne(Review::class);
    }
}
