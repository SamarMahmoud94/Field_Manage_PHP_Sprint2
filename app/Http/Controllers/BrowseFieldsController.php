<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Field;

class BrowseFieldsController extends Controller
{
    public function browse(Request $request){
        $query = Field::with(['slots.weekDay']);

        if($request->has('week_day_name')){
            $dayname=$request->week_day_name;

            $query->whereHas('slots.weekDay' , function ($q) use ($dayname){
                $q->where('name', $dayname);
            }); 
        }

        if($request->has('from_time') && $request->has('to_time')){
            $from= $request->from_time;
            $to= $request->to_time;

            $query->whereHas('slots' , function ($q) use ($from,$to){
                $q->where('from_time', '<=' , $from)
                  ->where('to_time','>=',$to);
            }); 
        }
        $fields = $query->get();

        if($fields->isEmpty()){
            return response()->json([
                'message' => 'No slots available!'],200);
        }
        return response()->json($fields);
    }
}
