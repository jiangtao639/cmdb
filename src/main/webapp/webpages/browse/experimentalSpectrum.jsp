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
        Experimental Spectrum (crops)
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
    <div class="header"><h1>Experimental Spectrum (crops)</h1></div>
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
            <p class="searchtips"> Spectrum no.  Retention Time  Precursor MZ</p>
        </form>
    </div>
    <div class="table">
        <table>
            <thead>
            <th>Spectrum no.</th>
            <th>Retention Time</th>
            <th>Precursor MZ</th>
            <th>Precursor type</th>
            <th>Ion mode</th>
            <th>Putative annotation</th>
            <th>Putative classification</th>
            <th>Identification level</th>
            <th>Crops</th>
            </thead>
            <tbody>
            <tr>
                <td><a href="./compoundDetails.action">000001</a></td>
                <td><a href="">???</a></td>
                <td>146.081</td>
                <td>[M+H]+</td>
                <td>P</td>
                <td>排序第一的候选注释的ID和名字，设置超链接，链接到化合物详情页。</td>
                <td>排序第一的候选注释的分类。</td>
                <td>InChI=1S/C9H17NO4/c1-7(11)14-8(5-9(12)13)6-10(2,3)4/h8H,5-6H2,1-4H3</td>
                <td>来源物种</td>
            </tr>
            </tbody>
        </table>
    </div>
    <h1 style="text-align: center;font-size: 18px;margin-top: 100px">实验谱图:</h1>
    <p style="text-align: center;font-size: 18px"> 数据来源----->水稻，玉米，小麦，大豆，甘薯，木薯，代表品种的混合样本，每个样本10个技术重复。</p>
    <p style="text-align: center;font-size: 18px"><a href="" style="text-align: center;font-size: 18px">Spectrum .no</a>：谱图编号，CMMS*（CropsMeta Experimental Spectrum），设置超链接，链到<strong style="text-align: center;font-size: 18px">谱图详情页</strong>。</p>
    <p style="text-align:left;font-size: 18px;margin-left: 500px">
        谱图详情页：<br>
        Mass Spectrum：谱图可视化。<br>
        Peak table：列出peak的mz以及intensity。<br>
        Annotation information：注释到的化合物list，打分，谱图对应，化合物设置超链接，链接到化合物页面。需要注明可能的分类，Identification level。<br>
        Crops：该谱图来源的作物。是特异的，还是在其他作物中有相似的谱图（相似的RT以及mass spectrum）<br>
        Mass spectral information：<br>
        Spectrum no.：<br>
        Retention Time：<br>
        Precursor MZ：<br>
        Precursor type：<br>
        Collision energy：<br>
        Ionization:<br>
        Ion mode：<br>
        Column：柱子型号<br>
        Exact mass：<br>
        Flow gradient：液相程序。<br>
        Flow rate：洗脱速度。<br>
        Fragmentation mode：碎裂模式。<br>
        Instrument：<br>
        Instrument type：<br>
        <br>
        <br>
        <br>

    </p>
</main>




</body>
</html>


