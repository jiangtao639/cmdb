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
        Spectral similarity search
    </title>
    <link href="${pageContext.request.contextPath}/img/logo_sippe.png" rel="shortcut icon">
    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <script src="${pageContext.request.contextPath}/js/nav-bar.js"></script>
    <style>
        .SearchDesc{
            padding: 10px 10px 10px 10px;
            background-color: #f7f7f7;
            border: 1px solid #e9e9e9;
            border-radius: 5px;
        }
        div>introduction{
            line-height: 25px;
            font-size: 16px;
            font-family: Helvetica;
            color: #928c8c;
            text-align: left;
        }
        main>ul{
            display: block;
        }
        main>ul>li{
            display:inline-block;margin-right: 5px;
        }
        .normal>button{
            background:none;border: none;
            border-radius: 5px;padding: 10px 10px;
            outline: none;
        }
        .normal>button:hover{
            background: #eceaea;border: none;
            border-radius: 5px;padding: 10px 10px
        }
        .active>button{
            background: #2c7bc1;border: none;
            border-radius: 5px;padding: 10px 10px;
            outline: none;
        }
        .active>button:hover{
            background: #2c7bc1;border: none;
            border-radius: 5px;padding: 10px 10px
        }

        .active>button>a{
            color: white;
            font-size: 18px;
            font-family: Helvetica;
            text-decoration: none;
        }
        button>a:link{
            text-decoration: none;
            color: #2e6da4;
            font-size: 18px;
            font-family: Helvetica;

        }
    </style>
</head>
<body>
<%@include file="/webpages/base/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/browse.css">
<main>
    <div class="header"><h1></h1></div>

    <br>
    <ul  style="margin-left: 50px">
        <li class="normal active"><button><a href="./searchSpectralSimilarity.jsp">Spectral similarity search</a></button></li>
        <li class="normal"><button><a href="./searchMotif.jsp">motif search combined with neutral loss scanning</a></button></li>
        <li class="normal"><button><a href="./searchNetwork.jsp">network search</a></button></li>
    </ul>

    <hr/>
    <br>
    <div class="SearchDesc">
        <introduction>
            Spectral similarity search provides a powerful interface for searching the database,you can upload a file or
            paste a mass spectrum,and the result outputs similarity score, spectrum comparison chart, and basic information
            of the spectrum.The supported file and text format can refer to the example.
        </introduction>
    </div>


    <div class="form-group">
        <label for="exampleInputFile" style="font-size: 18px;margin-top: 50px">File input:</label>
        <input type="file" id="exampleInputFile" style="border: 1px solid #e9e9e9;width: 500px;border-radius: 2px ">
        <p class="help-block"><button style="background:#2e6da4;color: white;border: none;
        border-radius: 5px;padding: 0 5px 0 5px">load example</button></p>
    </div>

    <div class="form-group">
        <label for="textarea" style="font-size: 18px;margin-top: 50px">Paste a mass spectrum:</label>
        <textarea id="textarea" class="form-control" rows="5"></textarea>
        <br>
        <p class="help-block"><button type="submit" style="background:#2e6da4;color: white;border: none;
        border-radius: 5px;padding: 0 5px 0 5px">search</button></p>
    </div>
</main>