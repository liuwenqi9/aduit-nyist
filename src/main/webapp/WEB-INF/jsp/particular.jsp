<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
        <html>
        <head>
            <title>申请结果（详情）</title>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

            <!-- Bootstrap -->
            <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
            <link href="css/bootstrap-theme.min.css" rel="stylesheet" media="screen">

            <!-- Bootstrap Admin Theme -->
            <link href="css/bootstrap-admin-theme.css" rel="stylesheet" media="screen">

            <!-- Vendors -->
            <link href="vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
            <link href="vendors/easypiechart/jquery.easy-pie-chart_custom.css" rel="stylesheet" media="screen">

            <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
            <!--[if lt IE 9]>
            <script type="text/javascript" src="js/html5shiv.js"></script>
            <script type="text/javascript" src="js/respond.min.js"></script>
            <![endif]-->
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
        </head>
<body style="padding-top:0 ">

        <!-- content -->
        <div class="col-md-10" style="padding-top:10px ">
            <div class="row">
                <div class="panel panel-default bootstrap-admin-no-table-panel">
                    <div class="panel-heading">
                        <div class="text-muted bootstrap-admin-box-title">申请结果（详情）</div>
                    </div>
                    <div class="bootstrap-admin-panel-content">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>模块</th>
                                <th>负责人</th>
                                <th>分数</th>
                                <th>打分意见</th>
                            </tr>
                            </thead>
                            <c:forEach items="${docModuleList}" var="docModule">
                            <tbody>
                            <td>${docModule.moduleByMid.moduleName}</td>
                            <td>${docModule.userByUid.username}</td>
                            <td>${docModule.score}</td>
                            <td><a href="">${docModule.content}</a></td>
                            </tbody>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
</body>
</html></title>
</head>
<body>

</body>
</html>