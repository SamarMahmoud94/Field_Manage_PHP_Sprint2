<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('booking', function (Blueprint $table) {
            $table->dropColumn('date'); 
            $table->string('week_day'); 
            $table->time('start_time'); 
            $table->time('end_time');   
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('booking', function (Blueprint $table) {
            $table->string('date'); 
            $table->dropColumn(['week_day', 'start_time', 'end_time']);
        });
    }
};
