<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReferralsTable extends Migration
{
    public function up()
    {
        Schema::create('referrals', function (Blueprint $table) {
            $table->id();
            // The new user who was referred.
            $table->unsignedBigInteger('user_id');
            // The referring user.
            $table->unsignedBigInteger('referrer_id');
            // Referral level: 1 = direct, 2, … up to 5.
            $table->unsignedTinyInteger('level');
            $table->timestamps();

            // Add foreign key constraints.
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('referrer_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('referrals');
    }
}
