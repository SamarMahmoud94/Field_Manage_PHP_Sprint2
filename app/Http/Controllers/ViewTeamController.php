<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Team;
use Illuminate\Support\Facades\Auth;

class ViewTeamController extends Controller
{
    // view all teams
    public function viewAllTeams()
    {
        $teams = Team::with(['players', 'bookings'])->get();

        return response()->json([
            'message' => 'Teams retrieved successfully',
            'teams' => $teams
        ], 200);
    }

    // view specific team using the team id
    public function viewTeam($id)
    {
        $team = Team::with(['players', 'bookings'])->find($id);

        if (!$team) {
            return response()->json([
                'message' => 'Team not found'
            ], 404);
        }

        return response()->json([
            'message' => 'Team retrieved successfully',
            'team' => $team
        ], 200);
    }
}
