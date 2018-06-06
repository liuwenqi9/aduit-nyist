<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>评分</title>
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
    <script type="text/javascript" src="js/html5shiv.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body class="bootstrap-admin-with-small-navbar ">


<div class="container ">
    <!-- left, vertical navbar & content -->
    <div class="row">
        <!-- left, vertical navbar -->
        <%--<%@ include file="/WEB-INF/jsp/public.jspf" %>--%>
        <!-- content -->
        <div class="col-md-10">
            <div class="row">
                <div class="panel panel-default bootstrap-admin-no-table-panel">
                    <div class="panel-heading">
                        <div class="text-muted bootstrap-admin-box-title">评分</div>
                       <div class="text-muted bootstrap-admin-box-title" style="float: right"> <a href="">返回</a></div>
                    </div>

                    <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                        <c:if test="${empty docmoudle}">
                        <form action="/docmoudle/review" class="form-horizontal lf" style="width: 350px" method="post">
                            <input type="hidden" name="ddid" value="${document.id}">
                        <div class="form-group">
                            <label class="col-lg-2 control-label">评委名称</label>
                            <div class="col-lg-10">
                                <input class="form-control disabled" type="text" placeholder="${user.username}" disabled="true">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">负责模块</label>
                            <div class="col-lg-10">
                                <input class="form-control disabled" type="text" placeholder="${user.moduleByMid.moduleName}" disabled="true">
                            </div>
                        </div>
                            <div class="form-group">
                                <label class="col-lg-2 control-label">分数</label>
                                <div class="col-lg-10">
                                    <input class="form-control" name="score" type="text">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-2 control-label">意见</label>
                                <textarea class="form-control" name="content" rows="5" cols="5" style="margin-left: 80px;width: 285px" ></textarea>
                            </div>
                        <button style="float: right" type="submit" class="btn btn-default">提交</button>
                        </form>
                        </c:if>
                        <c:if test="${not empty docmoudle}">
                            <form action="/docmoudle/review" class="form-horizontal lf" style="width: 350px" method="post">
                                <input type="hidden" name="ddid" value="${document.id}">
                                <div class="form-group">
                                    <label class="col-lg-2 control-label">评委名称</label>
                                    <div class="col-lg-10">
                                        <input class="form-control disabled" type="text" placeholder="${user.username}" disabled="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-2 control-label">负责模块</label>
                                    <div class="col-lg-10">
                                        <input class="form-control disabled" type="text" placeholder="${user.moduleByMid.moduleName}" disabled="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-2 control-label">分数</label>
                                    <div class="col-lg-10">
                                        <input class="form-control" name="score" type="text" value="${docmoudle.score}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-lg-2 control-label">意见</label>
                                    <textarea value="${docmoudle.content}" class="form-control" name="content" rows="5" cols="5" style="margin-left: 80px;width: 285px" ></textarea>
                                </div>
                                <button style="float: right" type="submit" class="btn btn-default">提交</button>
                            </form>
                        </c:if>
                        <div class="info">
                            <h3>
                                评分要求：
                            </h3>
                            <div class="show">
                                如有抄送机关，在主题词下1行；左右各空1字，用三号仿宋体字标识“抄送”，后标全角冒号；抄送机关间用逗号隔开，回行时与冒号后的抄送机关对齐；在最后一个抄送机关后标句号。如主送机关移至主题词之下，标识方法同抄送机关。
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>





    </div>
</div>
<!--content结束-->

<script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/twitter-bootstrap-hover-dropdown.min.js"></script>

</body>
</html>
