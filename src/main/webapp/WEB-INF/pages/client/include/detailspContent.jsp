<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link rel="stylesheet" href="Frontend/css/detailsp.css">
</head>
<script type="text/javascript">	  
	$(document).ready(function() { 
	  	var priceConvert = accounting.formatMoney(${sp.getDonGia()})+' VND';
		document.getElementById("priceConvert").innerHTML= priceConvert;
		  
	  });
	</script>
<body>
	<div class="container">
		<div class="product-detail">
			<p style="display: none" id="spid">${sp.getId()}</p>
			<div class="detail-left">
				<img src="/laptopshop/img/${sp.getId()}.png" alt=""
					class="product-detail-img" />
			</div>
			<div class="detail-right">
				<h2 class="product-detail-name">${sp.getTenSanPham()}</h2>
				<p class="product-detail-desc">Description Product</p>
				<c:if test="${sp.getCpu().length() > 0}">
					<p class="product-detail-desc">CPU: ${sp.getCpu()}</p>
				</c:if>
				<c:if test="${sp.getRam().length() > 0}">
					<p class="product-detail-desc">RAM: ${sp.getRam()}</p>
				</c:if>
				<c:if test="${sp.getThietKe().length() > 0}">
					<p class="product-detail-desc">Design: ${sp.getThietKe()}</p>
				</c:if>
				<c:if test="${sp.getManHinh().length() > 0}">
					<p class="product-detail-desc">Screen: ${sp.getManHinh()}</p>
				</c:if>
				<c:if test="${sp.getDungLuongPin().length() > 0}">
					<p class="product-detail-desc">Capacity pin:
						${sp.getDungLuongPin()}</p>
				</c:if>

				<p class="product-detail-desc">Manufacturer:
					${sp.hangSanXuat.tenHangSanXuat}</p>
				<p class="product-detail-desc">General information:
					${sp.getThongTinChung()}</p>
				<p class="product-detail-desc">Guarantee:
					${sp.getThongTinBaoHanh()}</p>
				<div class="group-price">
					<p class="product-detail-price" id="priceConvert"></p>
					<a href="#!" class="action-cart add-to-cart">Add Cart</a>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="<c:url value='/js/client/detailspAjax.js'/>"></script>
