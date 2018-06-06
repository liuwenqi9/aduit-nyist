<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>个人信息页面</title>
        <%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
        <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
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
    <body style="padding-top:0px ">
                <!-- content -->
                <div class="col-md-10" style="padding-top:10px ">
                    <div class="row">
                        <div class="panel panel-default bootstrap-admin-no-table-panel">
                            <div class="panel-heading">
                                <div class="text-muted bootstrap-admin-box-title">个人信息</div>
                            </div>
                            <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                                <form class="form-horizontal">
                                    <fieldset>
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label" for="focusedInput">用户名</label>
                                            <div class="col-lg-10">
                                                <input class="form-control" id="focusedInput" type="text" value="${user.username}">
                                            </div>
                                        </div>
                                        <div class="form-group" >
                                            <label class="col-lg-2 control-label" for="focusedInput">密码</label>
                                            <div class="col-lg-10">
                                                <input class="form-control" id="focusedInput" type="text" value="${user.password}">
                                            </div>
                                        </div>
										<div class="form-group">
                                            <label class="col-lg-2 control-label" for="focusedInput">电话</label>
                                            <div class="col-lg-10">
                                                <input class="form-control"  type="text" value="${user.phone}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label>邮箱"></label>
                                            <div class="col-lg-10">
                                                <input class="form-control" type="text" value="${user.email}">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">身份</label>
                                            <div class="col-lg-10">
                                                <c:if test="${user.role==0}">
                                                    <input class="form-control disabled" type="text" placeholder="超级管理员" disabled="">
                                                </c:if>
                                                <c:if test="${user.role==1}">
                                                    <input class="form-control disabled" type="text" placeholder="教导主任" disabled="">
                                                </c:if>

                                                <c:if test="${user.role==2}">
                                                    <input class="form-control disabled" type="text" placeholder="审批人" disabled="">
                                                </c:if>
                                                <c:if test="${user.role==3}">
                                                    <input class="form-control disabled" type="text" placeholder="院系" disabled="">
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">所属类别</label>
                                            <div class="col-lg-10">
                                                <c:if test="${user.groupd==1}">
                                                    <input class="form-control disabled"  type="text" placeholder="文科" disabled="">
                                                </c:if>
                                                <c:if test="${user.groupd==2}">
                                                    <input class="form-control disabled"  type="text" placeholder="理科" disabled="">
                                                </c:if>
                                                <c:if test="${user.groupd==2}">
                                                    <input class="form-control disabled"  type="text" placeholder="无" disabled="">
                                                </c:if>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary">保存修改</button>
                                        <button type="reset" class="btn btn-default">Cancel</button>
                                    </fieldset>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>

    </body>
</html>
