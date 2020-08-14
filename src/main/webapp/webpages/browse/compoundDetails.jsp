<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

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
        compoundDetails
    </title>
    <link href="${pageContext.request.contextPath}/img/logo_sippe.png" rel="shortcut icon">
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/browse.css">
    <%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <script src="${pageContext.request.contextPath}/js/nav-bar.js"></script>
</head>
<body>

<%@include file="/webpages/base/header.jsp"%>
<main>
    <div class="header"><h1>Compound Details</h1></div>
    <hr/>
    <div class="cdBorder">
        <div class="compoundDetails">
            <h2>ID</h2>
            <hr>
            <p>SDB000001</p>
            <h2>Info</h2>
            <hr>
            <p>CID_1</p>
            <h2>Name</h2>
            <hr>
            <p>Synonyms:
            Acetyl-DL-carnitine <br>
            acetylcarnitine <br>
            DL-O-Acetylcarnitine <br>
            Acetyl carnitine <br>
            DL-Acetylcarnitine <br></p>
            <h2>Structure</h2>
            <hr>
            <p><img src="" alt="图片示例"></p>
            <h2>Formula</h2>
            <hr>
            <p>C9H17NO4</p>
            <h2>Exact Mass</h2>
            <hr>
            <p>203.1158</p>
            <h2>Smiles</h2>
            <hr>
            <p>[O-]C(=O)CC(C[N+](C)(C)C)OC(=O)C</p>
            <h2>Inchi</h2>
            <hr>
            <p>InChI=1S/C9H17NO4/c1-7(11)14-8(5-9(12)13)6-10(2,3)4/h8H,5-6H2,1-4H3</p>
            <h2>Classification</h2>
            <hr>
            <p><img src="" alt="基于ClassyFire构建的分类树"></p>
        </div>
    </div>

</main>