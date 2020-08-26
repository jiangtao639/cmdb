<%@ page import="java.awt.*" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="org.openscience.cdk.smiles.SmilesParser" %>
<%@ page import="org.openscience.cdk.silent.SilentChemObjectBuilder" %>
<%@ page import="org.openscience.cdk.interfaces.IAtomContainer" %>
<%@ page import="org.openscience.cdk.layout.StructureDiagramGenerator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.openscience.cdk.renderer.generators.BasicSceneGenerator" %>
<%@ page import="org.openscience.cdk.renderer.generators.BasicBondGenerator" %>
<%@ page import="org.openscience.cdk.renderer.generators.BasicAtomGenerator" %>
<%@ page import="org.openscience.cdk.renderer.AtomContainerRenderer" %>
<%@ page import="org.openscience.cdk.renderer.font.AWTFontManager" %>
<%@ page import="org.openscience.cdk.renderer.RendererModel" %>
<%@ page import="org.openscience.cdk.renderer.visitor.AWTDrawVisitor" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="java.awt.image.RenderedImage" %>
<%@ page import="cn.jt.entity.ReferCompound" %>
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
    <div class="header"><h1>${cpd.name}</h1></div>
    <hr/>
    <div class="cdBorder">
        <div class="compoundDetails">
            <h2>ID</h2>
            <hr>
            <p>${cpd.ID}</p>
            <h2>Info</h2>
            <hr>
            <p>${cpd.info}</p>
            <h2>Name</h2>
            <hr>
            <p>${cpd.name}</p>
            <h2>Structure</h2>
            <hr>
            <p><%
                    request.setCharacterEncoding("UTF8");
                    response.setContentType("image/png");
                    ReferCompound cpd = (ReferCompound) request.getAttribute("cpd");
                    String smiles = cpd.getSmiles();
                    int WIDTH = 1600;
                    int HEIGHT = 1000;
                    Rectangle drawArea = new Rectangle(WIDTH, HEIGHT);
                    Image image = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
                    SmilesParser smilesParser = new SmilesParser(SilentChemObjectBuilder.getInstance());
                    IAtomContainer molecule = smilesParser.parseSmiles(smiles);
                    StructureDiagramGenerator sdg = new StructureDiagramGenerator();
                    sdg.setMolecule(molecule);
                    sdg.generateCoordinates();
                    molecule = sdg.getMolecule();
                    ArrayList generators = new ArrayList();
                    generators.add(new BasicSceneGenerator());
                    generators.add(new BasicBondGenerator());
                    generators.add(new BasicAtomGenerator());
                    AtomContainerRenderer renderer =
                            new AtomContainerRenderer(
                                    generators, new AWTFontManager()
                            );
                    renderer.setup(molecule, drawArea);
                    RendererModel model = renderer.getRenderer2DModel();
                    model.set(BasicSceneGenerator.ZoomFactor.class, (double)0.9);
                    Graphics2D g2 = (Graphics2D)image.getGraphics();
                    g2.setColor(Color.WHITE);
                    g2.fillRect(0, 0, WIDTH, HEIGHT);
                    renderer.paint(molecule, new AWTDrawVisitor(g2));
                ServletOutputStream o = response.getOutputStream();
                ImageIO.write(
                            (RenderedImage)image, "PNG",o
                    );
                o.flush();
                o.close();
                o = null ;
                response.flushBuffer();
                out.clear();
                out = pageContext.pushBody();
            %></p>

            <h2>Formula</h2>
            <hr>
            <p>${cpd.formula}</p>
            <h2>Exact Mass</h2>
            <hr>
            <p>${cpd.exactMass}</p>
            <h2>Smiles</h2>
            <hr>
            <p>${cpd.smiles}</p>
            <h2>Inchi</h2>
            <hr>
            <p>${cpd.inchi}</p>
            <h2>Classification</h2>
            <hr>
            <p><img src="" alt="基于ClassyFire构建的分类树"></p>
        </div>
    </div>

</main>