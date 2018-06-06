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
    <title>导航栏</title>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/vendors/bootstrap-wysihtml5/lib/js/jquery-1.7.2.min.js"></script>
</head>
<style>
    #iframeLeft{
        width: 800px;
        height: 800px;
        float: left;
    }
</style>

<body class="bootstrap-admin-with-small-navbar" >
<div class="container">
    <!-- left, vertical navbar & content -->
    <div class="row">
        <div  class="col-md-2 bootstrap-admin-breadcrumb " style="float:right">
            <ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side ">
                <li>
                    <a href="/user/success" target="iframeContent"><i class="glyphicon glyphicon-chevron-right"></i>首页</a>
                </li>

                <c:forEach items="${powerList}" var="power">
                    <li onclick="changcolor(this)">
                        <a href="${power.url}" target="iframeContent"><i class="glyphicon glyphicon-chevron-right"></i>${power.powername}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<script>
    function changcolor(e) {
        $(e).addClass("active");
        $(e).siblings().removeClass("active");
    }
</script>
</body>
</html>
