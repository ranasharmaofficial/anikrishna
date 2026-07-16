		<!-- Sidebar -->
    <aside class="member_dash_sidebar">

        <div class="member_dash_profile">
            <img src="{{ !empty($customerDetails->profile_pic) ? static_asset('uploads/all/'.$customerDetails->profile_pic) : static_asset('assets/assets_web/img/default-user.png') }}" alt="">
            <h3>{{ $customerDetails->first_name }}</h3>
            <p>{{ $customerDetails->email }}</p>
            <p>{{ $customerDetails->mobile }}</p>
        </div>

        <ul class="member_dash_menu">
            <li>
                <a href="{{ url('customer/dashboard') }}" class="member_dash_active">
                    <i class="fa-regular fa-user"></i>
                    <span>My Profile</span>
                </a>
            </li>

            <li>
                <a href="{{ route('customer.addPost') }}">
                    <i class="fa-regular fa-newspaper"></i>
                    <span>Add Submission</span>
                </a>
            </li>
			<li>
                <a href="{{ route('customer.posts.index') }}">
                    <i class="fa-regular fa-newspaper"></i>
                    <span>My Submissions</span>
                </a>
            </li>

            <li>
                <a href="{{ url('customer/account-settings') }}">
                    <i class="fa-solid fa-gear"></i>
                    <span>Account Settings</span>
                </a>
            </li>

            <li>
                <a href="{{ url('customer/customer-logout') }}">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    <span>Logout</span>
                </a>
            </li>
        </ul>

    </aside>
