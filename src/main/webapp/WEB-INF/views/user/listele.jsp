<%--
  Created by IntelliJ IDEA.
  User: kadir
  Date: 17.07.2018
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${not empty lists}">
<table class="table table-hover">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">AD</th>
        <th scope="col">SOYAD</th>
        <th scope="col">E-MAIL</th>
        <th scope="col">ENABLED</th>
        <th scope="col">SIL</th>
        <th scope="col">PROFIL</th>
    </tr>
    </thead>

    <tbody>
    <ul>
        <c:forEach var="listValue" items="${lists}">
            <tr>
                <td>${listValue.getid()}</td>
                <td>${listValue.name}</td>
                <td>${listValue.lastname}</td>
                <td>${listValue.email}</td>
                <td>${listValue.valid}</td>
                <td><button class="btn btn-danger" onclick="this.disabled= true; location.href='${contextPath}/profile/${listValue.getid()}/delete'">Delete</button></td>
                <td><input type="button" class="btn btn-success" value="Profil" onclick="location.href='${contextPath}/profile/${listValue.getid()}'" ><br></td>
            </tr>
        </c:forEach>
    </ul>
    </tbody>
</table>

</c:if>
</body>
</html>
