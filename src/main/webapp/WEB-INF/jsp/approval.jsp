<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>抽签教研室</title>
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
<body style="padding-top:0">


        <!-- left, vertical navbar -->
        <%--<%@ include file="/WEB-INF/jsp/public.jspf" %>--%>
        <!-- content -->
        <div class="col-md-10" style="padding-top:10px ">
                    <div class="row">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="text-muted bootstrap-admin-box-title">待我审批</div>
                            </div>
                            <div class="bootstrap-admin-panel-content">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>系院名称</th>
                                        <th>教研室名称</th>
                                        <th>打分模块</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach items="${documentList}" var="approval">
                                    <tr>
                                        <td>${approval.user.username}</td>
                                        <td>${approval.roomname}</td>
                                        <td>${user.moduleByMid.moduleName}</td>
                                        <c:if test="${approval.isOk==1}">
                                        <td><a href="/docmoudle/begin/${approval.id}" class="btn btn-info" onclick="changeButton(this)">开始任务</a></td>
                                        </c:if>
                                        <c:if test="${user.isOk!=-1 && approval.isOk==-1}">
                                            <td><a href="#" class="btn btn-default" disabled="true">开始任务</a></td>
                                            <td><a href="/document/toReview/${approval.id}" class="btn btn-info">去打分</a></td>
                                        </c:if>
                                        <c:if test="${user.isOk==-1 && approval.isOk==0}">
                                            <td><a href="#" class="btn btn-default" disabled="true">开始任务</a></td>
                                            <td><a href="/docmoudle/reReview/${approval.id}" class="btn btn-primary">重新打分</a></td>
                                        </c:if>
                                    </tr>
                                    </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                </div>
            </div>

        </div>

        <!--content结束-->

        <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/twitter-bootstrap-hover-dropdown.min.js"></script>
        <script type="text/javascript">
            function changeButton(obg) {
                
            }
        </script>
</body>
</html>
