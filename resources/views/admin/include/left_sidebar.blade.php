<style>
    .app-sidebar .main-sidebar-header {
        height: 4rem;
        width: 14.95rem;
        position: fixed;
        display: flex;
        background: #9c9393 !important;
        z-index: 9;
        align-items: center;
        justify-content: center;
        padding: 1rem 1.25rem;
        border-inline-end: 1px solid var(--menu-border-color);
        border-block-end: 1px solid var(--menu-border-color);
        transition: all 0.1s ease-out;
        -webkit-backdrop-filter: blur(30px);
        backdrop-filter: blur(30px);
    }

    .li-section-title {
        padding: 8px 20px;
        font-size: 12px;
        text-transform: uppercase;
        font-weight: 600;
        color: #c63e18;
        margin-top: 10px;
        margin-bottom: 5px;
        border-bottom: 1px solid #ba9d9d;
    }
</style>

<!-- Start::app-sidebar -->
<aside class="app-sidebar sticky" id="sidebar">

    <!-- Start::main-sidebar-header -->
    <div class="main-sidebar-header">
        <a href="{{ url('admin/dashboard') }}" class="header-logo">
            <img src="{{ static_asset('assets/assets_admin/images/brand-logos/admin_logo.png') }}" alt="logo"
                class="desktop-logo">
            <img src="{{ static_asset('assets/assets_admin/images/brand-logos/toggle-logo.png') }}" alt="logo"
                class="toggle-logo">
            <img src="{{ static_asset('assets/assets_admin/images/brand-logos/desktop-dark.png') }}" alt="logo"
                class="desktop-dark">
            <img src="{{ static_asset('assets/assets_admin/images/brand-logos/toggle-dark.png') }}" alt="logo"
                class="toggle-dark">
        </a>
    </div>
    <!-- End::main-sidebar-header -->

    <!-- Start::main-sidebar -->
    <div class="main-sidebar" id="sidebar-scroll">

        <!-- Start::nav -->
        <nav class="main-menu-container nav nav-pills flex-column sub-open">
            <div class="main-sidebar-loggedin">
                <div class="app-sidebar__user">
                    <div class="dropdown user-pro-body text-center">
                        <div class="user-pic mb-2">
                            <img src="{{ static_asset('assets/assets_admin/images/faces/user.png') }}" alt="user-img"
                                class="rounded-circle mCS_img_loaded">
                        </div>
                        <div class="user-info">
                            <h6 class=" mb-0">{{session('LoggedUser')->first_name}}</h6>
                            <span class="fs-13 text-uppercase">{{session('LoggedUser')->userType}}</span>
                        </div>
                    </div>
                </div>
            </div>
            {{-- <div class="sidebar-navs mx-auto my-2">
                <button aria-label="button" type="button"
                    class="btn btn-icon btn-outline-light rounded-pill btn-wave m-1">
                    <i class="fe fe-settings"></i>
                </button>
                <button aria-label="button" type="button"
                    class="btn btn-icon btn-outline-light rounded-pill btn-wave m-1">
                    <i class="fe fe-mail"></i>
                </button>
                <button aria-label="button" type="button"
                    class="btn btn-icon btn-outline-light rounded-pill btn-wave m-1">
                    <i class="fe fe-user"></i>
                </button>
                <button onclick="window.location.href='{{ url('admin/logout') }}'" aria-label="button" type="button"
                    class="btn btn-icon btn-outline-light rounded-pill btn-wave m-1">
                    <i class="fe fe-power"></i>
                </button>
            </div> --}}
            <div class="slide-left" id="slide-left">
                <svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24" height="24" viewBox="0 0 24 24">
                    <path d="M13.293 6.293 7.586 12l5.707 5.707 1.414-1.414L10.414 12l4.293-4.293z"></path>
                </svg>
            </div>
            @if(session('LoggedUser')->user_type_id == 1)
                <ul class="main-menu">

                    <!-- Start::slide -->
                    <li class="slide">
                        <a href="{{ url('admin/dashboard') }}" class="side-menu__item">
                            <span class=" side-menu__icon">
                                <i class='fe fe-airplay'></i>
                            </span>
                            <span class="side-menu__label">Dashboard</span>
                        </a>
                    </li>
                    <!-- End::slide -->



                    <li class="li-section-title">Admin Menu</li>

                    <li class="slide">
                        <a href="{{ route('admin.customer-posts.index') }}" class="side-menu__item">
                            <span class="side-menu__icon"><i class="fe fe-file-text"></i></span>
                            <span class="side-menu__label">Customer Posts</span>
                        </a>
                    </li>

                    {{-- <li class="slide has-sub">
                        <a href="javascript:void(0);" class="side-menu__item">
                            <span class=" side-menu__icon">
                                <i class='fe fe-box'></i>
                            </span>
                            <span class="side-menu__label">Home Banner/Slider</span>
                            <i class="fe fe-chevron-right side-menu__angle"></i>
                        </a>
                        <ul class="slide-menu child1">
                            <li class="slide side-menu__label1">
                                <a href="javascript:void(0)">Home Banner/Slider</a>
                            </li>

                            <li class="slide">
                                <a href="{{ url('admin/website/vivah-mitra-app-sliders') }}" class="side-menu__item">Slider</a>
                            </li>
                        </ul>
                    </li> --}}

                    <li class="slide has-sub">
                        <a href="javascript:void(0);" class="side-menu__item">
                            <span class=" side-menu__icon">
                                <i class='fe fe-box'></i>
                            </span>
                            <span class="side-menu__label">Master</span>
                            <i class="fe fe-chevron-right side-menu__angle"></i>
                        </a>
                        <ul class="slide-menu child1">
                            <li class="slide side-menu__label1">
                                <a href="javascript:void(0)">Master</a>
                            </li>

                            <li class="slide">
                                <a href="{{ url('admin/user-type') }}" class="side-menu__item">User Type</a>
                            </li>
                            {{-- <li class="slide">
                                <a href="{{ url('admin/designations') }}" class="side-menu__item">User Designation</a>
                            </li>


                            <li class="slide">
                                <a href="{{ url('admin/location/states') }}" class="side-menu__item">State</a>
                            </li>

                            <li class="slide">
                                <a href="{{ url('admin/location/city') }}" class="side-menu__item">District</a>
                            </li>

                            <li class="slide">
                                <a href="{{ url('admin/location/blocks') }}" class="side-menu__item">Block</a>
                            </li> --}}


                        </ul>
                    </li>

					<li class="slide has-sub">
                        <a href="javascript:void(0);" class="side-menu__item">
                            <span class=" side-menu__icon">
                                <i class="ri-user-star-fill"></i>
                            </span>
                            <span class="side-menu__label">User Management</span>
                            <i class="fe fe-chevron-right side-menu__angle"></i>
                        </a>
                        <ul class="slide-menu child1">
                            <li class="slide side-menu__label1">
                                <a href="javascript:void(0)">User Management</a>
                            </li>
                            <li class="slide">
                                <a href="{{ url('admin/staffs') }}" class="side-menu__item">User List</a>
                            </li>
                        </ul>
                    </li>

                     

                    {{-- <li class="slide has-sub">
                        <a href="javascript:void(0);" class="side-menu__item">
                            <span class=" side-menu__icon">
                                <i class="ri-pages-line"></i>
                            </span>
                            <span class="side-menu__label">CMS Setting</span>
                            <i class="fe fe-chevron-right side-menu__angle"></i>
                        </a>
                        <ul class="slide-menu child1">
                            <li class="slide side-menu__label1">
                                <a href="javascript:void(0)">CMS Setting</a>
                            </li>
                            <li class="slide">
                                <a href="{{ url('admin/pages') }}" class="side-menu__item">Page List</a>
                                <a href="{{ url('admin/page_sections') }}" class="side-menu__item">Page Section List</a>
                                <a href="{{ url('admin/section_data') }}" class="side-menu__item">Page Section Data List</a>
                            </li>
                        </ul>
                    </li> --}}

                    {{-- <li class="slide has-sub">
                        <a href="javascript:void(0);" class="side-menu__item">
                            <span class=" side-menu__icon">
                                <i class="ri-customer-service-fill"></i>
                            </span>
                            <span class="side-menu__label">Property Enquiry</span>
                            <i class="fe fe-chevron-right side-menu__angle"></i>
                        </a>
                        <ul class="slide-menu child1">
                            <li class="slide">
                                <a href="{{ route('admin.propertyEnquiryList') }}" class="side-menu__item">Property Enquiries</a>
                            </li>
                            <li class="slide">
                                <a href="{{ route('admin.propertyTourList') }}" class="side-menu__item">Property Tours</a>
                            </li>

                        </ul>
                    </li> --}}

					<li class="slide has-sub">
                        <a href="javascript:void(0);" class="side-menu__item">
                            <span class=" side-menu__icon">
                                <i class="ri-customer-service-fill"></i>
                            </span>
                            <span class="side-menu__label">Enquiry</span>
                            <i class="fe fe-chevron-right side-menu__angle"></i>
                        </a>
                        <ul class="slide-menu child1">
                            <li class="slide side-menu__label1">
                                <a href="javascript:void(0)">Enquiry</a>
                            </li>
                            {{-- <li class="slide">
                                <a href="{{ url('admin/home-page-enquiry') }}" class="side-menu__item">Home Page Enquiry
                                    List</a>
                            </li> --}}

                            <li class="slide">
                                <a href="{{ url('admin/contact-enquiry') }}" class="side-menu__item">Contact Page List</a>
                            </li>

                        </ul>
                    </li>

                    <!-- End::slide -->
{{--
                    <li class="slide has-sub">
                        <a href="javascript:void(0);" class="side-menu__item">
                            <span class=" side-menu__icon">
                                <i class="ri-customer-service-fill"></i>
                            </span>
                            <span class="side-menu__label">Notice</span>
                            <i class="fe fe-chevron-right side-menu__angle"></i>
                        </a>
                        <ul class="slide-menu child1">
                            <li class="slide side-menu__label1">
                                <a href="javascript:void(0)">Notice</a>
                            </li>
                            <li class="slide">
                                <a href="{{ url('admin/notice-list') }}" class="side-menu__item">Notice List</a>
                            </li>
                        </ul>
                    </li>





					  <li class="li-section-title">Website Menu</li>

                    <!-- Start::slide -->
                    <li class="slide has-sub">
                        <a href="javascript:void(0);" class="side-menu__item">
                            <span class=" side-menu__icon">
                                <i class='fe fe-box'></i>
                            </span>
                            <span class="side-menu__label">Blogs</span>
                            <i class="fe fe-chevron-right side-menu__angle"></i>
                        </a>
                        <ul class="slide-menu child1">
                            <li class="slide side-menu__label1">
                                <a href="javascript:void(0)">Blogs</a>
                            </li>
                            <li class="slide">
                                <a href="{{ url('admin/blogs') }}" class="side-menu__item">Blogs List</a>
                                <a href="{{ url('admin/blogs/create') }}" class="side-menu__item">Add Blogs</a>
                            </li>
                        </ul>
                    </li>



                    <!-- Start::slide -->
                    <li class="slide has-sub">
                        <a href="javascript:void(0);" class="side-menu__item">
                            <span class=" side-menu__icon">
                                <i class="ri-youtube-line"></i>
                            </span>
                            <span class="side-menu__label">Videos</span>
                            <i class="fe fe-chevron-right side-menu__angle"></i>
                        </a>
                        <ul class="slide-menu child1">
                            <li class="slide side-menu__label1">
                                <a href="javascript:void(0)">Videos</a>
                            </li>
                            <li class="slide">
                                <a href="{{ url('admin/videos-category') }}" class="side-menu__item">Video Category</a>

                                <a href="{{ url('admin/videos-of-assembly') }}" class="side-menu__item">Videos</a>
                                <a href="{{ url('admin/videos-of-assembly/create') }}" class="side-menu__item">Add
                                    Videos</a>
                            </li>
                        </ul>
                    </li>


                    <!-- Start::slide -->
                    <li class="slide has-sub">
                        <a href="javascript:void(0);" class="side-menu__item">
                            <span class=" side-menu__icon">
                                <i class='fe fe-box'></i>
                            </span>
                            <span class="side-menu__label">Latest Events</span>
                            <i class="fe fe-chevron-right side-menu__angle"></i>
                        </a>
                        <ul class="slide-menu child1">
                            <li class="slide side-menu__label1">
                                <a href="javascript:void(0)">Latest Events</a>
                            </li>
                            <li class="slide">
                                <a href="{{ url('admin/event_categories') }}" class="side-menu__item">Event Category</a>
                                <a href="{{ url('admin/event_categories/create') }}" class="side-menu__item">Add Event
                                    Category</a>
                            </li>
                            <li class="slide">
                                <a href="{{ url('admin/event_galleries/create') }}" class="side-menu__item">Add Event
                                    Gallery</a>
                                <a href="{{ url('admin/event_galleries') }}" class="side-menu__item">Event Gallery List</a>
                            </li>
                        </ul>
                    </li>

                    <!-- Start::slide -->
                    <li class="slide has-sub">
                        <a href="javascript:void(0);" class="side-menu__item">
                            <span class=" side-menu__icon">
                                <i class='fe fe-image'></i>
                            </span>
                            <span class="side-menu__label">Gallery Photos</span>
                            <i class="fe fe-chevron-right side-menu__angle"></i>
                        </a>
                        <ul class="slide-menu child1">
                            <li class="slide side-menu__label1">
                                <a href="javascript:void(0)">Gallery Photos</a>
                            </li>
                            <li class="slide">
                                <a href="{{ url('admin/image_categories') }}" class="side-menu__item">Photo Category</a>
                                <a href="{{ url('admin/image_categories/create') }}" class="side-menu__item">Add Photo
                                    Category</a>
                            </li>
                            <li class="slide">
                                <a href="{{ url('admin/galleries/create') }}" class="side-menu__item">Add Latest Photos</a>
                                <a href="{{ url('admin/galleries') }}" class="side-menu__item">Latest Photos List</a>
                            </li>
                        </ul>
                    </li>

                    <!-- Start::slide -->
                    <li class="slide has-sub">
                        <a href="javascript:void(0);" class="side-menu__item">
                            <span class=" side-menu__icon">
                                <i class='fe fe-bell'></i>
                            </span>
                            <span class="side-menu__label">Notification</span>
                            <i class="fe fe-chevron-right side-menu__angle"></i>
                        </a>
                        <ul class="slide-menu child1">
                            <li class="slide side-menu__label1">
                                <a href="javascript:void(0)">Notification</a>
                            </li>
                            <li class="slide">
                                <a href="{{ url('admin/notification') }}" class="side-menu__item">Notification</a>
                                <a href="{{ url('admin/add-notification') }}" class="side-menu__item">Add Notification</a>
                            </li>
                        </ul>
                    </li>


                    <li class="slide has-sub">
                        <a href="javascript:void(0);" class="side-menu__item">
                            <span class=" side-menu__icon">
                                <i class='fe fe-globe'></i>
                            </span>
                            <span class="side-menu__label">Website Setting</span>
                            <i class="fe fe-chevron-right side-menu__angle"></i>
                        </a>
                        <ul class="slide-menu child1">
                            <li class="slide side-menu__label1">
                                <a href="javascript:void(0)">Website Setting</a>
                            </li>

                            <li class="slide">

                                <a href="{{ url('admin/website/header') }}" class="side-menu__item">Header</a>
                                <a href="{{ url('admin/website/footer') }}" class="side-menu__item">Footer</a>
                                <a href="{{ url('admin/website/social_media') }}" class="side-menu__item">Social Media</a>
                                <a href="{{ url('admin/website/home-banner') }}" class="side-menu__item">Home Banner</a>
                            </li>
                        </ul>
                    </li>

                    <!-- Start::slide -->
                    --}}






                </ul>
            @else



            @endif



            <div class="slide-right" id="slide-right"><svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24"
                    height="24" viewBox="0 0 24 24">
                    <path d="M10.707 17.707 16.414 12l-5.707-5.707-1.414 1.414L13.586 12l-4.293 4.293z"></path>
                </svg></div>
        </nav>
        <!-- End::nav -->

    </div>
    <!-- End::main-sidebar -->




</aside>
<!-- End::app-sidebar -->
