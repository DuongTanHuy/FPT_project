<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Quản lý tài khoản</title>
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

        .pagination {
            position: absolute;
            right: 80px;
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
            top: 128px;
            color: white;
            left: 20px;
            transition: all .5s ease;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        }

        .btnThemTaiKhoan {
            background: #11101d !important;
            color: #fff;
        }
    </style>
</head>
<body>
<jsp:include page="template/sidebar.jsp"></jsp:include>

<div class="admin_content">
    <div class="col-md-9 animated bounce">
        <h3 class="page-header" style="margin-bottom: 48px">Quản lý Tài khoản</h3>

        <button style="right: 79px;top: 81px;position: absolute;" class="btn btn-success btnThemTaiKhoan">Thêm mới tài
            khoản
        </button>
        <div class="form-group form-inline">
            <label for="sel1" style="color: white"><strong>Lọc tài khoản:&nbsp;</strong> </label> <select
                id="vaiTro" class="form-control">
            <c:forEach var="vaiTro" items="${listVaiTro}">
                <option value="${vaiTro.tenVaiTro }">${vaiTro.tenVaiTro }</option>
            </c:forEach>
        </select>
        </div>

        <table class="table table-hover taiKhoanTable"
               style="text-align: center;">
            <thead>
            <tr style="font-size: 20px; font-weight: 600">
                <th>Mã ND</th>
                <th>Họ tên</th>
                <th>Email</th>
                <th>Số điện thoại</th>
                <th>Địa chỉ</th>
                <th>Vai trò</th>
                <th></th>
                <th>Hành động</th>
            </tr>

            </thead>
            <tbody>
            </tbody>

        </table>
    </div>
    <div class="row col-md-6">
        <form class="taiKhoanForm" id="form">
            <div>
                <div class="modal fade" id="taiKhoanModal" tabindex="-1"
                     role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog" role="document" style="min-width: 800px!important;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Tạo mới tài
                                    khoản</h5>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <!-- 								<div class="form-group">
                                                                    <input type="hidden" class="form-control" name="id" />
                                                                </div> -->
                                <div class="form-group">
                                    <label for="name">Email</label> <input type="email"
                                                                           class="form-control" name="email" required/>
                                </div>
                                <div class="form-group">
                                    <label for="name">Mật khẩu:(8-32 ký tự)</label> <input
                                        type="password" class="form-control" name="password" required/>
                                </div>
                                <div class="form-group">
                                    <label for="name">Nhắc lại mật khẩu:</label> <input type="password"
                                                                                        class="form-control"
                                                                                        name="confirmPassword"
                                                                                        required/>
                                </div>

                                <div class="form-group">
                                    <label for="name">Chọn vai trò:</label>
                                    <c:forEach var="vaiTro" items="${listVaiTro}">
                                        <label class="radio-inline">
                                            <input type="radio"
                                                   name="tenVaiTro" value="${vaiTro.tenVaiTro}" checked="checked">
                                                ${vaiTro.tenVaiTro}
                                        </label>
                                    </c:forEach>
                                </div>

                                <div class="form-group">
                                    <label for="name">Họ tên:</label> <input type="text"
                                                                             class="form-control" name="hoTen"
                                                                             required/>
                                </div>
                                <div class="form-group">
                                    <label for="name">Số điện thoại:</label> <input type="text"
                                                                                    class="form-control" name="sdt"
                                                                                    required/>
                                </div>
                                <div class="form-group">
                                    <label for="name">Địa chỉ:</label> <input type="text"
                                                                              class="form-control" name="diaChi"
                                                                              required/>
                                </div>


                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                            data-dismiss="modal">Hủy
                                    </button>
                                    <input class="btn btn-primary" id="btnSubmit" type="button"
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

<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery.serializeJSON/2.9.0/jquery.serializejson.js"></script>
<script src="<c:url value='/js/taiKhoanAjax.js'/>"></script>
</body>
</html>