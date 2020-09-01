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
    <style>
        .over {
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            z-index: 100;
        }

        .tempContainer {
            position: fixed;
            width: 100%;
            margin-right: 0px;
            margin-left: 0px;
            text-align: center;
            z-index: 101;
        }

        .demo-container {
            box-sizing: border-box;
            width: 850px;
            height: 450px;
            padding: 20px 15px 15px 15px;
            margin: 15px auto 30px auto;
            border: 1px solid #ddd;
            background: #fff;
            background: linear-gradient(#f6f6f6 0, #fff 50px);
            background: -o-linear-gradient(#f6f6f6 0, #fff 50px);
            background: -ms-linear-gradient(#f6f6f6 0, #fff 50px);
            background: -moz-linear-gradient(#f6f6f6 0, #fff 50px);
            background: -webkit-linear-gradient(#f6f6f6 0, #fff 50px);
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.15);
            -o-box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            -ms-box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            -moz-box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            -webkit-box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
            -webkit-tap-highlight-color: transparent;
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        .demo-placeholder {
            width: 100%;
            height: 100%;
            font-size: 14px;
        }
    </style>
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
    <%--    <link href="${pageContext.request.contextPath}/css/examples.css" rel="stylesheet" type="text/css">--%>
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <script src="${pageContext.request.contextPath}/js/nav-bar.js"></script>

    <script type="text/javascript" src="${pageContext.request.contextPath}/source/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.event.drag.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/source/jquery.canvaswrapper.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/source/jquery.colorhelpers.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/source/jquery.flot.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/source/jquery.flot.saturated.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/source/jquery.flot.browser.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/source/jquery.flot.drawSeries.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/source/jquery.flot.uiConstants.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/source/jquery.flot.navigate.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/source/jquery.flot.touchNavigate.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/source/jquery.flot.hover.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/source/jquery.flot.touch.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/source/jquery.flot.selection.js"></script>
    <script type="text/javascript">


        $(function () {
            var xmlhttp;
            if (window.XMLHttpRequest) {
                // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
                xmlhttp = new XMLHttpRequest();
            } else {
                // IE6, IE5 浏览器执行代码
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    myArr = JSON.parse(this.responseText);
                    var id = "${cpd.ID}".substring(3, 8);
                    var index = parseInt(id);
                    var dat = myArr[index]["spectrum"];
                    var arrx = [];
                    for (var i = 0; i < dat.length; i++) {
                        arrx.push(dat[i][0])
                    }
                    var extrem = Math.max(...arrx) - Math.min(...arrx);
                    var interval = extrem / arrx.length


                    var data = [{data: dat, label: "m/z"}];

                    var options = {
                        series: {
                            points: {
                                show: true,
                                radius: 0.5,
                            },
                            bars: {
                                show: true,
                                fill: true,
                                barWidth: 0,
                                lineWidth: 1
                            },
                            highlightColor: "red"
                        },
                        colors: ["blue"],
                        xaxis:
                            {
                                position: 'bottom',
                                autoScale:"sliding-window",
                                tickSize: interval,
                                min: 0,
                                max: Math.floor(Math.max(...arrx))+10
                            },
                        yaxis:
                            {
                                position: 'left',
                                tickSize: 10,
                                show: true
                            },
                        grid: {
                            hoverable: true,
                            clickable: true
                        },
                        zoom: {
                            interactive: true
                        },
                        pan: {
                            interactive: true,
                            enableTouch: true
                        }
                    };

                    $.plot("#placeholder", data, options);

                    $("<div id='tooltip'></div>").css({
                        position: "absolute",
                        display: "none",
                        border: "1px solid #fdd",
                        padding: "2px",
                        "background-color": "#fee",
                        opacity: 0.80
                    }).appendTo("body");

                    $("#placeholder").bind("plothover", function (event, pos, item) {
                        if (item) {
                            var x = item.datapoint[0].toFixed(6),
                                y = item.datapoint[1].toFixed(6);

                            $("#tooltip").html(item.series.label + "=" + x + ";abundance=" + y)
                                .css({top: item.pageY + 5, left: item.pageX + 5})
                                .fadeIn(200);
                        } else {
                            $("#tooltip").stop().hide();
                        }
                    });

                    $("#placeholder").bind("plothovercleanup", function (event, pos, item) {
                        $("#tooltip").hide();
                    });
                    $(".zoomCtl button").click(function () {
                        $.plot("#placeholder", data, options);
                    });
                }
            };
            xmlhttp.open("GET", "${pageContext.request.contextPath}/json/json.txt", true);
            xmlhttp.send();

        });


    </script>
</head>
<body>

<%@include file="/webpages/base/header.jsp" %>
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
            <div class="over"></div>
            <div class=amplifyImg><img src="${pageContext.request.contextPath}/browse/${cpd.ID}" alt="compoundStructure"
                                       style="width: 800px;height:500px"></div>

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
            <h2>Mass Spectrum</h2>
            <hr>
        </div>
    </div>

    <div class="demo-container">
        <div class="zoomCtl" style="display:block;float:right;margin:-20px 10px 10px 0">
            <button>Reset</button>
        </div>
        <div id="placeholder" class="demo-placeholder"></div>
    </div>
    <hr>
    <script>
        $(document).ready(function () {
            var imgsObj = $('.amplifyImg img');//需要放大的图像
            if (imgsObj) {
                $.each(imgsObj, function () {
                    $(this).click(function () {
                        var currImg = $(this);
                        coverLayer(1);
                        var tempContainer = $('<div class=tempContainer></div>');//图片容器
                        with (tempContainer) {//width方法等同于$(this)
                            appendTo("body");
                            var windowWidth = $(window).width();
                            var windowHeight = $(window).height();
                            //获取图片原始宽度、高度
                            var orignImg = new Image();
                            orignImg.src = currImg.attr("src");
                            var currImgWidth = orignImg.width;
                            var currImgHeight = orignImg.height;
                            if (currImgWidth < windowWidth) {//为了让图片不失真，当图片宽度较小的时候，保留原图
                                if (currImgHeight < windowHeight) {
                                    var topHeight = (windowHeight - currImgHeight) / 2;
                                    if (topHeight > 35) {/*此处为了使图片高度上居中显示在整个手机屏幕中：因为在android,ios的微信中会有一个title导航，35为title导航的高度*/
                                        topHeight = topHeight - 35;
                                        css('top', topHeight);
                                    } else {
                                        css('top', 0);
                                    }
                                    html('<img border=0 src=' + currImg.attr('src') + '>');
                                } else {
                                    css('top', 0);
                                    html('<img border=0 src=' + currImg.attr('src') + ' height=' + windowHeight + '>');
                                }
                            } else {
                                var currImgChangeHeight = (currImgHeight * windowWidth) / currImgWidth;
                                if (currImgChangeHeight < windowHeight) {
                                    var topHeight = (windowHeight - currImgChangeHeight) / 2;
                                    if (topHeight > 35) {
                                        topHeight = topHeight - 35;
                                        css('top', topHeight);
                                    } else {
                                        css('top', 0);
                                    }
                                    html('<img border=0 src=' + currImg.attr('src') + ' width=' + windowWidth + ';>');
                                } else {
                                    css('top', 0);
                                    html('<img border=0 src=' + currImg.attr('src') + ' width=' + windowWidth * 0.75 + '; height=' + 0.75 * 5 * windowWidth / 8 + '>');
                                }
                            }
                        }
                        tempContainer.click(function () {
                            $(this).remove();
                            coverLayer(0);
                        });
                    });
                });
            } else {
                return false;
            }

            //使用禁用蒙层效果
            function coverLayer(tag) {
                with ($('.over')) {
                    if (tag == 1) {
                        css('height', $(document).height());
                        css('display', 'block');
                        css('opacity', 1);
                        css("background-color", "#FFFFFF");
                        css("background-color", "rgba(0,0,0,0.7)");  //蒙层透明度
                    } else {
                        css('display', 'none');
                    }
                }
            }
        });
    </script>

</main>