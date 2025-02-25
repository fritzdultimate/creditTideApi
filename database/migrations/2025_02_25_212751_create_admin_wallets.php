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
        Schema::create('admin_wallets', function (Blueprint $table) {
            $table->id();
            $table->string('symbol')->unique();
            $table->string('name');
            $table->string('address')->unique();
            $table->string('coin');
            $table->string('path');
            $table->string('color')->nullable();
            $table->string('bg')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('admin_wallets');
    }
};
