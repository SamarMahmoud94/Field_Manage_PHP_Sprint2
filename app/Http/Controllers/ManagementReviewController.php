<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Review;
use Illuminate\Support\Facades\Auth;

class ManagementReviewController extends Controller
{
    public function index(Request $request)
    {
        if(Auth::user()->role !== 'admin'){
            return response()->json([
                'message' => 'Only admin'
            ],403);
        }

        $query = Review::query();

        if($request->has('booking_id')){
            $query->where('booking_id',$request->booking_id);
        }
        if ($request->has('is_hidden')) {
            $query->where('is_hidden', $request->is_hidden);
        }
        return response()->json($query->get());
    }

    public function hide(Request $request)
    {
        if(Auth::user()->role !== 'admin'){
            return response()->json([
                'message' => 'Only admin'
            ],403);
        }

        $request->validate([
            'review_id' => 'required|integer'
        ]);

        $review = Review::findOrFail($request->review_id);
        $review ->is_hidden = true;
        $review ->save();

        return response()->json([
            'message' => 'Review hidden successfully'
        ],200);
    }

    public function destroy(Request $request)
    {
        if(Auth::user()->role !== 'admin'){
            return response()->json([
                'message' => 'Only admin'
            ],403);
        }
        
        $request->validate([
            'review_id' => 'required|integer'
        ]);

        $review = Review::findOrFail($request->review_id);
        $review ->delete();

        return response()->json(['message' => 'Review deleted successfully'],200);
    }
}
