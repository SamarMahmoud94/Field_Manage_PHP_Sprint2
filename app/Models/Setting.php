<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    protected $table = 'setting';

    protected $fillable = [
        'name',
        'logo_url',
        'about_image_url',
        'about_description',
        'terms_and_conditions',
        'facebook_url',
        'whatsapp_number',
        'phone_number',
        'second_phone_number'
    ];

    public $timestamps = false; // to unable created_at and updated_at in laravel

}
