<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Field;
use Illuminate\Support\Facades\Auth;

class ViewFieldDetailsController extends Controller
{
    public function view(Request $request){
        if(Auth::user()->role != 'player'){
            return response()->json([
                'message'=>'Only players can view field details!'],403
            );
        }

        $request->validate([
            'name' => 'required|string',
        ]);

        $field=Field::with(['slots.weekDay'])
            ->where('name',$request->name)
            ->first();
        
        if(!$field){
            return response()->json([
                'message'=>'Field not found!'
            ],200);
        }
        return response()->json([
            'message' => 'Field details retrieved successfully',
            'filed' => $field
        ],200);
    }
}
