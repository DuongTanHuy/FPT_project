<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$(".total-price").each(function() {
			var value = accounting.formatMoney($(this).text()) + ' VND';
			console.log(value)
			$(this).html(value);
		});

	});
</script>
</head>



<body>
	<div class="container account">
		<div class="heading-account">
			<p>Personal Information</p>
		</div>
		<!-- Tab items -->
		<div class="tabs">
			<div class="tab-item active">
				<i class="tab-icon fas fa-code"></i> Account Information
			</div>
			<div class="tab-item">
				<i class="tab-icon fas fa-cog"></i> Change account information
			</div>
			<div class="tab-item">
				<i class="tab-icon fas fa-plus-circle"></i> View history order
			</div>
			<div class="line"></div>
		</div>

		<!-- Tab content -->
		<div class="tab-content">
			<div class="tab-pane active">
				<h2>Information</h2>
				<div class="tab-info-user">
					<p class="user-name">Name: ${user.getHoTen()}</p>
					<p class="user-phone">Phone: ${user.getSoDienThoai()}</p>
					<p class="user-email">Email: ${user.getEmail()}</p>
					<p class="user-address">Address: ${user.getDiaChi()}</p>
				</div>
			</div>
			<div class="tab-pane">
				<h2>Account</h2>
				<div class="group_change">
					<div class="change-item-left">
						<p class="change-title">Update Account</p>
						<div class="form-change">
							<div class="group-input-change">
								<label for="name" class="label-change">User Name</label> <label
									id="nameWarning" style="color: red"></label> <input type="text"
									class="input-change" id="name" placeholder="Name" name="name"
									type="text" value=${user.getHoTen() } />
							</div>
							<div class="group-input-change">
								<label for="phone" class="label-change">Phone</label> <label
									id="phoneWarning" style="color: red"></label> <input
									type="text" class="input-change" id="phone" placeholder="Phone"
									name="phone" value=${user.getSoDienThoai() } />
							</div>
							<div class="group-input-change">
								<label for="user-address" class="label-change">Address</label> <label
									id="addressWarning" style="color: red"></label>
								<textarea rows="3" cols="1" class="form-control" id="address">${user.getDiaChi()}</textarea>
							</div>

							<button type="submit" class="btn-update"
								onclick="changeInformation()">Update Account</button>
						</div>
					</div>
					<div class="change-item-right">
						<p class="change-title">Update Password</p>
						<form action="" class="form-change">
							<div class="group-input-change">
								<label for="user-password" class="label-change">Password</label>
								<input type="text" class="input-change" id="user-password"
									placeholder="Password" />
							</div>
							<div class="group-input-change">
								<label for="user-new-password" class="label-change">New
									password</label> <input type="text" class="input-change"
									id="user-new-password" placeholder="New Password" />
							</div>
							<div class="group-input-change">
								<label for="user-repeat-password" class="label-change">Repeat
									new password</label> <input type="text" class="input-change"
									id="user-repeat-password" placeholder="Repeat new password" />
							</div>

							<button type="submit" class="btn-update">Update Password
							</button>
						</form>
					</div>
				</div>
			</div>
			<div class="tab-pane">
				<h2>History</h2>
				<div class="group-order">
					<div class="order-item">
						<div class="column-1 column">
							<p>Code orders</p>
						</div>
						<div class="column-2 column">
							<p>Purchase date</p>
						</div>
						<div class="column-3 column">
							<p>Delivery date</p>
						</div>
						<div class="column-3 column">
							<p>Date of receipt of goods</p>
						</div>
						<div class="column-4 column">
							<p>Products</p>
						</div>
						<div class="column-5 column">
							<p>Total price</p>
						</div>
						<div class="column-6 column">
							<p>Status</p>
						</div>
					</div>
					<c:forEach var="donHang" items="${list}" varStatus="loop">
						<div class="order-item">
							<div class="column-1 column">
								<p>${donHang.id}</p>
							</div>
							<div class="column-2 column">
								<p>${donHang.ngayDatHang}</p>
							</div>
							<div class="column-3 column">
								<p>${donHang.ngayGiaoHang}</p>
							</div>
							<div class="column-3 column">
								<p>${donHang.ngayNhanHang}</p>
							</div>
							<div class="column-4 column">
								<c:forEach var="chiTiet" items="${donHang.danhSachChiTiet}">
									<div class="product-order">
										<p class="product-name">
											<a href='<c:url value="/sp?id=${chiTiet.sanPham.id}" />'>${chiTiet.sanPham.tenSanPham}</a>
										</p>
										<c:choose>
											<c:when
												test='${(donHang.trangThaiDonHang == "Đang chờ giao") || (donHang.trangThaiDonHang =="Đang giao")  }'>

												<span>X ${chiTiet.soLuongDat }</span>
												<c:set var="tongGiaTri"
													value="${tongGiaTri + chiTiet.soLuongDat*chiTiet.donGia}" />
											</c:when>
											<c:otherwise>
												<span>X ${chiTiet.soLuongNhanHang }</span>
												<c:set var="tongGiaTri"
													value="${tongGiaTri + chiTiet.soLuongNhanHang*chiTiet.donGia}" />
											</c:otherwise>
										</c:choose>
									</div>
								</c:forEach>
							</div>
							<div class="column-5 column total-price">
								<p>${tongGiaTri}</p>
							</div>
							<div class="column-6 column">
								<p>${donHang.trangThaiDonHang}</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<script src="<c:url value='/js/client/information.js'/>"></script>
	<script src="<c:url value='/js/client/password.js'/>"></script>
</body>
</html>