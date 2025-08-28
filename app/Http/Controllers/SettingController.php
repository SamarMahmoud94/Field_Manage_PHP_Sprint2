<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Setting;
use Illuminate\Support\Facades\Auth;

class SettingController extends Controller
{
    // View settings (accessible to everyone, no auth required)
    public function view()
    {
        $setting = Setting::first(); // only one row
        return response()->json($setting);
    }

    // Create settings (admin only)
    public function create(Request $request)
    {
        $user = Auth::guard('api')->user();

        if (!$user || $user->role !== 'admin') {
            return response()->json(['error' => 'Unauthorized - Admins only'], 403);
        }

        // Check if a settings row already exists
        if (Setting::exists()) {
            return response()->json(['error' => 'Settings already exist. Use update instead.'], 400);
        }

        $setting = Setting::create($request->only([
            'name',
            'logo_url',
            'about_image_url',
            'about_description',
            'terms_and_conditions',
            'facebook_url',
            'whatsapp_number',
            'phone_number',
            'second_phone_number'
        ]));

        return response()->json(['message' => 'Settings created successfully', 'data' => $setting], 201);
    }

    // Update settings (admin only)
    public function update(Request $request)
    {
        $user = Auth::guard('api')->user();

        if (!$user || $user->role !== 'admin') {
            return response()->json(['error' => 'Unauthorized - Admins only'], 403);
        }

        $setting = Setting::first();

        if (!$setting) {
            return response()->json(['error' => 'Settings do not exist. Use create first.'], 404);
        }

        $setting->update($request->only([
            'name',
            'logo_url',
            'about_image_url',
            'about_description',
            'terms_and_conditions',
            'facebook_url',
            'whatsapp_number',
            'phone_number',
            'second_phone_number'
        ]));

        return response()->json(['message' => 'Settings updated successfully', 'data' => $setting], 200);
    }
}
