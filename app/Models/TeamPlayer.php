<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TeamPlayer extends Model
{
    protected $table = 'teamplayers';

    protected $fillable = ['user_id', 'team_id', 'is_leader'];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function team()
    {
        return $this->belongsTo(Team::class, 'team_id');
    }
}
