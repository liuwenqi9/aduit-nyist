<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh">
<head>
<%--<meta charset="UTF-8">--%>
<%--<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> --%>
<%--<meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>用户登录</title>

	<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
<div class="htmleaf-container">
	<div class="wrapper">
		<div class="container">
			<h1>Welcome</h1>
			
			<form class="form" action="/user/login" method="post" id="src">
				<input type="text" id="textname" placeholder="Username" name="username" required>
				<input type="password" id="textpassword" pattern="[0-9]{6}" placeholder="Password" name="password" required>
				<button type="submit" id="login-button">Login</button>
			</form>
		</div>
		
		<ul class="bg-bubbles">
			<li>fkldkfl</li>
			<li>来来来</li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script>
$('#login-button').click(function (event) {
//	event.preventDefault();
	$('form').fadeOut(500);
    $('.wrapper').addClass('form-success');

	setTimeout(function () {
        $("#src").submit;
    },3000);

});
textname.oninput=function(){
    textname.setCustomValidity("");
};
textname.oninvalid=function(){
    textname.setCustomValidity("请输入用户名！");
};
textpassword.oninput=function(){
    textpassword.setCustomValidity("");
};
textpassword.oninvalid=function(){
    textpassword.setCustomValidity("请输入正确的密码！");
};
</script>
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';color:#000000">
<p>适用浏览器：360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗. 不支持IE8及以下浏览器。</p>
</div>
</body>
</html>