<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/27/027
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach var="document" items="${ documentList}" varStatus="status">
    <tr>
        <td>${ status.index + 1}</td>
        <td>${ document.roomname}</td>
    </tr>
</c:forEach>
</body>
</html>
