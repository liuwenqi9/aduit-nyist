<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>个人信息页面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet" media="screen">

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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">管理员<b class="caret"></b></a>
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

<div class="container">
    <div class="row">
        <%@ include file="/WEB-INF/jsp/public.jspf" %>
        <!-- left, vertical navbar & content -->
        <!-- content -->
        <div class="col-md-10">
            <div class="row">
                <div class="panel panel-default bootstrap-admin-no-table-panel">
                    <div class="panel-heading">
                        <div class="text-muted bootstrap-admin-box-title">标准化教研室申请</div>
                    </div>
                    <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                        <span style="color: red;">请填写相关信息：</span><br>
                        <div class="message">
                            <form action="/document/add"  method="POST" enctype="multipart/form-data">

                                <div class="form-group">
                                    <label>教研室名称</label>
                                    <input type="email" class="form-control"  placeholder="输入教研室名称" name="roomname">
                                </div>
                                <div class="form-group">
                                    <label>自评分数</label>
                                    <input type="number" class="form-control" placeholder="输入自评分数" name="selfscore">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputFile">上传附件</label>
                                    <input type="file" id="exampleInputFile" name="file">
                                    <p class="help-block">请上传标准化教研室文件.</p>
                                </div>

                                <button type="submit" class="btn btn-primary">提交</button>
                                <input type="reset" class="btn btn-default" value="重置" >
                            </form>
                            <!--阅读须知弹出框-->

                            <!--阅读须知弹出框-->
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

    <div class="row">
        <hr>
        <footer role="contentinfo">
            <p>&copy; fasfdxxxxxxxxxxxxxx</p>
        </footer>
    </div>
</div>

</body>
</html>
