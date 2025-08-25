<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Team extends Model
{
    protected $table = 'team';

    protected $fillable = ['name'];

    public function players()
    {
        return $this->belongsToMany(User::class, 'TeamPlayers')
            ->withPivot('is_leader');
    }

    public function bookings()
    {
        return $this->hasMany(Booking::class);
    }
}
