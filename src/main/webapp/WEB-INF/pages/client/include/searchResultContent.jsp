<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link rel="stylesheet" href="Frontend/css/store.css">
<script src="Frontend/js/jquery.min.js"></script>
<script src="Frontend/js/responsiveslides.min.js"></script>
<script src="js/client/accounting.js"></script>
<script src="<c:url value='/js/client/search.js'/>"></script>
</head>

<script type="text/javascript">	  
	$(document).ready(function() { 
		 $(".movie-type").each(function() {
			  var value = accounting.formatMoney($(this).text())+ ' VND';
			  $(this).html(value);
			});
		
		 
	  });
	</script>
<body>
	<section class="movies container" id="movies">
		<!-- Heading -->
		<div class="heading" style="margin-top: 100px">
			<h2 class="heading-title">Result</h2>
		</div>

		<c:if test="${list.size() == 0}">
				Không tìm thấy kết quả nào
		</c:if>
		<!-- Content -->
		<div class="movies-content">
			<c:forEach var="sanpham" items="${list}" varStatus="loop">
				<div class="movie-box">
					<img src="/laptopshop/img/${sanpham.id}.png" alt=""
						class="movie-box-img" />
					<div class="box-text">
						<h2 class="movie-title">
							<a href="/laptopshop/sp?id=${sanpham.id}">${sanpham.tenSanPham}</a>
						</h2>
						<span class="movie-type">${sanpham.donGia}</span> <a href="#"
							class="watch-btn play-btn" onClick="addToCart(${sanpham.id})"><i
							class="bx bx-right-arrow"></i> </a>
					</div>
				</div>
			</c:forEach>
		</div>

	</section>

</body>
</html>