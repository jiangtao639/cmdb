<%@ page language="java" contentType = "text/html;charset=utf-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Crops Metabolomics Database</title>


    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/footer.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">

    <script>
        window.onload = function () {
            var dm_search = document.getElementById("dropdown-toggle-user");
            var dm_browse= document.getElementById("dropdown-toggle1-user");
            dm_search.onclick = function () {
                dm_search.style.backgroundColor = "#306f0d";
            }
            dm_browse.onclick = function () {
                dm_browse.style.backgroundColor="#306f0d";
            }
        }
    </script>
</head>

<body>
<nav class="navbar navbar-default navbar-user">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" id="navbar-brand-user" href="${pageContext.request.contextPath}/">CropsMetaDB</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="dropdown" id="dropdown-user">
                    <a href="#" class="dropdown-toggle" id="dropdown-toggle-user" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Search <span class="caret"></span></a>
                    <ul class="dropdown-menu" id="menu1-user">
                        <li><a href="${pageContext.request.contextPath}/webpages/searchSimple.jsp">Simple</a></li>
                        <li><a href="${pageContext.request.contextPath}/webpages/searchSpectralSimilarity.jsp">Spectral similarity search</a></li>
                        <li><a href="${pageContext.request.contextPath}/webpages/searchMotif.jsp">motif search combined with neutral loss scanning</a></li>
                        <li><a href="${pageContext.request.contextPath}/webpages/spectralSimilaritySearch.jsp">network search</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">One more separated link</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" id="dropdown-toggle1-user" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Browse <span class="caret"></span></a>
                    <ul class="dropdown-menu" id="menu2-user">
                        <li><a href="${pageContext.request.contextPath}/browse/referCompound">Reference compound</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="">Spectrum<span class="caret"/></a></li>
                        <li><a href="${pageContext.request.contextPath}/webpages/browse/experimentalSpectrum.jsp">Experimental Spectrum (crops)</a></li>
                        <li><a href="${pageContext.request.contextPath}/webpages/browse/standardSpectrum.jsp">Standard spectrum (public databases)</a></li>
                        <li><a href="${pageContext.request.contextPath}/webpages/browse/inSilicoSpectrum.jsp">In silico spectrum</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/webpages/browse/browseMotifsAndModifications.jsp">Motifs and modifications</a></li>
                    </ul>
                </li>
                <li><a href="#" id="single1-user">Statistics<i class="fa fa-bar-chart"></i></a></li>
                <li><a href="#" id="single2-user">Download<i class="fa fa-cloud-download"></i></a></li>
                <li><a href="#" id="single3-user">Tools<i class="fa fa-briefcase"></i></a></li>
                <li><a href="#" id="single4-user">About</a></li>
            </ul>
            <div>
            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default" style="background-color:#f6df03;outline: none;height: 34px"><i class="fa fa-search" style="font-size:14px;color:#1a3e68"></i></button>
            </form>
            </div>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!--==================================================================================================================-->
<main>
    <div class="logo">
        <img src="../../img/logo.png" alt="" width="100%"/>
    </div>
    <div class="jumbotron introduction" style="margin-top: 50px;padding: 10px 50px">
        <h1>Welcome to Crops Metabolomics Database!</h1>
        <p>            Crops Metabolomics Database is a rsepository of plant secondary metabolites and tandem mass spectrometry data for crops, including rice, corn, soy bean, and wheat among others. We compared and analyzed some public databases (mainly from KEGG, MetaCyc, PlantCyc) and integrated their data. There are currently 2844 plant secondary metabolites in our database. Their chemical formula, molecular weight, structure, involved biological processes, and links to outside resources are available on the website, where researchers can search, visualize, and download metabolomics data. MS/MS data are also available on many of the metabolites. In addition to the MS/MS data from our own studies, some of the metabolites also have MS/MS data from other public databases such as MassBank and METLIN. We are in the process of developing our own searching and visualizing tools. Users can search by compound chemical information (name, molecular weight), by experiment source, or by peaks and by spectrum of MS/MS data. Users can also browse their own spectra on our visualizing tool and analyze them. In the future, we will provide an interface for users to submit their metabolomics data.
        </p>
        <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
    </div>

<%--    <div class="introduction">--%>
<%--        <h1>Welcome to Crops Metabolomics Database!</h1>--%>
<%--        <br/>--%>
<%--        <p>--%>
<%--            Crops Metabolomics Database is a rsepository of plant secondary metabolites and tandem mass spectrometry data for crops, including rice, corn, soy bean, and wheat among others. We compared and analyzed some public databases (mainly from KEGG, MetaCyc, PlantCyc) and integrated their data. There are currently 2844 plant secondary metabolites in our database. Their chemical formula, molecular weight, structure, involved biological processes, and links to outside resources are available on the website, where researchers can search, visualize, and download metabolomics data. MS/MS data are also available on many of the metabolites. In addition to the MS/MS data from our own studies, some of the metabolites also have MS/MS data from other public databases such as MassBank and METLIN. We are in the process of developing our own searching and visualizing tools. Users can search by compound chemical information (name, molecular weight), by experiment source, or by peaks and by spectrum of MS/MS data. Users can also browse their own spectra on our visualizing tool and analyze them. In the future, we will provide an interface for users to submit their metabolomics data.--%>
<%--        </p>--%>
<%--        <br/>--%>
<%--    </div>--%>
    <div class="news">
        <h2>News&Update</h2><br/>
        <p>待放入的内容........................</p>
        <br/>
        <br/>
        <br/>
    </div>
    <div class="publication"><p>
        Publications:<br/>1.Pan, B., Sheng, J., Sun, W., Zhao, Y., Hao, P. and Li, X. OrysPSSP: a comparative Platform for Small Secreted Proteins from rice and other plants. Nucleic acids research. Jan;41 (2013) (Database issue):D1192-1198 <a href="#">Download(PDF)</a>.</p>
    </div>
    <br/>
</main>
<!--==================================================================================================================-->
<!--==================================================================================================================-->
<footer>
    <div class="footer">
        <div class="description">Copyright©2013-2020  Team of Bioinformatic Core, CAS Center for Excellence in  Molecular Plant Sciences / Institute of Plant Physiology and Ecology.
            <br/>
            200032 Fenglin Road 300, Shanghai, China -Tel +21-5492-4305, Fax 86-21-54924015
            <br/>
            Email: Lixuan@sibs.ac.cn
            <br/>
        </div>

        <div class="logos">

            <div><a target="_blank" href="http://www.cemps.cas.cn"><img
                    src="${pageContext.request.contextPath}/img/logo_sippe.png"
                    alt="sippe" width="40" height="40"/></a>
            </div>
            <div><a target="_blank" href="http://www.cas.cn"><img
                    src="${pageContext.request.contextPath}/img/logo_cas.png"
                    alt="cas"/></a>
            </div>
            <div><a target="_blank" href="http://www.shb.cas.cn"><img
                    src="${pageContext.request.contextPath}/img/logo_cst.png"
                    alt="cst"/></a>
            </div>
        </div>
        <div class="end">CropsMetaDB Version 1.0 &mdash; <a href="#">Contact Us</a>
        </div>
    </div>
</footer>
</body>
</html>