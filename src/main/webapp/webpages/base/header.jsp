<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
                        <li><a href="${pageContext.request.contextPath}/webpages/searchNetwork.jsp">network search</a></li>
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
                        <li><a href="${pageContext.request.contextPath}/browse/standardSpectrum">Standard spectrum (public databases)</a></li>
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