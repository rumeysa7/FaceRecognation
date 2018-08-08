<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: kadir
  Date: 20.07.2018
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<html>
<head>
    <title>Profil</title>
    <style>
        div.center {
            margin: auto;
            width: 35%;
            border: 2px solid #000000;
            padding: 15px; }
    </style>
</head>
<body>
<div class="center">
    <img alt="img" src="data:image/jpg;base64,${foto}" width="200" height="200"/><br>
    <br href="/:${contextPath}/profile/${user.getid()}">
    <br/>ID: ${user.getid()}<br/>
    <br/>AD: ${user.username}<br/>
    <br/>SOYAD: ${user.lastname}<br/>
    <br/>E-MAİL: ${user.email}<br/>
</div>
</body>
</html>