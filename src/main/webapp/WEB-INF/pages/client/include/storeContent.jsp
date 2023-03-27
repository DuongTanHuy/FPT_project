<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script src="Frontend/js/jquery.min.js"></script>
<script src="js/client/accounting.js"></script>
<link href="Frontend/css/store.css" rel="stylesheet" type="text/css"
	media="all" />
<script src="<c:url value='/js/client/store.js'/>"></script>
</head>

<script type="text/javascript">
	$(document).ready(function() {
		$(".movie-type").each(function() {
			var value = accounting.formatMoney($(this).text()) + ' VND';
			$(this).html(value);
		});

	});
	
</script>




<body>

	<section class="movies container" id="movies">
		<!-- Heading -->
		<div class="heading" style="margin-top: 100px">
			<h2 class="heading-title">${brand}</h2>
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
						<h2 class="movie-title"><a href ="/laptopshop/sp?id=${sanpham.id}">${sanpham.tenSanPham}</a></h2>
						<span class="movie-type">${sanpham.donGia}</span> <a href="#"
							class="watch-btn play-btn" onClick="addToCart(${sanpham.id})"><i
							class="bx bx-right-arrow"></i> </a>
					</div>
				</div>
			</c:forEach>
		</div>

		<c:if test="${list.size() != 0}">
			<div class="paging">
				<c:if test="${currentPage != 1}">
					<a
						href="/laptopshop/store?page=${currentPage-1}&range=${range}&brand=${brand}&manufactor=${manufactor}&os=${os}&ram=${ram}&pin=${pin}">Back</a>
				</c:if>
				<c:if test="${currentPage == 1}">
					<a class="current">1</a>
				</c:if>
				<c:if test="${currentPage != 1}">
					<a
						href="/laptopshop/store?page=1&range=${range}&brand=${brand}&manufactor=${manufactor}&os=${os}&ram=${ram}&pin=${pin}">1</a>
				</c:if>

				<c:forEach var="pag" items="${pageList}" varStatus="loop">
					<c:if test="${currentPage == pag}">
						<a class="current">${pag}</a>
					</c:if>
					<c:if test="${currentPage != pag}">
						<a
							href="/laptopshop/store?page=${pag}&range=${range}&brand=${brand}&manufactor=${manufactor}&os=${os}&ram=${ram}&pin=${pin}">${pag}</a>
					</c:if>
				</c:forEach>

				<c:if test="${currentPage != totalPage}">
					<a
						href="/laptopshop/store?page=${currentPage+1}&range=${range}&brand=${brand}&manufactor=${manufactor}&os=${os}&ram=${ram}&pin=${pin}">Next</a>
				</c:if>
			</div>
		</c:if>
	</section>

	<div class="content-sidebar">
		<h4 class="title-filter"><p>Filter Product</p> <i class='bx bx-menu'></i></h4>
		<form class="form-filter">
			<input type="hidden" name="name" value="${name}">
			<p class="label-filter">Price</p>
			<div class="select-range">
				<select name="range" class="form-control">
					<option value="">All Price</option>
					<option value="duoi-2-trieu">Under 2 million</option>
					<option value="2-trieu-den-4-trieu">2 million đến 4 million</option>
					<option value="4-trieu-den-6-trieu">4 million - 6 million</option>
					<option value="6-trieu-den-10-trieu">6 million - 10 million</option>
					<option value="tren-10-trieu">Over  10 million</option>
				</select>
			</div>
			<p class="label-filter">Manufacturer</p>
			<div class="select-range">
				<select name="manufactor" class="form-control">
					<option value="">All Manufacturer</option>
					<c:forEach var="manufactor" items="${hangsx}" varStatus="loop">
						<option value="${manufactor}">${manufactor}</option>
					</c:forEach>
				</select>
			</div>
			<c:if test="${brand == 'Laptop'}">
				<p class="label-filter">Operating System</p>
				<div class="select-range">
					<select name="os" class="form-control">
						<option value="">All Operating System</option>
						<option value="ubuntu">Ubuntu</option>
						<option value="dos">DOS</option>
						<option value="mac">MAC</option>
						<option value="linux">Linux</option>
						<option value="windows 10">Window 10</option>
					</select>
				</div>
				<p class="label-filter">RAM</p>
				<div class="select-range">
					<select name="ram" class="form-control">
						<option value="">All Ram</option>
						<option value="2 GB">2 GB</option>
						<option value="3 GB">3 GB</option>
						<option value="4 GB">4 GB</option>
						<option value="6 GB">6 GB</option>
						<option value="8 GB">8 GB</option>
						<option value="16 GB">16 GB</option>
					</select>
				</div>
				<p class="label-filter">Pin</p>
				<div class="select-range">
					<select name="pin" class="form-control">
						<option value="">All Pin</option>
						<c:forEach var="manufactor" items="${pinSet}" varStatus="loop">
							<option value="${manufactor}">${manufactor}</option>
						</c:forEach>
					</select>
				</div>
			</c:if>
			<input type="hidden" name="brand" value="${brand}"> <input
				class="search-submit" type="submit" value="Filter">
		</form>
	</div>
	
	<script type="text/javascript">
	let title_filter = document.querySelector(".title-filter");
	let form_filter = document.querySelector(".form-filter");

	title_filter.addEventListener("click", () => {
	    form_filter.classList.toggle("active");
	});
	</script>
</body>
</html>