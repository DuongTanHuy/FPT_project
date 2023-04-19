<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<head>
    <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
</head>

<body>
<div class="sidebar active" style="z-index: 99">
    <div class="logo_content">
        <div class="logo">
            <i class="bx bxl-c-plus-plus">
                <img id="logo_img" src="<c:url value='/Frontend/img/logo-fox.svg'/>" alt="">
            </i>
            <div class="logo_name" id="logo_name" style="font-weight: 600">Laptop Shop</div>
        </div>
        <i class="bx bx-menu" id="btn" style="display: flex;align-items: center;justify-content: center">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                 stroke="currentColor" style="width: 28px;height: 28px">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"/>
            </svg>
        </i>
    </div>
    <ul class="nav_list">
        <li>
            <i class="bx bx-search">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                     stroke="currentColor" class="w-6 h-6">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z"/>
                </svg>
            </i>
            <input type="text" placeholder="Search..."/>
            <span class="tooltip">Search</span>
        </li>
        <li>
            <a href="<c:url value='/admin' />">
                <i class="bx bx-grid-alt">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 6a7.5 7.5 0 107.5 7.5h-7.5V6z"/>
                        <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 10.5H21A7.5 7.5 0 0013.5 3v7.5z"/>
                    </svg>
                </i>
                <span class="links_name">Thống kê</span>
            </a>
            <span class="tooltip">Thống kê</span>
        </li>
        <li>
            <a href="<c:url value='/admin/don-hang' />">
                <i class="bx bx-user">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M2.25 3h1.386c.51 0 .955.343 1.087.835l.383 1.437M7.5 14.25a3 3 0 00-3 3h15.75m-12.75-3h11.218c1.121-2.3 2.1-4.684 2.924-7.138a60.114 60.114 0 00-16.536-1.84M7.5 14.25L5.106 5.272M6 20.25a.75.75 0 11-1.5 0 .75.75 0 011.5 0zm12.75 0a.75.75 0 11-1.5 0 .75.75 0 011.5 0z"/>
                    </svg>
                </i>
                <span class="links_name">Đơn hàng</span>
            </a>
            <span class="tooltip">Đơn hàng</span>
        </li>
        <li>
            <a href='<c:url value="/admin/san-pham"/>'>
                <i class="bx bx-message-rounded-dots">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z"/>
                    </svg>
                </i>
                <span class="links_name">Sản phẩm</span>
            </a>
            <span class="tooltip">Sản phẩm</span>
        </li>
        <li>
            <a href='<c:url value="/admin/danh-muc"/>'>
                <i class="bx bx-pie-chart-alt">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M9.568 3H5.25A2.25 2.25 0 003 5.25v4.318c0 .597.237 1.17.659 1.591l9.581 9.581c.699.699 1.78.872 2.607.33a18.095 18.095 0 005.223-5.223c.542-.827.369-1.908-.33-2.607L11.16 3.66A2.25 2.25 0 009.568 3z"/>
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 6h.008v.008H6V6z"/>
                    </svg>
                </i>
                <span class="links_name">Danh mục</span>
            </a>
            <span class="tooltip">Danh mục</span>
        </li>
        <li>
            <a href='<c:url value="/admin/nhan-hieu"/>'>
                <i class="bx bx-folder-open">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M12 3v2.25m6.364.386l-1.591 1.591M21 12h-2.25m-.386 6.364l-1.591-1.591M12 18.75V21m-4.773-4.227l-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0z"/>
                    </svg>
                </i>
                <span class="links_name">Hãng</span>
            </a>
            <span class="tooltip">Hãng</span>
        </li>
        <li>
            <a href="<c:url value='/admin/tai-khoan' />">
                <i class="bx bx-cart-download">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z"/>
                    </svg>
                </i>
                <span class="links_name">Khách hàng</span>
            </a>
            <span class="tooltip">Khách hàng</span>
        </li>
        <li>
            <a href="<c:url value='/admin/lien-he' />">
                <i class="bx bx-heart">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M20.25 3.75v4.5m0-4.5h-4.5m4.5 0l-6 6m3 12c-8.284 0-15-6.716-15-15V4.5A2.25 2.25 0 014.5 2.25h1.372c.516 0 .966.351 1.091.852l1.106 4.423c.11.44-.054.902-.417 1.173l-1.293.97a1.062 1.062 0 00-.38 1.21 12.035 12.035 0 007.143 7.143c.441.162.928-.004 1.21-.38l.97-1.293a1.125 1.125 0 011.173-.417l4.423 1.106c.5.125.852.575.852 1.091V19.5a2.25 2.25 0 01-2.25 2.25h-2.25z"/>
                    </svg>
                </i>
                <span class="links_name">Liên hệ</span>
            </a>
            <span class="tooltip">Liên hệ</span>
        </li>
        <li>
            <a href="<c:url value='/admin' />">
                <i class="bx bxs-cog">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M15 9h3.75M15 12h3.75M15 15h3.75M4.5 19.5h15a2.25 2.25 0 002.25-2.25V6.75A2.25 2.25 0 0019.5 4.5h-15a2.25 2.25 0 00-2.25 2.25v10.5A2.25 2.25 0 004.5 19.5zm6-10.125a1.875 1.875 0 11-3.75 0 1.875 1.875 0 013.75 0zm1.294 6.336a6.721 6.721 0 01-3.17.789 6.721 6.721 0 01-3.168-.789 3.376 3.376 0 016.338 0z"/>
                    </svg>

                </i>
                <span class="links_name">Cài đặt</span>
            </a>
            <span class="tooltip">Cài đặt</span>
        </li>
    </ul>
    <div class="profile_content">
        <div class="profile">
            <div class="profile_details">
                <img src="https://images.unsplash.com/photo-1581348464577-9018bfcc22da?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=726&q=80"
                     alt="avatar"/>
                <div class="name_job">
                    <div class="name">${loggedInUser.hoTen}</div>
                    <div class="job">Administrator</div>
                </div>
            </div>
            <a href="<c:url value='/logout' />" style="color: #fff">
                <i class="bx bx-log-out" id="log_out">
                    <svg style="width: 28px;height: 28px" xmlns="http://www.w3.org/2000/svg" fill="none"
                         viewBox="0 0 24 24"
                         stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round"
                              d="M15.75 9V5.25A2.25 2.25 0 0013.5 3h-6a2.25 2.25 0 00-2.25 2.25v13.5A2.25 2.25 0 007.5 21h6a2.25 2.25 0 002.25-2.25V15M12 9l-3 3m0 0l3 3m-3-3h12.75"/>
                    </svg>
                </i>
            </a>
        </div>
    </div>
</div>
<div class="header_content">
<%--    <div class="text">--%>
        <jsp:include page="header.jsp"></jsp:include>
<%--    </div>--%>
</div>
<script>
    let btn = document.querySelector("#btn");
    let sidebar = document.querySelector(".sidebar");
    let searchBtn = document.querySelector(".bx-search");

    btn.addEventListener("click", () => sidebar.classList.toggle("active"));
    searchBtn.addEventListener("click", () =>
        sidebar.classList.toggle("active")
    );
</script>
<script src="<c:url value='/js/admin.js'/>"></script>
</body>