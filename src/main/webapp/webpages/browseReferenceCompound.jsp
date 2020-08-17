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
        browseReferCompound
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <script src="${pageContext.request.contextPath}/js/nav-bar.js"></script>
    <style type="text/css">
        th {
            text-align: center;
        }
    </style>
</head>
<body>

<%@include file="/webpages/base/header.jsp"%>

<main>
    <div class="header"><h1>Browse Reference Compound</h1></div>
    <hr/>
    <br>
    <div class="container" style="margin-left: 10px">
        <div style="float: left;margin-bottom: 20px">
            <form class="form-inline" action="${pageContext.request.contextPath}/browse/referCompound" method="post">
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" name="Name" value="${rc.name}" class="form-control" id="name">
                </div>
                <div class="form-group">
                    <label for="Inchi">Inchi</label>
                    <input type="text" name="Inchi" value="${rc.inchi}" class="form-control" id="Inchi">
                </div>
                <div class="form-group">
                    <label for="Formula">Formula</label>
                    <input type="text" name="Formula" value="${rc.formula}" class="form-control" id="Formula">
                </div>

                <button type="submit" class="btn btn-default">Query</button>
            </form>
        </div>
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <%--            <th><input type="checkbox"></th>--%>
                <th>count</th>
                <th>ID</th>
                <th>Info</th>
                <th>Name</th>
                <th>Structure</th>
                <th>Formula</th>
                <th>ExactMass</th>
                <th>Smiles</th>
                <th>Inchi</th>
                <th>Classification</th>
            </tr>

            <c:forEach items="${pb.list}" var="rfc" varStatus="s">
                <tr>
                        <%--            <td><input type="checkbox"></td>--%>
                    <td>${s.count}</td>
                    <td><a href="${pageContext.request.contextPath}/webpages/browse/compoundDetails.jsp">${rfc.ID}</a></td>
                    <td><a href="https://pubchem.ncbi.nlm.nih.gov/compound/${rfc.info.split(";",2)[0].split("_",2)[1]}">${rfc.info}</a></td>
                    <td>${rfc.name}</td>
                    <td><img src="" alt="structure"></td>
                    <td>${rfc.formula}</td>
                    <td>${rfc.exactMass}</td>
                    <td>${rfc.smiles}</td>
                    <td>${rfc.inchi}</td>
                    <td>${rfc.classification}</td>
                </tr>
            </c:forEach>
        </table>

        <div>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="${pageContext.request.contextPath}/browse/referCompound?currentPage=1&rows=50&Name=${rc.name}&Inchi=${rc.inchi}&Formula=${rc.formula}"
                           aria-label="First">
                            <span aria-hidden="true">First</span>
                        </a>
                    </li>
                    <c:if test="${pb.currentPage == 1}">
                    <li class="disabled">
                            <span aria-hidden="true">&laquo;</span>
                    </li>
                    </c:if>

                    <c:if test="${pb.currentPage != 1}">
                    <li>
                        <a href="${pageContext.request.contextPath}/browse/referCompound?currentPage=${pb.currentPage-1}&rows=50&Name=${rc.name}&Inchi=${rc.inchi}&Formula=${rc.formula}"
                           aria-label="Previous">
                            <span aria-hidden="true" id="Previous">&laquo;</span>
                        </a>
                    </li>
                    </c:if>
                    <%--分页功能优化--%>
                    <c:choose>
                        <c:when test="${pb.totalPage <= 10}">
                            <c:set var="begin" value="1"/>
                            <c:set var="end" value="${pb.totalPage}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="begin" value="${pb.currentPage - 1}"/>
                            <c:set var="end" value="${pb.currentPage + 8}"/>
                            <c:if test="${begin -1 <= 0}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="10"/>
                            </c:if>
                            <c:if test="${end > pb.totalPage}">
                            <c:set var="begin" value="${pb.totalPage - 9}"/>
                            <c:set var="end" value="${pb.totalPage}"/>
                            </c:if>
                        </c:otherwise>
                    </c:choose>


                    <c:forEach begin="${begin}" end="${end}" var="i">
                        <c:if test="${pb.currentPage == i}">
                            <li class="active"><a
                                    href="${pageContext.request.contextPath}/browse/referCompound?currentPage=${i}&rows=50&Name=${rc.name}&Inchi=${rc.inchi}&Formula=${rc.formula}">${i}</a>
                            </li>
                        </c:if>

                        <c:if test="${pb.currentPage != i}">
                            <li>
                                <a href="${pageContext.request.contextPath}/browse/referCompound?currentPage=${i}&rows=50&Name=${rc.name}&Inchi=${rc.inchi}&Formula=${rc.formula}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${pb.currentPage == pb.totalPage}">
                    <li class="disabled">
                            <span aria-hidden="true">&raquo;</span>
                    </li>
                    </c:if>

                    <c:if test="${pb.currentPage != pb.totalPage}">
                    <li>
                        <a href="${pageContext.request.contextPath}/browse/referCompound?currentPage=${pb.currentPage+1}&rows=50&Name=${rc.name}&Inchi=${rc.inchi}&Formula=${rc.formula}"
                           aria-label="Next">
                            <span aria-hidden="true" id="Next">&raquo;</span>
                        </a>
                    </li>
                    </c:if>
                    <li>
                        <a href="${pageContext.request.contextPath}/browse/referCompound?currentPage=${pb.totalPage}&rows=50&Name=${rc.name}&Inchi=${rc.inchi}&Formula=${rc.formula}"
                           aria-label="Last">
                            <span aria-hidden="true">Last</span>
                        </a>
                    </li>
                    <span style="font-size: 18px;margin-left: 5px;line-height: 32px">${pb.totalCount} records found, ${pb.totalPage} pages in total.</span>
                </ul>
            </nav>
        </div>
    </div>
</main>

<%--<%@include file="/webpages/base/footer.jsp"%>--%>

</body>
</html>

 

