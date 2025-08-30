<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\FieldSlot;
use Illuminate\Support\Facades\Auth;

class FieldSlotController extends Controller
{
    // Create field slot by admin 
    public function createSlot(Request $request)
    {
        $user = Auth::guard('api')->user();
        if ($user->role !== 'admin') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $slot = FieldSlot::create($request->only([
            'field_id',
            'week_day_id',
            'from_time',
            'to_time',
            'price_per_hour'
        ]));

        return response()->json($slot, 201);
    }

    // View all slots by admin
    public function viewAllSlots()
    {
        $user = Auth::guard('api')->user();
        if ($user->role !== 'admin') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $slots = FieldSlot::with(['field', 'weekDay'])->get();
        return response()->json($slots);
    }

    // View specific slot by admin
    public function viewSlot($id)
    {
        $user = Auth::guard('api')->user();
        if ($user->role !== 'admin') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $slot = FieldSlot::with(['field', 'weekDay'])->find($id);
        if (!$slot) {
            return response()->json(['message' => 'Slot not found'], 404);
        }

        return response()->json($slot);
    }

    // Update slot by admin
    public function updateSlot(Request $request, $id)
    {
        $user = Auth::guard('api')->user();
        if ($user->role !== 'admin') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $slot = FieldSlot::find($id);
        if (!$slot) {
            return response()->json(['message' => 'Slot not found'], 404);
        }

        $slot->update($request->only([
            'field_id',
            'week_day_id',
            'from_time',
            'to_time',
            'price_per_hour'
        ]));

        return response()->json($slot);
    }

    // Delete slot by admin
    public function deleteSlot($id)
    {
        $user = Auth::guard('api')->user();
        if ($user->role !== 'admin') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $slot = FieldSlot::find($id);
        if (!$slot) {
            return response()->json(['message' => 'Slot not found'], 404);
        }

        $slot->delete();
        return response()->json(['message' => 'Slot deleted successfully']);
    }
}
