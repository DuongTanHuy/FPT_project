<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="icon" type="image/x-icon" href="<c:url value='/Frontend/img/logo-fox.svg'/>">
    <title>Trang Quản Trị </title>
    <style>
        .admin_content {
            position: absolute;
            left: 78px;
            top: 10%;
            transition: all .5s ease;
        }

        .sidebar.active ~ .admin_content {
            left: 240px;
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
    </style>
</head>
<body>

<jsp:include page="template/sidebar.jsp"></jsp:include>

<jsp:include page="template/content.jsp"></jsp:include>
<jsp:include page="template/footer.jsp"></jsp:include>


</body>
</html>
