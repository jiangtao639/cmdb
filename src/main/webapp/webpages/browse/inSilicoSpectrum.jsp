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
        In silico spectrum
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
</head>
<body>
<%@include file="/webpages/base/header.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/browse.css">
<main>
    <div class="header"><h1>In silico spectrum</h1></div>
    <hr/>
    <br>
    <div class="searchbox">
        <form class="browseform" action="" accept-charset="UTF-8" method="get">
            <div>
                <label for="queryCompound">
                    <input type="text" id="queryCompound" name="query" class="input-browse" placeholder="Search Compounds"/>
                </label>
            </div>
            <div>
                <button name="button" type="submit" class="btn-browse">
                    <i class="fa fa-search" style="font-size:18px;color:#1a3e68"></i>
                </button>
            </div>
            <p class="searchtips"> Spectrum no.  Retention Time  Compound id  Exact mass  Exact mass</p>
        </form>
    </div>
    <div class="table">
        <table>
            <thead>
            <th>Spectrum no.</th>
            <th>Name</th>
            <th>Retention Time</th>
            <th>Compound id</th>
            <th>Exact mass</th>
            <th>Precursor type</th>
            <th>Ion mode</th>
            </thead>
            <tbody>
            <tr>
                <td><a href="">000001</a></td>
                <td>4-Acetamidobutyric acid</td>
                <td><a href="">???</a></td>
                <td>SDB000001</td>
                <td>203.1158</td>
                <td>[M+H]+</td>
                <td>P</td>
            </tr>
            </tbody>
        </table>
    </div>
    <p style="text-align:left;font-size: 18px;margin-left: 500px">
        Spectrum no.：谱图的编号，CMISS* (CropsMeta In Silico Spectrum)，设置超链接，链接到谱图详情页。<br>
        Compound id：对应化合物的编号。设置超链接，链接到化合物详情页。<br>
        谱图详情页：<br>
        Spectrum no.：<br>
        Name：<br>
        Compound id：<br>
        SMILES：<br>
        Exact Mass：<br>
        Precursor MZ：<br>
        Precursor type：<br>
        Ion Mode：<br>
        Spectra Type：<br>
        Probability Threshold	：<br>
        10 V 谱图（可视化）<br>
        20 V 谱图（可视化）<br>
        40 V 谱图（可视化）<br>
        Peak Table<br>
        Fragment Structures （包括Structure，ID，Mass，SMILES）<br>
        <br><br><br>

    </p>
</main>