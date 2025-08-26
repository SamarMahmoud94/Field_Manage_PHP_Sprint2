<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
    use HasFactory, Notifiable;


    protected $table = 'user';
    public $timestamps = true;

    protected $fillable = [
        'name',
        'email',
        'phone',
        'password',
        'role'
    ];


    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'password' => 'hashed',
    ];

    //JWT

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }

    // Relations
    public function teams()
    {
        return $this->belongsToMany(Team::class, 'TeamPlayers', 'user_id', 'team_id')
            ->withPivot('is_leader');
    }

    public function bookings()
    {
        return $this->hasMany(Booking::class, 'player_id');
    }

    public function reviews()
    {
        return $this->hasMany(Review::class, 'user_id');
    }

    public function enquiries()
    {
        return $this->hasMany(Enquiry::class, 'user_id');
    }
}
