<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Quản lý Liên hệ</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet"
          href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="icon" type="image/x-icon" href="<c:url value='/Frontend/img/logo-fox.svg'/>">
    <style>
        td, #noiDungLienHe, .noiDungLienHe, #noiDungTraLoi {
            word-wrap: break-word;
        }

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
            top: 92px;
            color: white;
            left: 14px;
            transition: all .5s ease;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
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
            width: 100% !important;
            margin-bottom: 24px;
            border: none;
            box-shadow: none;
        }

        .form-group {
            width: 100% !important;
        }

        #searchForm input {
            width: 100% !important;
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

        #btnDuyetLienHe {
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
    </style>
</head>
<body>
<jsp:include page="template/sidebar.jsp"></jsp:include>

<div class="admin_content">
    <div class="col-md-9 animated bounce">
        <h3 class="page-header" style="margin-bottom: 48px">Quản lý Liên hệ</h3>

        <div id="searchForm">
            <div id="search_header">
                <span>Filter Contact</span>
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

            <div class="form-group form-inline">
                <div class="form-group">
                    <select class="form-control trangThai">
                        <option value="Đang chờ trả lời">Đang chờ trả lời</option>
                        <option value="Đã trả lời">Đã trả lời</option>
                        <option value="">Tất cả</option>
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
                <button type="button" class="btn btn-primary" id="btnDuyetLienHe">Duyệt
                    Liên Hệ
                </button>
            </div>
        </div>

<%--        <div style="width: 200px;height: 22px;background: #fff;position: fixed;top: 121px;z-index: 99;box-shadow: #fff 0px 8px 8px;left: 15px;">--%>
<%--        </div>--%>

        <table class="table table-hover lienHeTable"
               style="text-align: center;top: 51px;position: relative;">
            <thead>
            <tr style="font-size: 20px;font-weight: 600">
                <th>Mã</th>
                <th>Email</th>
                <th>Ngày gửi</th>
                <th>Trạng thái</th>
                <th>Ngày trả lời</th>
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
        <form class="chiTietForm" id="form">
            <div>
                <div class="modal fade" id="chiTietModal" tabindex="-1"
                     role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog" role="document"
                         style="min-width: 800px!important;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Thông tin
                                    liên hệ</h5>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <p id="email"></p>
                                    <br>
                                    <p id="noiDungLienHe"></p>
                                    <br>
                                    <p id="ngayLienHe"></p>
                                    <br>
                                    <p id="trangThai"></p>
                                    <br>
                                    <p id="noiDungTraLoi"></p>
                                    <br>
                                    <p id="ngayTraLoi"></p>
                                    <br>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Đóng
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div class="row col-md-6">
        <form class="lienHeForm" id="form">
            <div>
                <div class="modal fade" id="lienHeModal" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalLabel" aria-hidden="true"
                     data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog" role="document"
                         style="min-width: 800px!important;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Trả lời liên hệ </h5>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <input type="hidden" name="lienHeId" class="form-control"/>
                                </div>
                                <div class="form-group">
                                    <label for="name">Email liên hệ:</label> <input type="text"
                                                                                    name="emailLienHe" id="emailLienHe"
                                                                                    style="border: 0"
                                                                                    readonly="readonly"/>
                                </div>

                                <div class="form-group">
                                    <label for="name">Nội dung liên hệ:</label>
                                    <textarea class="form-control" name="noiDungLienHe"
                                              id="ndLienHe" style="border: 0; background-color: #fff"
                                              rows="3" readonly="readonly"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="noiDungTraLoi">Nội dung trả lời</label>
                                    <textarea class="form-control" name="noiDungTraLoi"
                                              id="ndTraLoi" rows="5"></textarea>

                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary"
                                        data-dismiss="modal">Đóng
                                </button>
                                <input type="button" class="btn btn-primary btnSubmitTraLoi"
                                       value="Xác nhận">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <jsp:include page="template/footer.jsp"></jsp:include>
</div>

<script type="text/javascript">
    $(function () {
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
    const searchForm = document.querySelector("#searchForm");
    const closeIcon = document.querySelector("#close_icon");
    closeIcon.addEventListener("click", () => searchForm.classList.toggle("active"));
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery.serializeJSON/2.9.0/jquery.serializejson.js"></script>
<script src="<c:url value='/js/lienHeAjax.js'/>"></script>
</body>
</html>