<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up() {
        Schema::create('mahasiswa', function (Blueprint $table) {
            $table->string('npm')->primary();
            $table->string('nama_mahasiswa');
            $table->unsignedBigInteger('id_kelas');
            $table->unsignedBigInteger('kode_prodi');
            $table->timestamps();

            // Foreign key
            $table->foreign('id_kelas')->references('id_kelas')->on('kelas')->onDelete('cascade');
            $table->foreign('kode_prodi')->references('kode_prodi')->on('prodi')->onDelete('cascade');
        });
    }
    public function down() {
        Schema::dropIfExists('mahasiswa');
    }
};
