<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Check out</title>
</head>

<script type="text/javascript">
	$(document).ready(function() {
		$(".donGia.check").each(function() {
			var value = accounting.formatMoney($(this).text()) + ' VND';
			$(this).html(value);
		});

		$(".order-total-price.total").each(function() {
			var value = accounting.formatMoney($(this).text()) + ' VND ';
			$(this).html(value);
		});
	});
</script>
<body>
	<section class="container" id="checkout"> <!-- Heading -->
	<div class="heading-cart">
		<h2 class="heading-title">Checkout</h2>
	</div>

	<form class="info" method="POST" action="<%=request.getContextPath()%>/thankyou">
		<div class="shipping-details">
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<p class="shipping-title">User Details</p>
				<div class="info-user">
					<div class="info-user-left">
						<p class="info-user-text">
							Name: <span>${user.hoTen}</span>
						</p>
						<p class="info-user-text">
							Phone: <span>${user.soDienThoai}</span>
						</p>
						<p class="info-user-text">
							Address: <span>${user.diaChi}</span>
						</p>
					</div>
					<div class="info-user-right">
						<p class="info-user-text">
							Email: <span> ${user.email}</span>
						</p>
					</div>
				</div>
			</c:if>
			<p class="shipping-title">Shipping Details</p>
			<div class="info-receiver">
				<div class="row-receiver">
					<label for="receiver-name" class="label-receiver">Recipient's
						name</label> <input type="text" id="receiver-name" class="receiver-input" name="hoTenNguoiNhan" required />
				</div>
				<div class="row-receiver">
					<label for="receiver-phone" class="label-receiver">Recipient's
						phone number</label> <input type="text" id="receiver-phone"
						class="receiver-input" />
				</div>
				<div class="row-receiver">
					<label for="receiver-address" class="label-receiver">Recipient's
						address</label> <input type="text" id="receiver-address"
						class="receiver-input" name="diaChiNhan" required/>
				</div>

				<input type="hidden" id="tongGiaTri" name="tongGiaTri">
				
				<div class="actions-order">
					<a class="action-link back-cart" href="<%=request.getContextPath()%>/cart">Back To Cart</a> <button
						class="action-link pay" type="submit">Pay Now</button>
				</div>
			</div>
		</div>
		<div class="your-order">
			<p class="shipping-title">YOUR ORDER</p>
			<div class="order-products">
				<c:forEach items="${cart}" var="sanpham">
					<div class="row-order">
						<div class="order-img">
							<img src="/laptopshop/img/${sanpham.id}.png" alt=""
								class="order-images" />
						</div>
						<div class="order-desc">
							<p class="name-product-order">${sanpham.tenSanPham}</p>
							<p class="price-product-order donGia check">${sanpham.donGia}</p>
						</div>
						<div class="order-quantity">
							<p class="order-number">x ${quanity[sanpham.id]}</p>
						</div>

						<div class="order-total">
							<p class="order-total-price total">${sanpham.donGia*quanity[sanpham.id]}</p>
						</div>
					</div>
				</c:forEach>

				<div class="row-order-text">
					<span>Total</span>
					<p class="total-price-calculate" id="ordertotal"></p>
				</div>
			</div>
		</div>
	</form>
	</section>
	<script src="<c:url value='/js/client/checkoutAjax.js'/>"></script>
</body>
</html>

