<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>申请结果</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/css/bootstrap-theme.min.css" rel="stylesheet" media="screen">

    <!-- Bootstrap Admin Theme -->
    <link href="${pageContext.request.contextPath}/css/bootstrap-admin-theme.css" rel="stylesheet" media="screen">

    <!-- Vendors -->
    <link href="${pageContext.request.contextPath}/vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/vendors/easypiechart/jquery.easy-pie-chart_custom.css" rel="stylesheet" media="screen">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/html5shiv.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/respond.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript">

        $(function(){

        });
    </script>
    <style type="text/css">
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
    <![endif]-->
</head>
<body style="padding-top:0 ">

        <!-- left, vertical navbar -->
        <%--<%@ include file="/WEB-INF/jsp/public.jspf" %>--%>

        <!-- content -->
        <div class="col-md-10" style="padding-top:10px ">
            <div class="row">
                <div class="panel panel-default bootstrap-admin-no-table-panel">
                    <div class="panel-heading">
                        <div class="text-muted bootstrap-admin-box-title">申请结果</div>
                    </div>
                    <div class="bootstrap-admin-panel-content">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>学院名称</th>
                                <th>学院类别</th>
                                <th>教研室名称</th>
                                <th>自评分数</th>
                                <th>审核总分</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <c:forEach items="${resultList}" var="result">

                            <tbody>
                            <td>${result.userName}</td>
                            <td>${result.groupd}</td>
                            <td>${result.roomName}</td>
                            <td>${result.selfScore}</td>
                            <td>${result.sumScore}</td>
                            <td><a href="/docmoudle/particular/${result.id}">查看详情</a></td>
                            </tbody>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>

</body>
</html>