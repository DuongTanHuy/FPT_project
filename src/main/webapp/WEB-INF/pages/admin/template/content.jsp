<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<head>
    <style>
        .admin_content {
            color: white;
            font-size: 20px;
        }

        .content {
            display: inline-block;
            /* background: white; */
            /* color: black; */
            padding: 36px;
            border-radius: 6px;
            box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;
            backdrop-filter: blur(30px);
        }
    </style>
</head>

<div class="admin_content" style="margin-left: 24px">
    <h3 style="margin-bottom: 48px">Danh sách công việc</h3>
    <div class="content">
        <c:if test="${listCongViec.soDonHangMoi >= 0}">
            <p>Bạn có: <a href='<c:url value="/admin/don-hang" />'> ${listCongViec.soDonHangMoi} đơn hàng mới</a>
            </p>
        </c:if>

        <c:if test="${listCongViec.soDonhangChoDuyet >= 0}">
            <p>Bạn có: <a href='<c:url value="/admin/don-hang" />'> ${listCongViec.soDonhangChoDuyet} đơn hàng chờ duyệt</a>
            </p>
        </c:if>

        <c:if test="${listCongViec.soLienHeMoi >= 0}">
            <p>Bạn có: <a href='<c:url value="/admin/lien-he" />'> ${listCongViec.soLienHeMoi} liên hệ mới</a>
            </p>
        </c:if>
    </div>
</div>
</div>