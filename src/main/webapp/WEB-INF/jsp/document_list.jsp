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
<body style="padding-top:0">
            <div class="col-md-10" style="padding-top:10px">
                <div class="row">
                    <div class="panel panel-default bootstrap-admin-no-table-panel">
                        <select class="year" name="year" id="year">
                            <option value="0">==默认当前年份==</option>
                            <option value="2014">2014/..</option>
                            <option value="2015">2015/..</option>
                            <option value="2016">2016/..</option>
                            <option value="2017">2017/..</option>
                            <option value="2018">2018/..</option>
                        </select>
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">申请列表</div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <table class="table table-striped" id="listtable">
                                <thead>
                                <tr>
                                    <th>教研室名称</th>
                                    <th>自评分数</th>
                                    <th>上传时间</th>
                                    <th>附件</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <c:forEach var="document" items="${ documentList}" varStatus="status">
                                    <tbody>
                                    <td>${document.roomname}</td>
                                    <td>${document.selfscore}</td>
                                    <td>${document.uploadtime}</td>
                                    <td><a href="/document/download/${document.id}">${document.filename}</a></td>
                                    <c:if test="${document.isOk==1}">
                                        <td><span class="label label-info">等待中</span></td>
                                    </c:if>
                                    <c:if test="${document.isOk==0}">
                                        <td><span class="label label-success">审批结束</span></td>
                                    </c:if>
                                    <c:if test="${document.isOk==-1}">
                                        <td><span class="label label-primary">进行中</span></td>
                                    </c:if>
                                    <td>
                                        <button type="button" class="btn btn-warning btn-xs">修改</button>
                                        <button type="button" class="btn btn-danger btn-xs" >删除</button>
                                    </td>
                                    </tbody>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <script type="text/javascript">
        $("#year").change(function () {
            var year=$("#year").val();
            if($(".year").val==0){
                return;
            }
            $.ajax({
                type:"post",
                //传一个省的id参数
                url:"${pageContext.request.contextPath}/document/findYear?year="+year,
                dataType:"json",
                success:function(area){
                    console.log(area);
                    var addHtml='';
                    $("#listtable").empty();
                    addHtml += '<thead>'
                    addHtml += '<tr>'
                    addHtml += '<th>教研室名称</th>'
                    addHtml += '<th>自评分数</th>'
                    addHtml += '<th>上传时间</th>'
                    addHtml += '<th>附件</th>'
                    addHtml += '<th>状态</th>'
                    addHtml += '<th>操作</th>'
                    addHtml += '</tr>'
                    addHtml += '</thead>'
                    for(var i=0;i<area.length;i++){
                        addHtml += '<tbody>'
                        addHtml += '<td>'+area[i].roomname+'</td>'
                        addHtml += '<td>'+area[i].selfscore+'</td>'
                        addHtml += '<td>'+area[i].uploadtime+'</td>'
                        addHtml += '<td><a href="/document/download/'+area[i].id+'">'+area[i].filename+'</a></td>'
                            if (area[i].isOk==1){
                                addHtml +=  '<td><span class="label label-info">等待中</span></td>'
                            }
                        if (area[i].isOk==0){
                            addHtml +=  '<td><span class="label label-success">审批结束</span></td>'
                        }
                        if (area[i].isOk==-1) {
                            addHtml += '<td><span class="label label-primary">进行中</span></td>'
                        }
                        addHtml += '<td>'
                        addHtml += '<button type="button" class="btn btn-warning btn-xs">修改</button>'
                        addHtml += '<button type="button" class="btn btn-danger btn-xs" >删除</button>'
                        addHtml += '</td>'
                        addHtml += '</tbody>'
                    }
                    $("#listtable").append(addHtml);
                }
            })
        })
    </script>
</body>
</html>