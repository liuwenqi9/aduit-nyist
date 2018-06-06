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

           <script type="text/javascript" src="${pageContext.request.contextPath}/js/html5shiv.js"></script>
           <script type="text/javascript" src="${pageContext.request.contextPath}/js/respond.min.js"></script>
           <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
           <link rel="stylesheet" href="${pageContext.request.contextPath}/sweetalert/sweetalert.css">
           <script src="${pageContext.request.contextPath}/sweetalert/sweetalert.min.js"></script>
           <script src="${pageContext.request.contextPath}/sweetalert/zlalert.js"></script>

    </head>
    <body style="padding-top:0 ">
<div class="col-md-10" style="padding-top:10px ">
                    <div class="row bootstrap-admin-no-edges-padding">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="bootstrap-admin-panel-content">
                        <div class="row">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <div class="text-muted bootstrap-admin-box-title">教研室列表</div>
                            </div>
                            <div class="bootstrap-admin-panel-content">
                                <table class="table table-striped table-bordered" id="example">
                                    <thead>
                                        <tr>
                                            <th>学院名称</th>
                                            <th>学院类别</th>
                                            <th>上传教研室数量</th>
                                            <th>上传时间</th>
                                            <th>抽签</th>
                                        </tr>
                                    </thead>
                                    <c:forEach var="check" items="${ checkList}" varStatus="status">

                                    <tbody>
                                        <tr class="odd gradeX">
                                            <input type="hidden" id="userId" value="${check.rid}">
                                            <td>${check.roomName}</td>
                                            <td>${check.groud}</td>
                                            <td>${check.roomCount}</td>
                                            <td class="center">${check.uploadTime}</td>
                                            <td><button id="choose_${check.rid}" type="button"  class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg" onclick="chooseId(this);">选择</button></td>
                                        </tr>
                                    </tbody>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                        </div>
                                    <!--模态对话框-->
                    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="padding-top: 200px">
                      <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <form action="/document/checked" method="POST">
                    <table id="chooseTable" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>选择</th>
                                            <th>教研室名称</th>
                                            <th>自评分数</th>
                                            <th>附件</th>
                                        </tr>
                                    </thead>
                                </table>
                            <button style="float: right;" id="checksubmit" type="submit" class="btn btn-success">提交</button>
                            </form>
                                </div>
                              </div>
                            </div>
                                </div>
                            </div>
                        </div>
                    </div>
            <%--<div class="row">--%>
                <%--<hr>--%>
                <%--<footer role="contentinfo">--%>
                    <%--<p>&copy; 2013 <a href="#" target="_blank">Boot3Admin</a>-More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>--%>
                <%--</footer>--%>
            <%--</div>--%>
</div>
<!--content结束-->

            </div>
        </div>

        <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
         <%--<script type="text/javascript">--%>
            <%--$(function () {--%>
                <%--$('input:button').each(function () {--%>
                    <%--alert("hah");--%>
                    <%--$(this).click(function () {--%>
                        <%--{--%>
                            <%--var id = $(this).attr('id').split('_')[1];--%>
                            <%--alert(id);--%>
                        <%--}--%>
                    <%--})--%>
                <%--})--%>
            <%--})--%>
         <%--</script>--%>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/twitter-bootstrap-hover-dropdown.min.js"></script>
                <script type="text/javascript">
                        $("#checksubmit").click = function(){
                        zlalert.alertSuccess('教研室选择成功！');
                    };
                        function chooseId(obj){
                            var uid = $(obj).attr("id").split('_')[1];
                            console.log(uid);
                            $.ajax({
        type:"post",
        url:"${pageContext.request.contextPath}/document/choose?uid="+uid,
        dataType:"json",
        success:function(area){
            console.log(area);
            var addHtml='';
            $("#chooseTable").empty();
            addHtml +='<thead>'
            addHtml +='<tr>'
            addHtml +='<th>选择</th>'
            addHtml +='<th>教研室名称</th>'
            addHtml +='<th>自评分数</th>'
            addHtml +='<th>附件</th>'
            addHtml +='</tr>'
            addHtml +='</thead>'

            for(var i=0;i<area.length;i++){
                addHtml += '<tbody>';
                addHtml +=   '<td>';
                addHtml +=  '<div class="checkbox">';
                addHtml +=   '<label>';
                                if(area[i].isSelect==1) {
                                    addHtml += '<input type="radio" name="id" checked="checked" value="' + area[i].id + '">';
                                }else{
                                    addHtml += '<input type="radio" name="id" value="' + area[i].id + '">';
                                }
                addHtml +=    '</label>';
                addHtml +=    '</div>';
                addHtml +=    '</td>';
                addHtml +=    '<td>'+area[i].roomname+'</td>';
                addHtml +=    '<td>'+area[i].selfscore+'</td>';
                addHtml +=    '<td>';
                addHtml +=    '<a href="/document/download/'+area[i].id+'">';
                addHtml +=     '<button type="button" class="btn btn-primary">获取附件</button>';
                addHtml +=     '</a>'
                addHtml +=   ' </td>';
                addHtml += '</tbody>';
            }

            $("#chooseTable").append(addHtml);
        }
    })

                    }
                </script>

    </body>
</html>
