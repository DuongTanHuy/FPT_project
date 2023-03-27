<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="Frontend/css/cartTable.css">
<style>
</style>
</head>
<script type="text/javascript">
 	$(document).ready(function() {
		$(".covertPriceProduct").each(function() {
			var value = accounting.formatMoney($(this).text());
			$(this).html(value);
		});
		$(".total").each(function() {
			var value = accounting.formatMoney($(this).text());
			$(this).html(value);
		});
	}); 
</script>

<body>
	<section class="popular container" id="popular"> <!-- Heading -->
	<div class="heading-cart">
		<h2 class="heading-title">Cart</h2>
	</div>

	<div class="container-cart">
		<div class="carts">
			<c:forEach var="sanpham" items="${cart}" varStatus="loop">
				<div class="cart hidden" id="item${sanpham.id}">
					<img src="/laptopshop/img/${sanpham.id}.png" alt=""
						class="cart-img" />
					<div class="cart-content">
						<p class="cart-name">
							<a href="<c:url value="/sp?id=${sanpham.id}" />">${sanpham.tenSanPham}</a>
						</p>
						<p>
							Price: <span class="cart-price covertPriceProduct">${sanpham.donGia}</span> VND
						</p>
						<p class="cart-warranty">Warranty:
							${sanpham.thongTinBaoHanh.split(" ")[0]} months</p>
						<p>
							Total: <span class="cart-total-price total"
								id="item${sanpham.id}_total">${sanpham.donGia*quanity[sanpham.id]}
								</span> VND
						</p>
						<div class="group-cart">
							<div class="group-input-cart">
								<label for="">Quantity: </label> <input type="number"
									class="cart-quantity" value="${quanity[sanpham.id]}" min="1"
									onChange="changeQuanity(${sanpham.id},this.value,${sanpham.donGia})" />
							</div>
							<button class="cart-delete"
								onClick="deleteFromCart(${sanpham.id})">Remove</button>
						</div>
					</div>
				</div>

			</c:forEach>
		</div>

		<div class="bill-total hidden">
			<p class="bill-total-text">Total</p>
			<p class="bill-price" id="ordertotal"></p>
			<div class="bill-btn">
				<a class="add-cart" href="<%=request.getContextPath()%>/">More products</a>
				<a class="pay-cart" href="<%=request.getContextPath()%>/checkout">Pay now</a>
			</div>
		</div>
	</div>
	</section>

	<script src="<c:url value='/js/client/cartAjax.js'/>"></script>
</body>
</html>