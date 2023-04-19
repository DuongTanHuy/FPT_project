<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Quản lý Đơn hàng</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" type="image/x-icon" href="<c:url value='/Frontend/img/logo-fox.svg'/>">
    <link rel="stylesheet"
          href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
        .form-chiTiet input {
            border: 0;
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

        .table.chiTietTable {
            color: black;
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
            top: 92px;
            color: white;
            left: 14px;
            transition: all .5s ease;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        }

        #btnDuyetSanPham {
            width: 100%;
            background: #11101d;
            color: #fff;
        }

        .pagination {
            position: absolute;
            right: 53px;
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
            background: #11101d;
            color: #fff;
        }

        .col-md-9 {
            min-width: 100% !important;
        }

        #searchForm.active {
            width: 300px;
            height: 36vh;
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

        #searchForm input {
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

        #btnDuyetDonHang {
            width: 100%;
            background: #11101d;
            color: #fff;
        }
    </style>
</head>
<body>
<jsp:include page="template/sidebar.jsp"></jsp:include>

<div class="admin_content">
    <div class="col-md-9 animated bounce">
        <h3 class="page-header form-inline" style="margin-bottom: 48px">Quản lý Đơn hàng</h3>

        <div class="form-group" style="float: right; margin-right: 65px; margin-left: auto">
            <input class="form-control" type="number" id="searchById"
                   placeholder="Nhập mã để tìm nhanh"> <span
                class="glyphicon glyphicon-search" aria-hidden="true"
                style="left: -30px; top: 4px"></span>
        </div>

        <form class="form-inline" id="searchForm" name="searchObject">
            <div id="search_header">
                <span>Filter Order</span>
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
                <select class="form-control" id="trangThai">
                    <option value="Đang chờ giao">Đang chờ giao</option>
                    <option value="Đang giao">Đang giao</option>
                    <option value="Chờ duyệt">Chờ duyệt</option>
                    <option value="Hoàn thành">Hoàn thành</option>
                    <option value="Đã bị hủy">Đã bị hủy</option>
                    <!-- <option value="">Tất cả</option> -->
                </select>
            </div>

            <div class="form-group">
                <input class="form-control" type="text" id="fromDate"
                       placeholder="Từ ngày">
            </div>

            <div class="form-group">
                <input class="form-control" type="text" id="toDate"
                       placeholder="Đến ngày">
            </div>
            &nbsp;&nbsp; &nbsp;&nbsp;
            <button type="button" class="btn btn-primary" id="btnDuyetDonHang">Duyệt
                Đơn
            </button>
        </form>

        <%--        <div style="width: 200px;height: 22px;background: #fff;position: fixed;top: 121px;z-index: 99;box-shadow: #fff 0px 8px 8px;left: 15px;">--%>
        <%--        </div>--%>

        <%--        <hr/>--%>
        <table class="table table-hover donHangTable"
               style="text-align: center">
            <thead>
            <tr style="font-size: 20px; font-weight: 600;border: none">
                <th>Mã</th>
                <th>Người nhận</th>
                <th>Trạng thái</th>
                <th>Giá trị</th>
                <th>Ngày đặt</th>
                <th>Ngày giao</th>
                <th>Ngày nhận</th>
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
        <form class="chiTietForm">
            <div class="modal fade" id="chiTietModal" tabindex="-1" role="dialog"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document"
                     style="min-width: 800px!important;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);">
                    <div class="modal-content">
                        <div class="modal-header">
                            <p class="h4 modal-title" id="maDonHang"></p>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="card" style="padding-left: 40px;padding-right: 40px">

                                        <div class="row">
                                            <div class="col-md-6">
                                                <h5 class="font-weight-bold mb-4">
                                                    <strong>Thông tin khách</strong>
                                                </h5>
                                                <p class="mb-1" id="hoTenNguoiNhan"></p>
                                                <p class="mb-1" id="diaChiNhan"></p>
                                                <p class="mb-1" id="sdtNhanHang"></p>
                                            </div>

                                            <div class="col-md-6 text-right"
                                                 style="text-align: left; padding-left: 100px">
                                                <h5 class="font-weight-bold mb-4">
                                                    <strong>Thông tin đơn hàng</strong>
                                                </h5>
                                                <p class="mb-1" id="trangThaiDonHang"></p>
                                                <p class="mb-1" id="ngayDatHang"></p>
                                                <p class="mb-1" id="ngayShipHang"></p>
                                                <p class="mb-1" id="ngayNhanHang"></p>
                                            </div>
                                        </div>
                                        <%--                                        <hr/>--%>
                                        <div class="row p-5">
                                            <div class="col-md-12">
                                                <table class="table chiTietTable"
                                                       style="text-align: center;">
                                                    <thead>
                                                    <tr>
                                                        <th
                                                                class="border-0 text-uppercase small font-weight-bold">
                                                            STT
                                                        </th>
                                                        <th
                                                                class="border-0 text-uppercase small font-weight-bold">
                                                            Tên
                                                            sản phẩm
                                                        </th>

                                                        <th
                                                                class="border-0 text-uppercase small font-weight-bold">
                                                            Đơn
                                                            giá
                                                        </th>
                                                        <th
                                                                class="border-0 text-uppercase small font-weight-bold">
                                                            Số
                                                            lượng đặt
                                                        </th>

                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>

                                        <div style="box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px; display: inline-block; border-radius: 3px;width: 143px;position: absolute;right: 152px;bottom: 115px;background: white;">
                                            <%--                                            <div class="py-3 px-5 text-right">--%>
                                            <%--                                                <div class="mb-2">--%>
                                            <p id="tongTien" style="margin: 0; padding: 6px"></p>
                                            <%--                                                </div>--%>
                                            <%--                                            </div>--%>
                                        </div>
                                        <%--                                        <hr/>--%>

                                        <div class="col-md-6">
                                            <h5 class="font-weight-bold mb-4">
                                                <strong>Thông tin khác</strong>
                                            </h5>
                                            <p class="mb-1" id="shipper"></p>
                                            <p class="mb-1" id="nguoiDat"></p>
                                            <p id="ghiChu"></p>
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
    <div class="row col-md-6">
        <form class="phanCongForm" id="form">
            <div>
                <div class="modal fade" id="phanCongModal" tabindex="-1"
                     role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Phân công
                                    đơn hàng</h5>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="hidden" id="donHangId" value="">
                                </div>
                                <div class="form-group">
                                    Chọn shipper cho đơn hàng: <select class="form-control"
                                                                       name="shipper">
                                    <c:forEach var="shipper" items="${allShipper }">
                                        <option value="${shipper.email }">${shipper.hoTen }
                                            (${fn:length(shipper.listDonHang)})
                                        </option>
                                    </c:forEach>
                                </select>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy
                                    </button>
                                    <input class="btn btn-primary" id="btnPhanCongSubmit"
                                           type="button" value="Xác nhận"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="row col-md-6">
        <form class="capNhatTrangThaiForm" id="form">
            <div>
                <div class="modal fade" id="capNhatTrangThaiModal" tabindex="-1"
                     role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog " role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Xác nhận hoàn thành đơn</h5>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="hidden" id="idDonHangXacNhan" value="">
                                </div>
                                <div class="form-group">
                                    <div class="col-md-12">
                                        <table class="table chiTietTable"
                                               style="text-align: center;">
                                            <thead>
                                            <tr>
                                                <th class="border-0 text-uppercase small font-weight-bold">STT</th>
                                                <th class="border-0 text-uppercase small font-weight-bold">Tên
                                                    sản phẩm
                                                </th>
                                                <th class="border-0 text-uppercase small font-weight-bold">Đơn
                                                    giá
                                                </th>
                                                <th class="border-0 text-uppercase small font-weight-bold">Số
                                                    lượng đặt
                                                </th>
                                                <th class="border-0 text-uppercase small font-weight-bold">Số
                                                    lượng nhận
                                                </th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            </tbody>
                                        </table>
                                        <h4 id="tongTienXacNhan"
                                            style="float: right; font-weight: bold;padding-right: 50px">abc</h4>
                                    </div>

                                    <div>
                                        <h5 id="ghiChu" style="font-weight: bold; padding-top: 10px">Ghi
                                            chú</h5>
                                        <textarea rows="3" cols="75" id="ghiChuAdmin"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy
                                    </button>
                                    <input class="btn btn-primary" id="btnXacNhan" type="button"
                                           value="Xác nhận"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <jsp:include page="template/footer.jsp"></jsp:include>
</div>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
    $(function () {

        if (${param.trangThai != null}) {
            $("#trangThai").val('${param.trangThai}');
            console.log('${param.trangThai}');
        }
        ;

        var from = $("#fromDate").datepicker({
            dateFormat: "dd-mm-yy",
            changeMonth: true
        }).on("change", function () {
            to.datepicker("option", "minDate", getDate(this));
        }), to = $("#toDate").datepicker({
            dateFormat: "dd-mm-yy",
            changeMonth: true
        }).on("change", function () {
            from.datepicker("option", "maxDate", getDate(this));
        });

        function getDate(element) {
            var date;
            var dateFormat = "dd-mm-yy";
            try {
                date = $.datepicker.parseDate(dateFormat, element.value);
            } catch (error) {
                date = null;
            }

            return date;
        }
    });
</script>
<script>
    const searchForm = document.querySelector("#searchForm");
    const closeIcon = document.querySelector("#close_icon");
    closeIcon.addEventListener("click", () => searchForm.classList.toggle("active"));
</script>
<script src="<c:url value='/js/donHangAjax.js'/>"></script>
</body>
</html>