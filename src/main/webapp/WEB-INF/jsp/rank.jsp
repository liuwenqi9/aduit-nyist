<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>获奖名单</title>
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
        <![endif]-->
        <style type="text/css">
            .changecolr{
                background: -webkit-linear-gradient(
                        top,white,lightblue,skyblue
                );
            }
        </style>
    </head>
    <body style="padding-top:0 ">

                <!-- content -->
                <div class="col-md-10" style="padding-top:10px ">
                    <div class="row">
                        <div class="panel panel-default bootstrap-admin-no-table-panel">
                            <div class="panel-heading">
                                <div class="text-muted bootstrap-admin-box-title">获奖名单</div>
                            </div>
                            <div class="bootstrap-admin-panel-content">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>戏院名称</th>
                                        <th>类别</th>
                                        <th>抽查教研室名称</th>
                                        <th>自评分</th>
                                        <th>总分</th>
                                        <th>排名</th>
                                    </tr>
                                </thead>
                                <c:forEach items="${rankList}" var="rank" varStatus="status">
                                    <tbody>
                                    <td>${rank.user.username}</td>
                                    <td>${rank.user.groupd}</td>
                                    <td>${rank.roomname}</td>
                                    <td>${rank.selfscore}</td>
                                    <td>${rank.lastScores}</td>
                                    <td>${status}</td>
                                    </tbody>
                                </c:forEach>

                            </table>
                        </div>
                        </div>
                    </div>
                </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>

        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/twitter-bootstrap-hover-dropdown.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/vendors/easypiechart/jquery.easy-pie-chart.js"></script>

        <script type="text/javascript">
            $(function() {
                // Easy pie charts
                $('.easyPieChart').easyPieChart({animate: 1000});
            });
        </script>
    </body>
</html>