<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Enquiry;
use Illuminate\Support\Facades\Auth;

class ManagementEnquiryController extends Controller
{
    public function index(Request $request)
    {
        if(Auth::user()->role !== 'admin'){
            return response()->json([
                'message' => 'Only admin'
            ],403);
        }

        $query = Enquiry::query();

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
            'enquiry_id' => 'required|integer'
        ]);

        $review = Enquiry::findOrFail($request->enquiry_id);
        $review ->is_hidden = true;
        $review ->save();

        return response()->json([
            'message' => 'Enquiry hidden successfully'
        ],200);
    }
}