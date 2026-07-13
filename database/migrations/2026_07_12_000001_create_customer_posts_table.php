<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('customer_posts', function (Blueprint $table) {
            $table->id(); $table->unsignedBigInteger('user_id');
            $table->string('title'); $table->string('section');
            $table->text('keywords')->nullable(); $table->longText('abstract')->nullable();
            $table->json('files')->nullable(); $table->json('contributors')->nullable();
            $table->longText('editor_comments')->nullable();
            $table->enum('status', ['draft','submitted','approved','rejected'])->default('draft');
            $table->timestamp('submitted_at')->nullable(); $table->timestamps();
            $table->index(['user_id','status']);
        });
    }
    public function down(): void { Schema::dropIfExists('customer_posts'); }
};
