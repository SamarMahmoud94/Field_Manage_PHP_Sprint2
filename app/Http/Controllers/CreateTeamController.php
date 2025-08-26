<?php

namespace App\Http\Controllers;

use App\Models\Team;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class CreateTeamController extends Controller
{
    public function store(Request $request)
    {
        if(Auth::user()->role !== 'player'){
            return response()->json([
                'message' => 'Only players can create teams'
            ],403);
        }

        $request->validate([
            'name' => 'required|string|max:255|unique:team,name',
        ]);
        $team = Team::create([
            'name' => $request->name,
        ]);
        $team->players()->attach(Auth::id(),['is_leader'=>1]);

        return response()->json([
            'message' => 'Team created successfully',
            'team' => $team->load('players'),
        ], 
        201);
    }
}
