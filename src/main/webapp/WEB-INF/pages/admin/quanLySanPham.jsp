<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Quản lý sản phẩm</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" type="image/x-icon" href="<c:url value='/Frontend/img/logo-fox.svg'/>">
    <style>
        .modal-open {
            overflow: scroll;
        }

        .fade:not(.show) {
            opacity: 1 !important;
        }

        .modal-backdrop {
            background: none !important;
            backdrop-filter: blur(20px) !important;
        }

        .admin_content {
            position: absolute;
            left: 78px;
            top: 10%;
            width: calc(100% - 110px);
            transition: all .5s ease;
            margin-left: 24px;
        }

        .sidebar.active ~ .admin_content {
            left: 240px;
            width: calc(100% - 270px);
        }

        .modal-header {
            background: #11101d;
            color: #fff;
        }

        .modal-header span {
            color: #fff;
        }

        .modal-dialog {
            transition: all .5s ease-in;
        }

        .modal-content {
            border: none !important;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px !important;
        }

        .modal.fade {
            transition: all .5s ease;
            transform: scale(.6);
        }

        .modal.fade.in {
            transition: all .5s ease;
            transform: scale(1);
        }

        .table {
            width: calc(100% - 64px) !important;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
            backdrop-filter: blur(30px);
            color: white;
        }

        .page-header {
            color: white;
        }

        #searchForm {
            position: fixed;
            display: inline-block;
            flex-direction: column;
            width: 200px;
            height: 40px;
            border-radius: 3px;
            z-index: 99;
            background: none;
            backdrop-filter: blur(30px);
            padding: 6px;
            overflow: hidden;
            top: 126px;
            color: white;
            left: 20px;
            transition: all .5s ease;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        }

        #searchForm.active {
            width: 300px;
            height: 40vh;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
            padding: 24px;
        }

        #searchForm #close {
            display: none;
        }

        #searchForm #open {
            display: inline-block;
        }

        #searchForm.active #open {
            display: none;
        }

        #searchForm.active #close {
            display: inline-block;
        }

        #searchForm.active ~ div {
            display: none !important;
        }

        #searchForm select {
            width: 100%;
            margin-bottom: 24px;
            border: none;
            box-shadow: none;
        }

        #search_header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 24px;
        }

        #search_header span {
            font-size: 16px;
            font-weight: 600;
        }

        #close_icon {
            width: 30px;
            height: 30px;
            border-radius: 50%;
        }

        #close_icon:hover {
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
            cursor: pointer;
        }

        #btnDuyetSanPham {
            width: 100%;
            background: #11101d;
            color: #fff;
            border: none;
        }

        .pagination {
            position: absolute;
            right: 53px;
            color: white;
        }

        .pagination li:hover {
            cursor: pointer;
            background: #ccc;
        }

        .pagination li {
            width: 30px;
            height: 30px;
            border-radius: 3px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .pagination li.active {
            background: white;
            color: #333;
        }
    </style>
</head>
<body>
<jsp:include page="template/sidebar.jsp"></jsp:include>

<div class="admin_content" style="height: 100vh">
    <div class="col-md-16 animated bounce">
        <h3 class="page-header" style="margin-left: 24px">Quản lý Sản Phẩm</h3>
        <div style="display: flex; padding: 24px;margin-bottom: 24px">
            <div class="form-group form-inline" style="">
                <label for="sel1" style="color: white">THÊM MỚI SẢN PHẨM (THEO DANH MỤC):&nbsp;</label> <select
                    id="danhMucDropdown" class="form-control">
                <c:forEach var="danhMuc" items="${listDanhMuc}">
                    <option value="${danhMuc.id }">${danhMuc.tenDanhMuc }</option>
                </c:forEach>
            </select>
            </div>
            <%--        <hr>--%>

            <div class="form-group form-inline"
                 style="float: right;margin-right: 24px;margin-left: auto">
                <input class="form-control" type="text" id="searchById"
                       placeholder="Nhập mã để tìm nhanh"> <span
                    class="glyphicon glyphicon-search" aria-hidden="true"
                    style="left: -30px; top: 4px;"></span>
            </div>
        </div>

        <form class="form-inline" id="searchForm" name="searchObject">
            <div id="search_header">
                <span>Filter Product</span>
                <div id="close_icon">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         id="close"
                         stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"/>
                    </svg>
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                         stroke="currentColor" id="open">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 9h16.5m-16.5 6.75h16.5"/>
                    </svg>
                </div>
            </div>
            <div class="form-group">
                <select class="form-control" name="danhMucId" id="danhMuc">
                    <c:forEach var="danhMuc" items="${listDanhMuc }">
                        <option value="${danhMuc.id}">${danhMuc.tenDanhMuc}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <select class="form-control" name="hangSXId" id="hangSanXuat">
                    <option value="">Tất cả hãng sản xuất</option>
                    <c:forEach var="nhanHieu" items="${listNhanHieu }">
                        <option value="${nhanHieu.id}">${nhanHieu.tenHangSanXuat}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-group">
                <select class="form-control" name="donGia" id="price">
                    <option value="">Tất cả giá</option>
                    <option value="duoi-2-trieu">Dưới 2 triệu</option>
                    <option value="2-trieu-den-4-trieu">2 triệu đến 4 triệu</option>
                    <option value="4-trieu-den-6-trieu">4 triệu - 6 triệu</option>
                    <option value="6-trieu-den-10-trieu">6 triệu - 10 triệu</option>
                    <option value="tren-10-trieu">Trên 10 triệu</option>
                </select>
            </div>

            <div class="form-group">
                <select class="form-control" name="sapXepTheoGia">
                    <option value="asc">Sắp xếp theo giá tăng dần</option>
                    <option value="desc">Sắp xếp theo giá giảm dần</option>
                </select>
            </div>

            <button type="button" class="btn btn-primary" id="btnDuyetSanPham">Duyệt
                sản phẩm
            </button>
        </form>

<%--        <div style="width: 200px;height: 30px;background: #fff;position: fixed;top: 152px;z-index: 99;box-shadow: #fff 0px 8px 8px;left: 20px;">--%>
<%--        </div>--%>

        <%--    <hr/>--%>
        <table class="table table-hover sanPhamTable"
               style="text-align: center;position: relative; right: 20px; left: 20px">
            <thead>
            <tr style="font-size: 20px;font-weight: 600">
                <th>Hình ảnh</th>
                <th>Tên Sản Phẩm</th>
                <th>Danh Mục</th>
                <th>Hãng sản xuất</th>
                <th>Đơn giá</th>
                <th>Số lượng</th>
                <th></th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>
            </tbody>

        </table>

        <ul class="pagination">
        </ul>
    </div>

    <div class="row col-md-6">
        <form id="lapTopForm" class="lapTopForm">
            <div class="modal fade lapTopModal" tabindex="-1" role="dialog"
                 data-keyboard="false" data-backdrop="static">
                <div class="modal-dialog modal-lg" role="document"
                     style="min-width: 800px!important;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Thêm mới/ Cập
                                nhật Laptop</h5>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div>
                                    <input type="hidden" class="form-control" name="danhMucId"
                                           id="idDanhMucLaptop">
                                </div>
                                <div>
                                    <input type="hidden" class="form-control" name="id"
                                           id="idSanPhamLapTop" readonly>
                                </div>
                                <div class="form-group col-md-7">
                                    <label for="inputPassword4">Tên sản phẩm</label> <input
                                        type="text" class="form-control" name="tenSanPham">
                                </div>
                                <div class="form-group col-md-5">
                                    <label for="inputPassword4">Đơn giá</label> <input
                                        type="number" class="form-control" name="donGia" min="0"
                                        value="0" id="test">
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label for="inputState">Hãng Sản Xuất</label> <select
                                        name="nhaSXId" class="form-control" id="nhaSXId">
                                    <c:forEach var="nhanHieu" items="${listNhanHieu }">
                                        <option value="${nhanHieu.id}">${nhanHieu.tenHangSanXuat}</option>
                                    </c:forEach>
                                </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputPassword4">Hệ điều hành</label> <input
                                        type="text" class="form-control" name="heDieuHanh">
                                </div>

                                <div class="form-group col-md-4">
                                    <label for="inputEmail4">Ram</label> <input type="text"
                                                                                class="form-control" name="ram"
                                                                                required="required">
                                </div>

                            </div>

                            <div class="row">

                                <div class="form-group col-md-4">
                                    <label for="inputPassword4">Màn hình</label> <input type="text"
                                                                                        class="form-control"
                                                                                        name="manHinh"
                                                                                        required="required">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputEmail4">CPU</label> <input type="text"
                                                                                class="form-control" name="cpu">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputPassword4">Thiết kế</label> <input type="text"
                                                                                        class="form-control"
                                                                                        name="thietKe"
                                                                                        required="required">
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label for="inputPassword4">Mô tả chung</label>
                                    <textarea class="form-control" name="thongTinChung"
                                              placeholder="" rows="2" required="required"></textarea>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label for="inputEmail4">Dung lượng Pin</label> <input
                                        type="text" class="form-control" name="dungLuongPin"
                                        required="required">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputEmail4">Thông tin bảo hành</label> <input
                                        type="text" class="form-control" name="thongTinBaoHanh"
                                        required="required">
                                </div>

                                <div class="form-group col-md-4">
                                    <label for="inputPassword4">Số lượng</label> <input
                                        type="number" class="form-control" name="donViKho" min="0"
                                        required="required" value="0" id="test2">
                                </div>
                            </div>
                            <div>
                                <label for="inputEmail4">Hình ảnh</label> <input type="file"
                                                                                 class="form-control" id="inputEmail4"
                                                                                 name="hinhAnh">
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">Hủy
                            </button>
                            <input class="btn btn-primary" id="btnSubmit" type="button"
                                   value="Xác nhận"/>
                        </div>

                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        </form>
    </div>

    <div class="row col-md-6">
        <form class="otherForm" id="otherForm">
            <div class="modal fade otherModal" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg" role="document"
                     style="min-width: 800px!important;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel"></h5>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div>
                                    <input type="hidden" class="form-control" name='danhMucId'
                                           id="idDanhMucKhac">
                                </div>
                                <div>
                                    <input type="hidden" class="form-control" name="id"
                                           id="idSanPhamKhac" readonly="true">
                                </div>
                                <div class="form-group col-md-12">
                                    <label for="inputPassword4">Tên sản phẩm</label> <input
                                        type="text" class="form-control" name="tenSanPham">
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="inputState">Hãng Sản Xuất</label> <select
                                        name="nhaSXId" id="nhaSXIdKhac" class="form-control">
                                    <c:forEach var="nhanHieu" items="${listNhanHieu }">
                                        <option value="${nhanHieu.id }">${nhanHieu.tenHangSanXuat}
                                        </option>
                                    </c:forEach>
                                </select>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Đơn giá</label> <input
                                        type="number" class="form-control" name="donGia" min="0"
                                        value="0" id="donGiaKhac">
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label for="inputPassword4">Mô tả chung</label>
                                    <textarea class="form-control" id="inputPassword4"
                                              placeholder="" rows="2" name="thongTinChung"></textarea>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="inputEmail4">Thông tin bảo hành</label> <input
                                        type="text" class="form-control" id="inputEmail4"
                                        name="thongTinBaoHanh">
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Số lượng</label> <input
                                        type="number" class="form-control" name="donViKho" min="0"
                                        value="0">
                                </div>
                            </div>
                            <div>
                                <label for="inputEmail4">Hình ảnh</label> <input type="file"
                                                                                 class="form-control" name="hinhAnh">
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default"
                                    data-dismiss="modal">Hủy
                            </button>
                            <button class="btn btn-primary" id="btnSubmit" type="submit">Xác
                                nhận
                            </button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
        </form>
    </div>

    <div class="row col-md-10" style="width: 60%;height: 10%">
        <form class="chiTietForm">
            <div class="modal fade" id="chiTietModal" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog " role="document"
                     style="min-width: 800px!important;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);">
                    <div class="modal-content" style="">
                        <div class="modal-header">
                            <h3 class="title" style="text-align: center; font-weight: bolder;">Chi tiết sản phẩm</h3>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="card">
                                <div class="container-fliud">
                                    <div class="wrapper row">
                                        <div class="preview col-md-6">

                                            <div class="preview-pic tab-content">
                                                <div class="tab-pane active" id="pic-1">
                                                    <img style="width: 350px; height: 350px" class="hinhAnh"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="details col-md-6" style="font-size: 16px">
                                            <p class="maSanPham"></p>
                                            <p class="tenSanPham"></p>
                                            <p class="hangSangXuat"></p>
                                            <p class="cpu"></p>
                                            <p class="ram"></p>
                                            <p class="thietKe"></p>
                                            <p class="heDieuHanh"></p>
                                            <p class="manHinh"></p>
                                            <p class="dungLuongPin"></p>
                                            <p class="thongTinChung"></p>
                                            <p class="baoHanh"></p>
                                            <p class="donGia"></p>
                                            <p class="donViKho"></p>
                                            <p class="donViBan"></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary"
                                    data-dismiss="modal">Đóng
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<jsp:include page="template/footer.jsp"></jsp:include>
</div>

<script>
    const searchForm = document.querySelector("#searchForm");
    const closeIcon = document.querySelector("#close_icon");
    closeIcon.addEventListener("click", () => searchForm.classList.toggle("active"));
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.serializeJSON/2.9.0/jquery.serializejson.js"></script>
<script src="<c:url value='/js/sanPhamAjax.js'/>"></script>
</body>
</html>