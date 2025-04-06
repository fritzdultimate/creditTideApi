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
        Schema::create('celebrity_investors', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('position');
            $table->string('address');
            $table->decimal('deposits')->default(0.00);
            $table->decimal('withdrawals')->default(0.00);
            $table->integer('investments', unsigned: true)->default(0);
            $table->integer('years')->default(4);
            $table->string('occupation');
            $table->integer('age')->default(35);
            $table->string('image')->nullable();
            $table->timestamp('dob')->nullable();
            $table->timestamp('joined_at')->nullable();
            $table->integer('priority')->default(0);
            $table->timestamp('started_at');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('celebrity_investors');
    }
};
