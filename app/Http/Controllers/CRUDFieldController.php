<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Field;
use App\Models\FieldSlot;
use Illuminate\Support\Facades\Auth;

class CRUDFieldController extends Controller
{
    // Create Field
    public function createField(Request $request)
    {
        $user = Auth::guard('api')->user();
        if ($user->role !== 'admin') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $field = Field::create($request->only(['name', 'images', 'players_capacity']));
        return response()->json($field, 201);
    }

    // Everyone - List Fields with optional filters
    // public function index(Request $request)
    // {
    //     $user = Auth::guard('api')->user();
    //     if ($user->role !== 'admin') {
    //         return response()->json(['message' => 'Unauthorized'], 403);
    //     }

    //     $query = Field::with('slots');

    //     // Filter: players_capacity >=
    //     if ($request->has('players_capacity')) {
    //         $query->where('players_capacity', '>=', $request->players_capacity);
    //     }

    //     // Filter: available time (from_time, to_time)
    //     if ($request->has(['day_id', 'from_time', 'to_time'])) {
    //         $query->whereHas('slots', function ($q) use ($request) {
    //             $q->where('week_day_id', $request->day_id)
    //                 ->where('from_time', '<=', $request->from_time)
    //                 ->where('to_time', '>=', $request->to_time);
    //         });
    //     }

    //     $fields = $query->get();
    //     return response()->json($fields);
    // }

    // View all fields details with slots
    public function viewAllField()
    {
        $user = Auth::guard('api')->user();
        if ($user->role !== 'admin') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $field = Field::with('slots')->get();
        if (!$field) {
            return response()->json(['message' => 'Field not found'], 404);
        }
        return response()->json($field);
    }

    // View specific field details with slots
    public function viewField($id)
    {
        $user = Auth::guard('api')->user();
        if ($user->role !== 'admin') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $field = Field::with('slots')->find($id);
        if (!$field) {
            return response()->json(['message' => 'Field not found'], 404);
        }
        return response()->json($field);
    }

    // Update Field
    public function updateField(Request $request, $id)
    {
        $user = Auth::guard('api')->user();
        if ($user->role !== 'admin') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $field = Field::find($id);
        if (!$field) {
            return response()->json(['message' => 'Field not found'], 404);
        }

        $field->update($request->only(['name', 'images', 'players_capacity']));
        return response()->json($field);
    }

    // Admin - Delete Field
    public function deleteField($id)
    {
        $user = Auth::guard('api')->user();
        if ($user->role !== 'admin') {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        $field = Field::find($id);
        if (!$field) {
            return response()->json(['message' => 'Field not found'], 404);
        }

        $field->delete();
        return response()->json(['message' => 'Field deleted successfully']);
    }
}
