

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.slim.js" integrity="sha256-7GO+jepT9gJe9LB4XFf8snVOjX3iYNb0FHYr5LI1N5c=" crossorigin="anonymous"></script>
<script>
// email subscribe
$(".SubscribeBtn").click(function(e){
    e.preventDefault();
    // var data = $(this).serialize();
    var email =  $('#email_subscribe').val();

    if(email!==''){
        var url = '{{ route('store.subscriber') }}';
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            url:url,
            method:'POST',
            data:{
                email:email,
            },
            success:function(response){
                toastr.success("You have subscribed successfully!");
                // toastr.success(response.msg);
               $('#email_subscribe').val('');

            },
            error:function(error){
                console.log(error)
            }
        });
    }else{
        toastr.danger("Email is Required!");
    }
});
// email subscribe
</script>
  <script src="https://code.jquery.com/jquery-3.6.1.js" ></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Toastr JS File -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
<script>
//   AOS.init();
  $(document).ready(function() {
      toastr.options.timeOut = 5000;
      @if (Session::has('alert-danger'))
          toastr.error('{{ Session::get('alert-danger') }}');
      @elseif(Session::has('alert-success'))
          toastr.success('{{ Session::get('alert-success') }}');
      @elseif(Session::has('alert-warning'))
          toastr.success('{{ Session::get('alert-warning') }}');
      @endif
  });
</script>


{{-- /// new  --}}
<!-- jquery -->
<script src="{{ static_asset('assets/assets_web/js/jquery-3.7.1.min.js') }}"></script>
<!-- bootstrap five js -->
<script src="{{ static_asset('assets/assets_web/js/bootstrap.bundle.min.js') }}"></script>
<!-- nice select js -->
<script src="{{ static_asset('assets/assets_web/js/jquery.nice-select.min.js') }}"></script>
<!-- magnific popup js -->
<script src="{{ static_asset('assets/assets_web/js/jquery.magnific-popup.min.js') }}"></script>
<!-- swiper slider js -->
<script src="{{ static_asset('assets/assets_web/js/swiper-bundle.min.js') }}"></script>
<!-- viewport js -->
<script src="{{ static_asset('assets/assets_web/js/viewport.jquery.js') }}"></script>
<!-- odometer js -->
<script src="{{ static_asset('assets/assets_web/js/odometer.min.js') }}"></script>
<!-- vanilla tilt js -->
<script src="{{ static_asset('assets/assets_web/js/vanilla-tilt.min.js') }}"></script>
<!-- aos js -->
<script src="{{ static_asset('assets/assets_web/js/aos.js') }}"></script>

<!-- splittext js -->
<script src="{{ static_asset('assets/assets_web/js/SplitText.min.js') }}"></script>
<!-- scrollto js -->
<script src="{{ static_asset('assets/assets_web/js/ScrollToPlugin.min.js') }}"></script>
<!-- scrolltrigger js -->
<script src="{{ static_asset('assets/assets_web/js/ScrollTrigger.min.js') }}"></script>
<!-- gsap js -->
<script src="{{ static_asset('assets/assets_web/js/gsap.min.js') }}"></script>
<!-- ==== / js dependencies end ==== -->
<!-- template settings js -->
<script src="{{ static_asset('assets/assets_web/js/template-settings.js') }}"></script>
<!-- main js -->
<script src="{{ static_asset('assets/assets_web/js/custom.js') }}"></script>

<script>

function showTab(tabId){

    let forms=document.querySelectorAll('.auth_form_box');
    let buttons=document.querySelectorAll('.auth_tab_btn');

    forms.forEach(function(form){
        form.classList.remove('active');
    });

    buttons.forEach(function(btn){
        btn.classList.remove('active');
    });

    document.getElementById(tabId).classList.add('active');

    if(tabId=="loginForm"){
        buttons[0].classList.add('active');
    }

    if(tabId=="registerForm"){
        buttons[1].classList.add('active');
    }

    if(tabId=="forgotForm"){
        buttons[2].classList.add('active');
    }
}

</script>

@yield('script')



