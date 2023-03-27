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
<link href="Frontend/css/login.css" rel="stylesheet" type="text/css"
	media="all" />
</head>

<body>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<div class="container">
		<div class="sub-container">
			<div class="login-left">
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<img src="Frontend/img/laptop-01.png" alt="" />
						</div>
						<div class="swiper-slide">
							<img src="Frontend/img/laptop-02.png" alt="" />
						</div>
						<div class="swiper-slide">
							<img src="Frontend/img/laptop-03.png" alt="" />
						</div>
					</div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
			<div class="login-right">
				<div class="content">
					<h1 class="title">Login</h1>
					<div class="login-google">
						<i class="bx bxl-google"></i>
						<p>Sign in with the Google</p>
					</div>
					<div class="line">
						<p class="line-text">OR</p>
					</div>
					<form class="login-form" method="POST"
						action="${contextPath}/login">
						<div class="group-input">
							<label for="input-email" class="label-text">Email</label> <input
								type="email" id="input-email" name="email" required="required"
								placeholder="mail@example.com" class="input-login" />
						</div>
						<div class="group-input">
							<label for="input-password" class="label-text">Password</label> <input
								type="password" id="input-password" name="password"
								required="required" placeholder="Minimum of 6 character"
								class="input-login" />
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="group-checkbox">
							<input type="checkbox" id="input-checkbox" name="remember-me"
								class="input-login" /> <label for="input-checkbox"
								class="label-checkbox">Remember me</label>
						</div>

						<button type="submit" class="btn-submit">Login</button>

						<p class="register-text" id="rrrr">
							<a href="${contextPath}/register" onclick="show_box(erroMsg,'bxs-check-circle')">Register
								Now</a>
						</p>
					</form>
				</div>
			</div>
		</div>

		<!-- Toast -->
		<c:if test="${param.error != null}">
			<div class="toast-box">
				<div class="toast error">Error! Username or password is incorrect</div>
			</div>
		</c:if>
		<c:if test="${param.logout != null}">
			<div class="alert alert-success">
				<div class="toast-box">
					<div class="toast success">Success! logged out<i class='bx bxs-check-circle'></i></div>
				</div>
			</div>
		</c:if>
		<c:if test="${param.accessDenied != null}">
			<div class="alert alert-danger">
		<div class="alert alert-success">
				<div class="toast-box">
					<div class="toast invalid">Success! logged out</div>
				</div>
			</div>
			</div>
		</c:if>
	</div>

	<!-- Link swiper js -->
	<script src="Frontend/js/swiper-bundle.min.js"></script>
	<!-- Link to JS -->
	<script src="Frontend/js/main-login.js"></script>
</body>
</html>