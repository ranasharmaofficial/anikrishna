@extends('frontend.layouts.master')
@section('title') Refereed Board @endsection
@section('content')

<section class="common-banner">
    <div class="container">
        <div class="row">
            <div class="common-banner__content text-center">
                <h2 class="title-animation">Refereed Board</h2>
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

     
      
       <!-- 8 -->
      <div class="faculty-card">
        <div class="faculty-image">
          <img src="{{ static_asset('assets/assets_web/images/asheesh.png') }}" alt="Prof Asheesh Srivastava">
        </div>
        <div class="faculty-content">
          <h3>Prof. Asheesh Srivastava</h3>
          <span class="faculty-designation">Professor, Higher Education Policy
&
Dean of Academic & Research</span>
          <p>University Centre for Teacher Education,<br>
                  Banaras Hindu University (IUCTE-BHU)<br>
                 (An Autonomous Institution of the UGC, Ministry of
            Education, Govt. of India)<br>
             Sundar Bagiya, Naria-B.L.W. Road,
            Varanasi, Uttar Pradesh-221005 (India)
           </p>
          <p><strong>Email (Official):</strong>profasheesh@iucte.ac.in</p>
          <p><strong>Email (Personal):</strong> mahatiasheesh@gmail.com</p> 
          <p><strong>Call / WhatsApp:</strong><a href="tel:+919933604836">+91 9933604836</a></p>
          <a href="https://www.iucte.ac.in/people/viewAcademicPeoples" class="faculty-btn">Profile Link</a>
        </div>
      </div>
      
       <!-- 9 -->
      <div class="faculty-card">
        <div class="faculty-image">
          <img src="{{ static_asset('assets/assets_web/images/omji.png') }}" alt="Prof Dr Omji Porwal">
        </div>
        <div class="faculty-content">
          <h3>Prof. Dr. Omji Porwal</h3>
          <span class="faculty-designation">Ph.D., M. Pharm, PGDPRA, B. Pharm, B.Sc. (Chemistry)
Professor (Full)</span>
          <p>Research director of Academics<br>
Head of THE Ranking<br>
Head of Publication Validation Committee<br>
Faculty of Pharmacy<br>
Qaiwan International University (Full-time)
</p>
          <p><strong>Email:</strong>omporwal@gmail.com</p>
          <p><strong>WhatsApp Only(India):</strong><a href="tel:+919601363576">+91 9601363576</a></p>
          <p><strong>Mob.(Sulaymaniyah, Kurdistan):</strong><a href="tel:+9647708563591">+964 7708563591</a></p>
          <a href="2 | Faculty of Pharmacy | QIU" class="faculty-btn">Profile Link</a>
        </div>
      </div>
      
       <!-- 10 -->
      <div class="faculty-card">
        <div class="faculty-image">
          <img src="{{ static_asset('assets/assets_web/images/gautam.png') }}" alt="Mr Gautam Srivastava">
        </div>
        <div class="faculty-content">
          <h3>Mr. Gautam Srivastava</h3>
          <span class="faculty-designation">Senior Research Scientist</span>
          <p>UT Health, San Antonio, USA</p>
          <p><strong>Scholar ID:</strong></p>
          <a href="Gautam Srivastava - Google Scholar
Gautam Srivastava (0000-0002-8703-8903) - ORCID" class="faculty-btn">Profile Link</a>
        </div>
      </div>
      
      <!-- 11 -->
      <div class="faculty-card">
        <div class="faculty-image">
          <img src="{{ static_asset('assets/assets_web/images/mani.png') }}" alt="Prof Gyandeo Mani Tripathi">
        </div>
        <div class="faculty-content">
          <h3>Prof.Gyandeo Mani Tripathi</h3>
          <span class="faculty-designation">Former Dean,Education,Aryabhatt
Knowledge University,Patna.</span>
          <p>H.No.32, “Hirdaykanti”,<br> Gokul Path
(Nala Paar), <br>North Patel Nagar,Patna 800024.</p>
          <p><strong>Email:</strong> gyandeo@gmail.com</p>
          <a href="AKU, Patna | TEQIP-3 Details-Of-College-Staff.pdf" class="faculty-btn">Profile Link</a>
        </div>
      </div>
           
           <!-- 12 -->
      <div class="faculty-card">
        <div class="faculty-image">
          <img src="{{ static_asset('assets/assets_web/images/niranjan.png') }}" alt="Dr Niranjan Prasad Yadav">
        </div>
        <div class="faculty-content">
          <h3>Dr. Niranjan Prasad Yadav</h3>
          <span class="faculty-designation">Registrar</span>
          <p>Aryabhatta Knowledge University,Patna</p>
          
          <a href="#" class="faculty-btn">Profile Link</a>
        </div>
      </div>
      
      <!-- 13 -->
      <div class="faculty-card">
        <div class="faculty-image">
          <img src="{{ static_asset('assets/assets_web/images/dum.png') }}" alt="Prof Ignatius Topno">
        </div>
        <div class="faculty-content">
          <h3>Prof.(Fr.) Ignatius Topno</h3>
          <span class="faculty-designation">Principal</span>
          <p>St. Xavier's College of Education (Autonomous), Patna</p>
          
          <a href="#" class="faculty-btn">Profile Link</a>
        </div>
      </div
           
    </div>
  </div>
</section>

@endsection
