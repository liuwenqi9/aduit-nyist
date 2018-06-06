<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap Docs -->
    <link href="http://getbootstrap.com/assets/css/docs.css" rel="stylesheet" media="screen">

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet" media="screen">

    <!-- Bootstrap Admin Theme -->
    <link href="${pageContext.request.contextPath}/css/bootstrap-admin-theme.css" rel="stylesheet" media="screen">

    <!-- Custom styles -->
    <style type="text/css">
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
        .row-urls .col-md-6 a{
            font-size: 18px;
        }
        .toright{
            position:absolute;
            top:3%;
            width: 1000px;
            height: 500px;
        }
        .changecolr{

            background: -webkit-linear-gradient(
                    top,white,lightblue,skyblue
            );
        }
    </style>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/html5shiv.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/respond.min.js"></script>
    <![endif]-->
</head>
<body class="bootstrap-admin-with-small-navbar">

<div class="container ">
    <!-- left, vertical navbar & content -->
    <div class="row">
        <!-- left, vertical navbar -->

        <!-- content -->
        <div class="col-md-10">

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
    </div>
</div>
<!--content结束-->

<script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/twitter-bootstrap-hover-dropdown.min.js"></script>

</body>
</html>
