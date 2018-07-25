<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kadir
  Date: 20.07.2018
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
</head>
<body>

<table>

    <tr href="/:${contextPath}/profile/${user.getid()}">
        <td>${user.getid()}</td>
        <td>${user.name}</td>
        <td>${user.lastname}</td>

        <img alt="img" src="data:image/jpg;base64,${foto}" width="200" height="200"/>
    </tr>
</table>
</body>
</html>
