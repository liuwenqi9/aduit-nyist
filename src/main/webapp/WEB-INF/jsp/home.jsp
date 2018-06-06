<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/2/002
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet" media="screen">
    <script src="${pageContext.request.contextPath}/js/my.js"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap-admin-theme.css" rel="stylesheet" media="screen">
    <script src="http://cdn.bootcss.com/jquery/3.1.1/jquery.min.js"></script>
    <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Admin Theme -->
    <link href="${pageContext.request.contextPath}/css/bootstrap-admin-theme.css" rel="stylesheet" media="screen">

    <!-- Vendors -->
    <link href="${pageContext.request.contextPath}/vendors/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/css/datepicker.fixes.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/vendors/uniform/themes/default/css/uniform.default.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/css/uniform.default.fixes.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/vendors/chosen.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/vendors/bootstrap-wysihtml5-rails-b3/vendor/assets/stylesheets/bootstrap-wysihtml5/core-b3.css" rel="stylesheet" media="screen">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/html5shiv.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/respond.min.js"></script>
    <![endif]-->

    <!--sweet and my.js-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/sweetalert/sweetalert.css">
    <script src="${pageContext.request.contextPath}/sweetalert/zlalert.js"></script>
    <script src="${pageContext.request.contextPath}/sweetalert/sweetalert.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/my.js"></script>
    <style>
        #iframeContent{
            width: 800px;
            height: 700px;
        }
        .bootstrap-admin-content-title h1{
            font-size: 45px;
            margin-bottom: 30px;
        }
        .bs-docs-home{
        }
        .bs-masthead{
            padding: 0;
        }
        .bs-masthead h1{
            font-size: 40px;
            margin: 0;
            padding: 34px 0;
            text-align: center;
        }
        .bs-masthead a:hover{
            text-decoration: none;
        }
        .meritoo-logo a{
            background-color: #fff;
            border: 1px solid rgba(66, 139, 202, 0.4);
            display: block;
            padding: 12px 0;
        }
        .meritoo-logo a img{
            display: block;
            margin: 0 auto;
        }
        .row-urls{
            margin-top: 4px;
        }
        .row-urls .col-md-6{
            text-align: center;
        }
        .row-urls .col-md-6 {
            font-size: 18px;
        }
        .row .guding {
            /* float: left; */
            position: absolute;
            top: 15%;
        }
    </style>
</head>
<body class="bootstrap-admin-with-small-navbar">
<nav class="navbar navbar-default navbar-inverse navbar-fixed-top " role="navigation">
    <div class="container">
        <div class="row">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">标准教研室系统</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">首页</a></li>
                    <li ><a href="#">xxx</a></li>
                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">${user.username}<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">设置</a></li>
                            <li><a href="#">个人资料</a></li>
                            <li><a href="#">账户中心</a></li>
                            <li class="divider"></li>
                            <li><a href="#">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div>
    </div>
</nav>
<div class="container" id="conhid">
    <!-- left, vertical navbar & content -->
    <div class="row">
        <div  class="col-md-2 bootstrap-admin-breadcrumb" style="float:left">
            <ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side ">
                <li>
                    <a href="/user/success" target="iframeContent"><i class="glyphicon glyphicon-chevron-right"></i>首页</a>
                </li>

                <c:forEach items="${powerList}" var="power">
                    <li onclick="changcolor(this)">
                        <a id="toother" href="${power.url}" target="iframeContent"><i class="glyphicon glyphicon-chevron-right"></i>${power.powername}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div id="guding" class="col-md-10 guding">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin:0 auto;width: 800px;height: 300px">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img src="${pageContext.request.contextPath}/images/高科技1.jpg" style="width: 800px;height: 300px" alt="...">
                    <div class="carousel-caption">
                        <h3 style="font-weight: bold;">南阳理工标准教研室系统</h3>
                    </div>
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/images/高科技2.jpg"  style="width: 800px;height: 300px" alt="...">
                    <div class="carousel-caption">
                        <h3 style="font-weight: bold;">南阳理工标准教研室系统</h3>
                    </div>
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/images/高科技3.jpg"  style="width: 800px;height: 300px" alt="...">
                    <div class="carousel-caption">
                        <h3 style="font-weight: bold;">南阳理工标准教研室系统</h3>
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">上一页</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">下一页</span>
            </a>
        </div>
        </div>
        <iframe id="iframeContent" name="iframeContent" frameborder="0" src="/home/right"></iframe>
    </div>
</div>

<div class="row">
    <hr>
    <footer role="contentinfo">
        <p>&copy2013 <a href="#" target="_blank">nyist</a>-More Templates  - Collect from</p>
    </footer>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#conhid").hide();
        $("#iframeContent").hide();
        setTimeout(function () {
            $("#conhid").show(1000);
        },1000)

    })
    $("#toother").click(function () {
        $("#guding").hide(1000);
        $("#iframeContent").show(1000);
    })
</script>
</body>
</html>
