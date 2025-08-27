<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Enquiry;
use Illuminate\Support\Facades\Auth;

class EnquiryController extends Controller
{
    public function submit(Request $request)
    {
        $user = Auth::guard('api')->user();

        if (! $user) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        // Only admins can submit enquiries
        if ($user->role !== 'admin') {
            return response()->json([
                'success' => false,
                'message' => 'Only admins can submit enquiries.'
            ], 403);
        }

        // Validate content
        $request->validate([
            'content' => 'required|string|min:5|max:5000',
        ]);

        // Create enquiry
        $enquiry = Enquiry::create([
            'user_id' => $user->id,
            'content' => $request->content,
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Enquiry submitted successfully.',
            'data' => $enquiry
        ], 201);
    }
}
