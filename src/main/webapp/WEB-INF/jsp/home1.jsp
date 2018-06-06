<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/2/002
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home</title>
    <style>
        #iframeTop{
            width: 100%;
            height: 70px;
        }
        #iframeLeft{
            width: 45%;
            height: 700px;
            float: left;
        }
        #iframeContent{
            width: 55%;
            height: 700px;
        }
    </style>
<body>
<div>
    <iframe id="iframeTop" name="iframeTop" frameborder="0" src="/home/top"></iframe>
    <iframe id="iframeLeft" name="iframeLeft" frameborder="0" src="/home/left"></iframe>
    <iframe id="iframeContent" name="iframeContent" frameborder="0" src="/home/right"></iframe>
</div>
</body>
</html>
