<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Booking;
use App\Models\FieldSlot;
use App\Models\User;
use App\Models\Team;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class BookingFieldController extends Controller
{
    public function store(Request $request)
    {
        $user = Auth::user();
        
        if ($user->role !== 'player') {
        return response()->json(['message' => 'Only players can book fields'], 403);
    }
    $team = $user->teams()->wherePivot('is_leader', true)->first();

    if (!$team) {
        return response()->json(['message' => 'Only team leaders can book fields'], 403);
    }
    
    
    $request->validate([
        'week_day'  => 'required|string',   
        'time_from' => 'required|date_format:H:i:s',
        'time_to'   => 'required|date_format:H:i:s|after:time_from',
        'field_id'  => 'required|integer',
        'team_name' =>'required|string'  ,
    ]);

    if ($request->team_name !== $team->name) {
    return response()->json(['message' => 'You can only book for your own team'], 403);
    }


    $fieldSlot = FieldSlot::find($request->field_id);
        if (!$fieldSlot) {
            return response()->json(['message' => 'Field slot not found'], 404);
        }

        if (!($request->time_from >= $fieldSlot->from_time && $request->time_to <= $fieldSlot->to_time)) {
            return response()->json(['message' => 'Selected time is outside the available slot'], 422);
        }


    $startDateTime = Carbon::parse($request->time_from);
    $endDateTime   = Carbon::parse($request->time_to);

    $hours = $startDateTime->diffInHours($endDateTime);

    if ($hours <= 0) {
            return response()->json([
                'message' => 'Invalid booking duration'
            ], 422);
        }

    $totalPrice = $hours * $fieldSlot->price_per_hour;

    $booking = Booking::create([
        'player_id'     => auth::id(),
        'team_id'       => $team->id,
        'field_slot_id' => $fieldSlot->id,
        'week_day'      => $request->week_day,
        'start_time'    => $request->time_from,
        'end_time'      => $request->time_to,
        'price'         => $totalPrice,
        'status'        => 'pending',
    ]);

    return response()->json([
        'message' => 'Booking created successfully',
        'booking' => $booking
    ],201);

    }
}
