<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact</title>
<style type="text/css">
input, button, textarea, form {
	font-family: 'Poppins';
	font-size: 1.6rem;
	color: #fff;
}

.form-contact {
	width: 788px;
	max-width: 100%;
	margin: 7rem auto 0;
	display: flex;
	flex-direction: column;
	gap: 3rem;
}

.form-group {
	display: flex;
	flex-direction: column;
	gap: 1rem;
}

.form-group textarea {
	resize: none;
}

.form-group input {
	padding: 12px 16px;
	border: none;
	background: #000;
	border-radius: 1rem;
	color: #fff;
	outline: none;
}

.form-group textarea {
	padding: 12px 16px;
	border: none;
	background: #000;
	border-radius: 1rem;
	color: #fff;
	outline: none;
}

.actions-btn {
	width: 788px;
	max-width: 100%;
	margin: 5rem auto 0;
	display: flex;
	justify-content: flex-end;
	max-width: 100%;
	margin: 7rem auto 0;
}

.actions-btn button {
	padding: 8px 10px;
	background: #7aa7df;
	border: none;
	border-radius:1rem;
}
</style>
</head>
<body>
	<div class="container">
		<br>
		<p style="font-size: 30px">Liên hệ với chúng tôi</p>
		<hr>
		<!-- 		<form>		
			<label>Địa chỉ emai của bạn:</label> <br>
			<p id="emailWarning" style="color: red"></p>
			<input id="email" type="text">
			<br>
			<label>Nội dung liên hệ:</label> <br>
			<p id="contentWarning" style="color: red"></p>
			<textarea id="content" rows="4" cols="50"></textarea>
			<br>	
		</form>
		<button >Gửi yêu cầu</button> -->


		<form class="form-contact">
			<div class="form-group">
				<label for="email">Your email address:</label>
				<p id="emailWarning" style="color: red"></p>
				<input type="email" class="form-control" id="email">
			</div>
			<div class="form-group">
				<label for="content">Contact info</label>
				<p id="contentWarning" style="color: red"></p>
				<textarea class="form-control" id="content" rows="4" cols="50"></textarea>
			</div>
		</form>
		<div class="actions-btn">
			<button onClick="sendContact()" class="btn btn-primary">Send
				the contact</button>
		</div>

	</div>
	<script src="<c:url value='/js/client/contactAjax.js'/>"></script>
</body>
</html>
