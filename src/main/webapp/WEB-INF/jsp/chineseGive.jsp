<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>验收人物分配（文科组）</title>
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
    <!--<script type="text/javascript" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/html5shiv.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/respond.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
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


        <!-- content -->
        <div class="col-md-10" style="padding-top:10px ">
            <div class="row">
                <div class="panel panel-default bootstrap-admin-no-table-panel">
                    <div class="panel-heading">
                        <div class="text-muted bootstrap-admin-box-title">验收人物分配（文科组）</div>
                    </div>
                    <div class="bootstrap-admin-no-table-panel-content bootstrap-admin-panel-content collapse in">
                        <div class="message">
                            <form action="/user/chineseGive" class="form-horizontal">
                                <c:choose>
                                    <c:when test="${not empty reList}">
                                        <c:forEach items="${reList}" var="reModel">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">${reModel.module.moduleName}</label>
                                                <div class="col-sm-10">
                                                        <%--<input class="form-control" id="focusedInput" type="text" value="${reModel.user.username}" disabled="true">--%>
                                                    <select class="form-control"  id="focusedInput" disabled="disabled" >
                                                        <option  value = "1"  selected = "selected">${reModel.user.username}</option >
                                                    </select>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${moduleList}" var="module" varStatus="s">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">${module.moduleName}</label>
                                                <input name="muList[${s.index}].mid" type="hidden" value="${module.id}">
                                                <div class="col-sm-10">
                                                    <select class="form-control" name="muList[${s.index}].uid" id="satisfactionOptionT${s.count}" onchange="satisfactionOptionT(this)">
                                                        <option value="-1">---请选择---</option>
                                                        <c:if test="${not empty userList}">

                                                            <c:forEach items="${userList}" var="user">
                                                                <option value="${user.id}">${user.username}</option>
                                                            </c:forEach>

                                                        </c:if>
                                                    </select>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                                <button type="submit" class="btn btn-primary" style="float: right">提交</button>
                                <input type="reset" class="btn btn-default" style="float: right"value="重置" >
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>

<script type="text/javascript">
    function satisfactionOptionT(){
        var num = 0;
        var array = new Array();
        if($("#satisfactionOptionT1").val() != -1){
            array[num] = $("#satisfactionOptionT1").val();
            num++;
        }
        if($("#satisfactionOptionT2").val() != -1){
            array[num] = $("#satisfactionOptionT2").val();
            num++;
        }
        if($("#satisfactionOptionT3").val() != -1){
            array[num] = $("#satisfactionOptionT3").val();
            num++;
        }
        if($("#satisfactionOptionT4").val() != -1){
            array[num] = $("#satisfactionOptionT4").val();
            num++;
        }
        if($("#satisfactionOptionT5").val() != "-1"){
            array[num] = $("#satisfactionOptionT5").val();
            num++;
        }
        if($("#satisfactionOptionT6").val() != "-1"){
            array[num] = $("#satisfactionOptionT6").val();
            num++;
        }
        if($("#satisfactionOptionT7").val() != "-1"){
            array[num] = $("#satisfactionOptionT7").val();
            num++;
        }
        if($("#satisfactionOptionT8").val() !="-1"){
            array[num] = $("#satisfactionOptionT8").val();
            num++;
        }
        if($("#satisfactionOptionT9").val() != "-1"){
            array[num] = $("#satisfactionOptionT9").val();
            num++;
        }

        $.ajax({
            url:"${pageContext.request.contextPath}/user/mreduce?array="+array,
            type:"POST",
            success:function(data){
                //除去选中的potion 将其他的选项赋值到 剩余没有选择的满意度上
                var publicOption ='<option value="-1" >--请选择--</option>';
                var publicSelect ='';
                var select1 = '';
                var select2 = '';
                var select3 = '';
                var select4 = '';
                var select5 = '';
                var select6 = '';
                var select7 = '';
                var select8 = '';
                var select9 = '';

                if($("#satisfactionOptionT1").val() != -1){
                    select1 +='<option value='+$("#satisfactionOptionT1").val()+' selected="selected">'+$("#satisfactionOptionT1").find("option:selected").text()+'</option>';
                }
                if($("#satisfactionOptionT2").val() != -1){
                    select2 +='<option value='+$("#satisfactionOptionT2").val()+' selected="selected">'+$("#satisfactionOptionT2").find("option:selected").text()+'</option>';
                }
                if($("#satisfactionOptionT3").val() != -1){
                    select3 +='<option value='+$("#satisfactionOptionT3").val()+' selected="selected">'+$("#satisfactionOptionT3").find("option:selected").text()+'</option>';
                }
                if($("#satisfactionOptionT4").val() != -1){
                    select4 +='<option value='+$("#satisfactionOptionT4").val()+' selected="selected">'+$("#satisfactionOptionT4").find("option:selected").text()+'</option>';
                }
                if($("#satisfactionOptionT5").val() != -1){
                    select5 +='<option value='+$("#satisfactionOptionT5").val()+' selected="selected">'+$("#satisfactionOptionT5").find("option:selected").text()+'</option>';
                }
                if($("#satisfactionOptionT6").val() != -1){
                    select6 +='<option value='+$("#satisfactionOptionT6").val()+' selected="selected">'+$("#satisfactionOptionT6").find("option:selected").text()+'</option>';
                }
                if($("#satisfactionOptionT7").val() != -1){
                    select7 +='<option value='+$("#satisfactionOptionT7").val()+' selected="selected">'+$("#satisfactionOptionT7").find("option:selected").text()+'</option>';
                }
                if($("#satisfactionOptionT8").val() != -1){
                    select8 +='<option value='+$("#satisfactionOptionT8").val()+' selected="selected">'+$("#satisfactionOptionT8").find("option:selected").text()+'</option>';
                }
                if($("#satisfactionOptionT9").val() != -1){
                    select9 +='<option value='+$("#satisfactionOptionT9").val()+' selected="selected">'+$("#satisfactionOptionT9").find("option:selected").text()+'</option>';
                }
                for (var i = 0; i < data.length; i++) {
                    // alert(obj.data[i].concreteValue);
                    publicSelect +='<option value='+data[i].id+' >'+data[i].username+'</option>';
                }
                $("#satisfactionOptionT1").html(publicOption+select1+publicSelect);
                $("#satisfactionOptionT2").html(publicOption+select2+publicSelect);
                $("#satisfactionOptionT3").html(publicOption+select3+publicSelect);
                $("#satisfactionOptionT4").html(publicOption+select4+publicSelect);
                $("#satisfactionOptionT5").html(publicOption+select5+publicSelect);
                $("#satisfactionOptionT6").html(publicOption+select6+publicSelect);
                $("#satisfactionOptionT7").html(publicOption+select7+publicSelect);
                $("#satisfactionOptionT8").html(publicOption+select8+publicSelect);
                $("#satisfactionOptionT9").html(publicOption+select9+publicSelect);
            },
//            error:function(){
//                alert("与服务器断开联系,请稍后再试!");
//                parent.location.reload();
//            }

        })
    }

</script>
</body>
</html>