<?php
namespace App\Http\Controllers\Api\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;



class PasswordResetController extends Controller
{
    // public function forgotPassword(Request $request)
    // {
    //     $request->validate(['email' => 'required|email']);

    //     $status = Password::sendResetLink(
    //         $request->only('email')
    //     );

    //     return $status === Password::RESET_LINK_SENT
    //         ? response()->json(['message' => 'Reset link sent to your email.'])
    //         : response()->json(['error' => 'Unable to send reset link.'], 500);
    // }



    public function forgotPassword(Request $request)
    {
        $request->validate(['email' => 'required|email']);

        $token = Str::random(60);

        // امسح أي record قديم
        DB::table('password_resets')->where('email', $request->email)->delete();

        // خزّن record جديد
        DB::table('password_resets')->insert([
            'email' => $request->email,
            'token' => Hash::make($token),
            'created_at' => now(),
        ]);

        return response()->json([
            'message' => 'Reset link generated successfully',
            'token'   => $token,
            'email'   => $request->email
        ]);
    }
    
public function resetPassword(Request $request)
{
    $request->validate([
        'email' => 'required|email',
        'token' => 'required',
        'password' => 'required|min:6|confirmed',
    ]);

    $reset = DB::table('password_resets')->where('email', $request->email)->first();

    if (!$reset || !Hash::check($request->token, $reset->token)) {
        return response()->json(['error' => 'Invalid token or email'], 400);
    }

    $user = \App\Models\User::where('email', $request->email)->first();
    $user->password = Hash::make($request->password);
    $user->save();

    DB::table('password_resets')->where('email', $request->email)->delete();

    return response()->json(['message' => 'Password reset successfully']);
}
}
