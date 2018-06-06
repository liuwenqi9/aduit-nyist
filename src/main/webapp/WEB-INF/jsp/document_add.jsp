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
    <script src="${pageContext.request.contextPath}/js/my.js"></script>
    <link href="${pageContext.request.contextPath}/css/bootstrap-admin-theme.css" rel="stylesheet" media="screen">
    <link href="${pageContext.request.contextPath}/css/11-folding-cube.css" rel="stylesheet" media="screen">
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
    <style type="text/css">
        .toright{
            position:absolute;
            top:3%;
            width: 1200px;
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
                    <div class="panel-heading">
                        <div class="text-muted bootstrap-admin-box-title">标准化教研室申请</div>
                    </div>
                    <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                        <span style="color: red;">请填写相关信息：</span><br>
                        <button type="submit" class="btn btn-primary" id="btn_add">增加</button>
                        <c:if test="${count==0}">
                        <form action="/document/addall" id="bfto"  method="POST" enctype="multipart/form-data">
                            <div id="message">
                                <div class="form-inline" id="field_1">
                                    <input type="hidden" id="${count}" class="give">
                                    <div class="form-group list-top">
                                        <label>教研室名称</label>
                                        <input id="textname" autofocus="autofocus" required type="text" class="form-control" placeholder="教研室名称1" name="documents[0].roomname">
                                    </div>
                                    <div class="form-group list-top">
                                        <label>自评分数</label>
                                        <input id="textnumber" type="number" class="form-control" placeholder="自评分数" name="documents[0].selfscore">
                                    </div>
                                    <div class="form-group list-top">
                                        <input type="file" name="file"  accept="application/msword,application/pdf,aplication/zip">
                                    </div>
                                    <div class="form-group list-top">
                                        <button type="button" class="close removeclass"><span>&times;</span></button>
                                    </div>

                                </div>
                                <!--阅读须知弹出框-->

                                <!--阅读须知弹出框-->
                            </div>
                            <div class="sk-folding-cube" id="onload">
                                <div class="sk-cube1 sk-cube"></div>
                                <div class="sk-cube2 sk-cube"></div>
                                <div class="sk-cube4 sk-cube"></div>
                                <div class="sk-cube3 sk-cube"></div>
                            </div>
                            <button type="button" class="btn btn-primary" id="saduit">提交</button>
                            <input type="reset" class="btn btn-default" value="重置" >
                        </form>
                        </c:if>
                        <c:if test="${count>0}">
                            <button type="button" class="btn btn-primary" id="submit">提交</button>
                            <input type="reset" class="btn btn-default" value="重置" >
                        </c:if>
                    </div>
                </div>
            </div>

        </div>

<script>
    $(document).ready(function () {
        $("#onload").hide();
    })
    function a() {
        $("#form1").submit();
    }
    window.onload=function () {
        $("#count").click=function () {
            zlalert.alertInfoToast('该教研室上传文件数量达到上限');
        }
    }
    $("#saduit").click(function () {
        $("#onload").show(1000);
        setTimeout(function () {

            zlalert.alertConfirm({
                "confirmText":"再发一篇",
                "cancelText":"回到首页",
                "msg": "恭喜！文章发表成功！",
                "confirmCallback": function(){
                    alert('点击了确认按钮')
                },
                "cancelCallback": function(){
                    $("#bfto").submit();
                }
            });
        },3000);

    })
    textname.oninput=function(){
        textname.setCustomValidity("");
    };
    textname.oninvalid=function(){
        textname.setCustomValidity("请输入教研室名称！");
    };
    textnumber.oninput=function(){
        textnumber.setCustomValidity("");
    };
    textnumber.oninvalid=function(){
        textnumber.setCustomValidity("自评分数不能为空！");
    };
</script>
</body>
</html>
