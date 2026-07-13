<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CustomerPost;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;

class CustomerPostController extends Controller
{
    public function index(Request $request)
    {
        $posts = CustomerPost::with('user')->when($request->search, fn($q,$v)=>$q->where('title','like','%'.$v.'%'))
            ->when($request->status, fn($q,$v)=>$q->where('status',$v))->latest()->paginate(20);
        return view('admin.customer_posts.index', compact('posts'));
    }
    public function show(CustomerPost $post) { $post->load('user'); return view('admin.customer_posts.show', compact('post')); }
    public function edit(CustomerPost $post) { $post->load('user'); return view('admin.customer_posts.edit', compact('post')); }
    public function update(Request $request, CustomerPost $post)
    {
        $data=$request->validate([
            'title'=>'required|max:180', 'slug'=>['nullable','max:190',Rule::unique('customer_posts','slug')->ignore($post->id)],
            'section'=>'required|max:100', 'keywords'=>'nullable|max:1000', 'abstract'=>'required', 'content'=>'nullable',
            'excerpt'=>'nullable|max:1000', 'doi'=>'nullable|max:150', 'volume'=>'nullable|max:50', 'issue'=>'nullable|max:50',
            'page_range'=>'nullable|max:50', 'published_date'=>'nullable|date', 'editor_comments'=>'nullable',
            'featured_image'=>'nullable|image|mimes:jpg,jpeg,png,webp|max:3072',
            'status'=>'required|in:draft,submitted,approved,rejected'
        ]);
        $data['slug'] = Str::slug($data['slug'] ?: $data['title']);
        if (CustomerPost::where('slug',$data['slug'])->whereKeyNot($post->id)->exists()) $data['slug'] .= '-'.$post->id;
        $allowed = '<p><br><b><strong><i><em><u><s><sup><sub><ul><ol><li><blockquote><h1><h2><h3><h4><h5><h6><a><table><thead><tbody><tr><th><td><hr>';
        $data['abstract'] = strip_tags($data['abstract'], $allowed);
        $data['content'] = strip_tags($data['content'] ?? '', $allowed);
        if ($request->hasFile('featured_image')) $data['featured_image'] = $request->file('featured_image')->store('customer-posts/covers','public');
        if ($data['status'] === 'approved') {
            $data['published_at'] = $post->published_at ?: now();
            $data['published_date'] = $data['published_date'] ?: now()->toDateString();
        } else $data['published_at'] = null;
        $post->update($data);
        return redirect()->route('admin.customer-posts.index')->with('alert-success','Post updated successfully.');
    }
}
