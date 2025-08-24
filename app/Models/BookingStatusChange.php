<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BookingStatusChange extends Model
{
    protected $table = 'BookingStatusChange';

    protected $fillable = ['booking_id', 'status'];

    public function booking()
    {
        return $this->belongsTo(Booking::class);
    }
}
