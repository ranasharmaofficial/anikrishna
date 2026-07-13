<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::table('customer_posts', function (Blueprint $table) {
            $table->string('slug')->nullable()->unique()->after('title');
            $table->longText('content')->nullable()->after('abstract');
            $table->text('excerpt')->nullable()->after('content');
            $table->string('doi')->nullable()->after('excerpt');
            $table->string('volume')->nullable()->after('doi');
            $table->string('issue')->nullable()->after('volume');
            $table->string('page_range')->nullable()->after('issue');
            $table->string('featured_image')->nullable()->after('page_range');
            $table->date('published_date')->nullable()->after('featured_image');
            $table->unsignedBigInteger('abstract_views')->default(0)->after('published_date');
            $table->unsignedBigInteger('download_count')->default(0)->after('abstract_views');
            $table->timestamp('published_at')->nullable()->after('submitted_at');
        });
    }
    public function down(): void {
        Schema::table('customer_posts', function (Blueprint $table) {
            $table->dropUnique(['slug']);
            $table->dropColumn(['slug','content','excerpt','doi','volume','issue','page_range','featured_image','published_date','abstract_views','download_count','published_at']);
        });
    }
};
