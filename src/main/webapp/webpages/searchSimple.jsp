<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>

    <title>
        SearchSimple
    </title>
    <link href="${pageContext.request.contextPath}/img/logo_sippe.png" rel="shortcut icon">
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <script src="${pageContext.request.contextPath}/js/nav-bar.js"></script>
    <style type="text/css">
        .header{
            display: block;
            margin: 0 50px;
            padding-top: 100px;
        }
        .header h1{
            font-size: 20px;
            font-family: Helvetica;
            color: #1a3e68;
            text-align: left;
        }
        .search-form{
            display: block;
            margin: 0 50px;
        }
        .form-group>input{
            width: 400px;
        }


    </style>
</head>
<body>

<%@include file="/webpages/base/header.jsp"%>
 
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css">--%>
<main>
    <div class="header"><h1>Search > Simple</h1></div>
    <hr/>
    <div class="search-form">
        <h1>Compounds</h1>
        <form>
            <div class="form-group">
                <input type="email" class="form-control" placeholder="Name or InChIKey">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="Molecular Formula">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="Compound ID">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="Exact Mass">
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox"> Check me out
                </label>
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
        </form>
    </div>



</main>
