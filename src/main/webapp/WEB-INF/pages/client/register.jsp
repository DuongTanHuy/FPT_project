<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Laptop Shop</title>
<link href="Frontend/css/reset.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- Embed icon -->
<link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css"
	rel="stylesheet" />
<!-- Link swiper css -->
<link rel="stylesheet" href="Frontend/css/swiper-bundle.min.css" />
<!-- style css -->
<link href="Frontend/css/register.css" rel="stylesheet" type="text/css"
	media="all" />
</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<div class="container">
		<div class="sub-container">
			<div class="container-slide">
				<!-- Swiper -->
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img src="Frontend/img/banner-register-01.jpg" alt="" />
						</div>
						<div class="swiper-slide">
							<img src="Frontend/img/banner-register-02.jpg" alt="" />
						</div>
						<div class="swiper-slide">
							<img src="Frontend/img/banner-register-03.jpg" alt="" />
						</div>
						<div class="swiper-slide">
							<img src="Frontend/img/banner-register-04.jpg" alt="" />
						</div>
					</div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-pagination"></div>
					<div class="autoplay-progress">
						<svg viewBox="0 0 48 48">
                                <circle cx="24" cy="24" r="20"></circle>
                            </svg>
						<span></span>
					</div>
				</div>
			</div>

			<div class="register-content">
				<h1 class="title-register">Register</h1>
				<form:form class="form-register" method="POST" action="register"
					modelAttribute="newUser">
					<div class="row-input">
						<div class="group-input">
							<label for="input-email" class="label-text">Email</label>
							<form:input type="email" class="input-register" id="input-email"
								path="email" placeholder="Email" autofocus="true"
								required="required" />
							<div class="line"></div>
						</div>
						<div class="group-input">
							<label for="input-password" class="label-text">Password</label>
							<form:input type="password" class="input-register"
								id="input-password" path="password" required="required"
								placeholder="Password" />
							<div class="line"></div>
						</div>
					</div>
					<div class="row-input">
						<div class="group-input">
							<label for="input-name" class="label-text">Username</label>
							<form:input type="name" class="input-register" id="input-name"
								path="hoTen" placeholder="Name" required="required" />
							<div class="line"></div>
						</div>
						<div class="group-input">
							<label for="input-repeat-password" class="label-text">Repeat
								password</label>
							<form:input type="password" class="input-register"
								id="input-repeat-password" path="confirmPassword"
								placeholder="Repeat password" required="required" />
							<div class="line"></div>
						</div>
					</div>
					<div class="row-input">
						<div class="group-input">
							<label for="input-phone" class="label-text">Phone</label>
							<form:input type="number" class="input-register" id="input-phone"
								path="soDienThoai" placeholder="Phone" required="required" />
							<div class="line"></div>
						</div>
						<div class="group-input">
							<label for="input-address" class="label-text">Address</label>
							<form:input type="text" class="input-register" id="input-address"
								path="diaChi" placeholder="Address" required="required" />
							<div class="line"></div>
						</div>
					</div>
					<div class="row-btn">
						<button type="submit" class="btn-register">Register</button>
					</div>
				</form:form>

				<div class="action-login">
					<a href="<c:url value='/login'/>">Login now</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Link swiper js -->
	<script src="Frontend/js/swiper-bundle.min.js"></script>
	<!-- Link to JS -->
	<script src="Frontend/js/main-register.js"></script>
</body>
</html>