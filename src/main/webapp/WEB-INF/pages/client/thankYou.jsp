<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script src="Frontend/js/jquery.min.js"></script>
<script src="js/client/accounting.js"></script>
<title>Check out</title>
<link href="Frontend/css/thankyou.css" rel="stylesheet" type="text/css"
	media="all" />
</head>

<script type="text/javascript">
	$(document).ready(function() {
		$(".product-th-price .check").each(function() {
			var value = accounting.formatMoney($(this).text()) + ' VND';
			$(this).html(value);
		});

		$(".product-th-total.total").each(function() {
			var value = accounting.formatMoney($(this).text()) + ' VND ';
			$(this).html(value);
		});
	});
</script>
<body>

	<jsp:include page="include/homeHeader.jsp"></jsp:include>


	<div class="container thank">
		<h2 class="thank-you">Thank You</h2>
		<p class="thank-desc">Thank you very much for trusting our
			products and services</p>
		<div class="thank-content">
			<div class="thank-left">
				<p class="thank-title">Information</p>
				<div class="thank-left-group">
					<p class="info-thank">Code orders: 45</p>
					<p class="info-thank">Name: Hai Trieu</p>
					<p class="info-thank">Phone Number: 0984085615</p>
					<p class="info-thank">Address: Da Nang</p>
					<p class="info-thank">Note: The order was placed at 20/03/2021
					</p>
					<div class="action-ctn">
						<a href="<%=request.getContextPath()%>/" class="btn-buyer">Continue
							shopping</a>
					</div>
				</div>
			</div>
			<div class="thank-right">
				<p class="thank-title right">Purchased Product</p>
				<div class="group-product">
					<c:forEach items="${cart}" var="sanpham">
						<div class="product-item-th">
							<div class="product-images-th">
								<img src="/laptopshop/img/${sanpham.id}.png" alt=""
									class="product-th-img" />
							</div>
							<p class="product-th-name">${sanpham.tenSanPham}</p>
							<p class="product-th-price">
								<span class="check">${sanpham.donGia}</span> x
								${quanity[sanpham.id]}
							</p>
							<p class="product-th-total total">${sanpham.donGia*quanity[sanpham.id]}</p>
						</div>
					</c:forEach>
				</div>
				<p class="total-price">
					<span class="lv1">Total</span> <span class="lv2" id="ordertotal"></span>
				</p>
			</div>
		</div>
	</div>

	<jsp:include page="include/homeFooter.jsp"></jsp:include>
	<script src="<c:url value='/js/client/thankyou.js'/>"></script>
</body>
</html>

