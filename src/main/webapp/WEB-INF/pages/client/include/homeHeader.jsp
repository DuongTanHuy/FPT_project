<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- reset css -->
<link href="Frontend/css/reset.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- Embed icon -->
<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
	rel="stylesheet" />
<!-- style css -->
<link href="Frontend/css/style.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- account js -->
<script src="js/client/accounting.js"></script>
<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>

<!-- Link swiper css -->
<link rel="stylesheet" href="Frontend/css/swiper-bundle.min.css" />
</head>

<body>

	<header> <!-- Nav -->
	<div class="nav container">
		<!-- Logo -->
		<a href="<%=request.getContextPath()%>/" class="logo"> LAPTOP<span>.NET</span></a>
		<!-- Search Box -->
		<form action="/laptopshop/search">
			<div class="search-box">
				<input type="search" name="name" id="search-input"
					placeholder="Search..." />
				<button type="submit" class="btn-search-global"><i class="bx bx-search"></i></button>
			</div>
		</form>
		<!-- User -->
			<div class="user-container">
				<c:if test="${pageContext.request.userPrincipal.name != null}">

					<ul>
			            <li><a href="#!" class ="user-name">${loggedInUser.hoTen}</a></li>
						<li><a href="<%=request.getContextPath()%>/account"><i class='bx bxs-user-detail'></i></a></li>
						<li><a href="<%=request.getContextPath()%>/cart"><i class='bx bx-cart' ></i></a></li>
						<li><a href="<%=request.getContextPath()%>/logout"><i class='bx bxs-log-out' ></i></a></li>
					</ul>
				</c:if>

				<c:if test="${pageContext.request.userPrincipal.name == null}">
					<ul>
						<li><a href="<%=request.getContextPath()%>/register"><i class='bx bx-user-plus' ></i></a></li>
						<li><a href="<%=request.getContextPath()%>/login"><i class='bx bxs-user-circle'></i></a></li>
						<li><a href="<%=request.getContextPath()%>/cart"><i class='bx bx-cart' ></i></a><span
							class="glyphicon glyphicon-shopping-cart"></span></li>

					</ul>
				</c:if>
			</div>
		<!-- NavBar -->
		<div class="navbar">
			<a href="<%=request.getContextPath()%>/" class="nav-link nav-active"> <i
				class="bx bx-home"></i> <span class="nav-link-title">Home</span>
			</a> <a href="<%=request.getContextPath()%>/shipping"" class="nav-link"> <i class="bx bxs-hot"></i>
				<span class="nav-link-title">Free ship</span>
			</a> <a href="<%=request.getContextPath()%>/guarantee" class="nav-link"> <i class="bx bx-compass"></i>
				<span class="nav-link-title">Warranty </span>
			</a> <a href="<%=request.getContextPath()%>/contact" class="nav-link"> <i class="bx bx-tv"></i> <span
				class="nav-link-title">Contact</span>
			</a> <a href="<%=request.getContextPath()%>/blog" class="nav-link"> <i class="bx bx-heart"></i> <span
				class="nav-link-title">Blog</span>
			</a>
		</div>
	</div>
	</header>


	<script src="<c:url value='/js/client/header.js'/>"></script>