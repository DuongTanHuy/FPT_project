<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Quản lý danh mục</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" type="image/x-icon" href="<c:url value='/Frontend/img/logo-fox.svg'/>">
</head>
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

    .btnThemDanhMuc {
        background: #11101d !important;
        color: #fff;
    }
</style>
<body>
<jsp:include page="template/sidebar.jsp"></jsp:include>

<div class="admin_content">
    <div class="col-md-9 animated bounce">
        <h3 class="page-header" style="margin-bottom: 48px">Quản lý Danh Mục</h3>

        <button style="right: 79px;top: 36px;position: absolute;" class="btn btn-success btnThemDanhMuc">Thêm mới danh
            mục
        </button>

        <table class="table table-hover danhMucTable" style="text-align: center">
            <thead>
            <tr style="font-size: 20px; font-weight: 600">
                <th>Mã danh mục</th>
                <th>Tên Danh mục</th>
                <th>Hàng động</th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>

        <ul class="pagination">
        </ul>
    </div>
    <div class="row col-md-6">
        <form class="danhMucForm" id="form">
            <div>
                <div class="modal fade" id="danhMucModal" tabindex="-1"
                     role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog" role="document"
                         style="min-width: 800px!important;position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Tạo mới/Cập nhật danh mục</h5>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="id">ID:</label> <input type="text" class="form-control" id="id"/>
                                </div>
                                <div class="form-group">
                                    <label for="name">Tên danh mục:</label> <input type="text" class="form-control"
                                                                                   id="tenDanhMuc"
                                                                                   placeholder="Nhập vào tên danh mục"
                                                                                   required/>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                                    <input class="btn btn-primary" id="btnSubmit" type="button" value="Xác nhận"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>


<jsp:include page="template/footer.jsp"></jsp:include>
</div>
<script src="<c:url value='/js/danhMucAjax.js'/>"></script>
</body>
</html>