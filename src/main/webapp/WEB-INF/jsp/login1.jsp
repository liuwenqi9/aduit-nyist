<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>My first Spring boot web demo</title>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/sweetalert/sweetalert.css">
    <script src="${pageContext.request.contextPath}/sweetalert/sweetalert.min.js"></script>
    <script src="${pageContext.request.contextPath}/sweetalert/zlalert.js"></script>
    <style>
        button{
            display: block;
            margin-bottom: 10px;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
</head>
<body>
<form class="form-inline" action="/user/login" method="post">
    <input type="text" class="input-small" autofocus="autofocus" placeholder="UserId" name="username" required>
    <input type="password" pattern="[0-9]{6}" class="input-small" placeholder="Password" name="password" required>
    <label class="checkbox">
        <input type="checkbox"> Remember me
    </label>
    <button type="submit" class="btn btn-primary" onclick="zlalert.alertSuccess('恭喜您！操作成功！')">Sign in</button>

</form>

</body>
</html>