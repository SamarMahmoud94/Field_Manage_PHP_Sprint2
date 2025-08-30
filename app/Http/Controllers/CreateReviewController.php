<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\Review;
use App\Models\Booking;

class CreateReviewController extends Controller
{
    public function store(Request $request)
    {
        if(Auth::user()->role !== 'player'){
            return response()->json([
                'message' => 'Only players can create reviews'
            ],403);
        }


        $request->validate([
        'rating'  => 'required|integer',   
        'comment' =>'required|string'  ,
        'booking_id'=>'required|integer',
        ]);

        $booking = Booking::with('team.players')->find($request->booking_id);

        if (!$booking) 
            {
                return response()->json([
                    'message' => 'Booking not found'
                ], 404);
            }

        if (!$booking->team || !$booking->team->players->contains(Auth::id())) {
            return response()->json([
                'message' => 'You are not part of the team that made this booking'
            ], 403);
        }    
        // $user=Auth::user();

        // $isInTeam=$booking->team&&$booking->team()->players()->where('user_id',$user->id)->exists();
        // if (!$isInTeam) 
        //     {
        //         return response()->json([
        //             'message' => 'You are not a member of the team that booked this field'
        //         ], 403);
        //     }    
    
        $review = Review::create([
        'user_id'     => auth::id(),
        'booking_id'  => $request->booking_id,
        'rating'      => $request->rating,
        'comment'     => $request->comment,
        'is_hidden'   => false,
        ]);

        return response()->json([
            'message' => 'Review created successfully',
            'review'  => $review
        ], 201);
    }
}
