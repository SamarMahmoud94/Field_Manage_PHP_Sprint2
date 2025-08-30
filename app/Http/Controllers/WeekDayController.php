<?php

namespace App\Http\Controllers;

use App\Models\WeekDay;

class WeekDayController extends Controller
{
    // 🔹 Get all weekdays (accessible to everyone)
    public function displayWeekDay()
    {
        $days = WeekDay::all();
        return response()->json($days);
    }
}
