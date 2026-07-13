@extends('frontend.layouts.master')
@section('title') Post Property Confirmation @endsection

@section('meta_tags')
@endsection

@section('content')

 
    <style>
        /* Custom styles to match exact colors */
        .bg-mb-red { background-color: #d8232a; }
        .text-mb-red { color: #d8232a; }
        .border-mb-red { border-color: #d8232a; }
    </style>


   
    <main class="max-w-6xl mx-auto my-6 p-4 md:p-8 flex flex-col lg:flex-row gap-8">
        
<section class="property-submit-success-wrap">
    <div class="property-submit-success-card">

        <div class="property-submit-success-head">
            <div class="property-submit-success-head">
              <input type="checkbox" checked>
              <h3>Property Submitted Successfully!</h3>
               </div>
           
        </div>

        <p>
            Thank you for listing your property. Our team is currently reviewing
            the details. After approval from the admin, your property will go
            live on the website. We will notify you once the approval process
            is completed.
        </p>

    </div>
</section>

        <aside class="w-full lg:w-1/3 space-y-4">
            <img src="{{ static_asset('assets/assets_web/img/post2.jpg') }}">
        </aside>

    </main>
	
	
	
	
@endsection
