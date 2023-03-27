<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <link rel='stylesheet' href='http://cdnjs.cloudflare.com/ajax/libs/animate.css/3.2.3/animate.min.css'>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <link rel="stylesheet" href="<c:url value='/css/admin.css' />"/>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
    .conteudo {
      background: #11101d;
      width: 100%;
      height: 78px;
      position: relative;
      z-index: 999;
    }

    @keyframes coresDancantes {
      100% {
        filter: hue-rotate(360deg);
      }
    }

    .conteudo .caixa {
      z-index: 1;
      width: 100%;
      height: 78px;
    }

    .caixa span a {
      font-size: 25px;
      color: white;
    }

    .conteudo .caixa .header:hover {
      text-decoration: none;
      animation: coresDancantes 2s linear infinite;
      color: red;
    }
  </style>
</head>

<body>
<div class="conteudo">
  <div class="caixa" style="display: flex; align-items: center; padding-left: 24px; font-weight: 600;box-shadow: rgba(0, 0, 0, 0.15) 1.95px 1.95px 2.6px;">
    <span><a class="header" href="<c:url value='/admin'/>">Laptop Shop - Trang Quản Trị</a></span>
  </div>
</div>
</body>