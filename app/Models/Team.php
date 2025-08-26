<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Team extends Model
{
    protected $table = 'team';

    protected $fillable = ['name'];

    public $timestamps = false;

    public function players()
    {
        return $this->belongsToMany(User::class, 'TeamPlayers', 'team_id', 'user_id')
            ->withPivot('is_leader');
    }

    public function bookings()
    {
        return $this->hasMany(Booking::class, 'team_id');
    }
}
