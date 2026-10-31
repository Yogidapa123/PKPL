<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rents', function (Blueprint $table) {
            $table->id();
            $table->foreignId('room_id');
            $table->foreignId('user_id');
            $table->date('date_use');
            $table->time('time_start_use');
            $table->time('time_end_use');
            $table->text('purpose');
            $table->dateTime('transaction_start');
            $table->dateTime('transaction_end')->nullable();
            $table->string('status')->default('pending');
            $table->timestamps();
            $table->string('phone')->nullable()->after('activity');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('rents');
    }
};
