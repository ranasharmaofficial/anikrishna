@extends('frontend.layouts.master')
@section('title') Current Issue @endsection
@section('content')

<section class="common-banner">
    <div class="container">
        <div class="row">
            <div class="common-banner__content text-center">
                <h2 class="title-animation">Editorial Board</h2>
            </div>
        </div>
    </div>
    <div class="banner-bg">
        <img src="{{ static_asset('assets/assets_web/images/volunteer-bg.png') }}" alt="Image">
    </div>
</section>
<style>
    body
    {
        text-transform: math-auto !important;
    }
</style>
<section class="faculty-section">
  <div class="faculty-container">


    <div class="faculty-grid">

      <!-- 1 -->
      <div class="faculty-card">
        <div class="faculty-image">
          <img src="{{ static_asset('assets/assets_web/images/ravi.jpg') }}" alt="Prof Ravi Kant">
        </div>
        <div class="faculty-content">
          <h3>Prof. Ravi Kant</h3>
          <span class="faculty-designation">Head of Department & Dean</span>
          <p>Department of Teacher Education,<br>
          Central University South Bihar,<br>
          Gaya, Bihar, India - 824236</p>
          <p><strong>Email:</strong> ravikantdr@cusb.ac.in</p>
          <a href="https://cusb.irins.org/profile/60477" class="faculty-btn">Profile Link</a>
        </div>
      </div>

      <!-- 2 -->
      <div class="faculty-card">
        <div class="faculty-image">
          <img src="{{ static_asset('assets/assets_web/images/sapna.jpg') }}" alt="Prof Sapna Sugandha">
        </div>
        <div class="faculty-content">
          <h3>Prof. Sapna Sugandha</h3>
          <span class="faculty-designation">Professor</span>
          <p>Department of Management Science,<br>
          Mahatma Gandhi Central University,<br>
          Motihari, Bihar, India</p>
          <p><strong>Email:</strong> sapnasugandha@mgcub.ac.in</p>
          <a href="#" class="faculty-btn">Profile Link</a>
        </div>
      </div>

      <!-- 3 -->
      <div class="faculty-card">
        <div class="faculty-image">
          <img src="{{ static_asset('assets/assets_web/images/nagendra.jpg') }}" alt="Prof Nagendra Kumar">
        </div>
        <div class="faculty-content">
          <h3>Prof. Nagendra Kumar</h3>
          <span class="faculty-designation">Professor</span>
          <p>Faculty of Education,<br>
          Banaras Hindu University,<br>
          Varanasi, Uttar Pradesh, India</p>
          <p><strong>Email:</strong> nagendral@bhu.ac.in</p>
          <a href="#" class="faculty-btn">Profile Link</a>
        </div>
      </div>

      <!-- 4 -->
      <div class="faculty-card">
        <div class="faculty-image">
          <img src="{{ static_asset('assets/assets_web/images/raj.jpg') }}" alt="Prof Bed Raj Acharya">
        </div>
        <div class="faculty-content">
          <h3>Prof. Bed Raj Acharya</h3>
          <span class="faculty-designation">Professor of Mathematics Education</span>
          <p>Central Department of Education,<br>
          Tribhuvan University, Nepal</p>
          <p><strong>Email:</strong> bedraj@tuced.edu.np</p>
          <a href="#" class="faculty-btn">Profile Link</a>
        </div>
      </div>

      <!-- 5 -->
      <div class="faculty-card">
        <div class="faculty-image">
          <img src="{{ static_asset('assets/assets_web/images/chanda.jpg') }}" alt="Dr Shahabal Chanda">
        </div>
        <div class="faculty-content">
          <h3>Dr. Shahabal Chanda</h3>
          <span class="faculty-designation">Associate Professor</span>
          <p>Department of Physical Education & Sports Science,<br>
          Jashore University of Science and Technology,<br>
          Bangladesh</p>
          <p><strong>Email:</strong> shaybalchanda@yahoo.com</p>
          <a href="#" class="faculty-btn">Profile Link</a>
        </div>
      </div>

      <!-- 6 -->
      <div class="faculty-card">
        <div class="faculty-image">
          <img src="{{ static_asset('assets/assets_web/images/nasim.jpg') }}" alt="Prof Dr Md Nasim Raja">
        </div>
        <div class="faculty-content">
          <h3>Prof. (Dr.) Md. Nasim Raja</h3>
          <span class="faculty-designation">Professor & Chairman (HOD)</span>
          <p>Dept. of Physical Education and Sports Science,<br>
          Jashore University of Science and Technology,<br>
          Bangladesh</p>
          <p><strong>Email:</strong> nasim.pess@just.edu.bd</p>
          <a href="#" class="faculty-btn">Profile Link</a>
        </div>
      </div>

      <!-- 7 -->
      <div class="faculty-card">
        <div class="faculty-image">
          <img src="{{ static_asset('assets/assets_web/images/rashmi.jpg') }}" alt="Dr Rashmi Srivastava">
        </div>
        <div class="faculty-content">
          <h3>Dr. Rashmi Srivastava</h3>
          <span class="faculty-designation">Assistant Professor</span>
          <p>Department of Educational Studies,<br>
          Mahatma Gandhi Central University,<br>
          Motihari, Bihar, India - 845402</p>
          <p><strong>Email:</strong> rashmisrivastava@mgcub.ac.in</p>
          <a href="#" class="faculty-btn">Profile Link</a>
        </div>
      </div>
      
       
           
    </div>
  </div>
</section>


@endsection
