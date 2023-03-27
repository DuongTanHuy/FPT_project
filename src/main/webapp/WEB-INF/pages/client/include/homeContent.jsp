<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="<c:url value='/js/client/homeAjax.js'/>"></script>
<!-- Modal -->
<div class="modal">
	<div class="modal-content">
		<div class="close">
			<i class="bx bx-window-close"></i>
		</div>
		<img src="./Frontend/img/banner-hot.jpg" alt="" />
	</div>
</div>

<!-- Category -->
<div class="category">
	<div class="header-category">
		<p>Category</p>
		<i class="bx bx-menu"></i>
	</div>
	<ul class="category-render">
	</ul>
</div>


<!-- Home -->
<section class="home container" id="home">
	<div class="swiper mySwiper">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<img src="Frontend/img/banner-laptop.jpg" alt="" class="home-img" />
			</div>
			<div class="swiper-slide">
				<img src="Frontend/img/banner-laptop1.jpg" alt="" class="home-img" />
			</div>
			<div class="swiper-slide">
				<img src="Frontend/img/banner-laptop2.jpg" alt="" class="home-img" />
			</div>
			<div class="swiper-slide">
				<img src="Frontend/img/banner-laptop3.jpg" alt="" class="home-img" />
			</div>
		</div>
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
	</div>
</section>

<!-- Home End -->

<!-- Popular Section Start -->
<section class="popular container" id="popular">
	<!-- Heading -->
	<div class="heading">
		<h2 class="heading-title">Popular Laptop</h2>
		<!-- Swiper Button -->
		<div class="swiper-btn">
			<div class="swiper-button-prev1 swiper-button-prev"></div>
			<div class="swiper-button-next1 swiper-button-next"></div>
		</div>
	</div>

	<div class="popular-content swiper">
		<div class="swiper-wrapper popular-swiper-wrapper"></div>
	</div>
	</div>
</section>

<!-- Movies Section Start -->
<section class="movies container" id="movies">
	<!-- Heading -->
	<div class="heading">
		<h2 class="heading-title">Product</h2>
	</div>
	<!-- Content -->
	<div class="movies-content"></div>
</section>


<script>
//Modal
const modal = document.querySelector(".modal");
const modal_content = document.querySelector(".modal-content");
const close_modal = document.querySelector(".modal .close");
const user = document.querySelector(".user");

setTimeout(() => {
    modal.classList.add("show-modal");
}, 1000);

close_modal.addEventListener("click", () => {
    modal.classList.remove("show-modal");
});

modal.addEventListener("click", () => {
    modal.classList.remove("show-modal");
});

modal_content.addEventListener("click", (e) => {
    e.stopPropagation();
});


</script>