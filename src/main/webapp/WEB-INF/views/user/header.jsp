<%--
  Created by IntelliJ IDEA.
  User: RA
  Date: 26.07.2018
  Time: 12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">


        <ul class="nav navbar-nav">
            <li><a href="${contextPath}/welcome">Ana Sayfa</a></li>
            <li><a href="${contextPath}/addAlien">Kayıt Ol</a></li>
            <li><a href="${contextPath}/lists">Listele</a></li>
        </ul>

        <ul class="nav navbar-nav navbar-right">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>

                <a onclick="document.forms['logoutForm'].submit()"><span class="glyphicon glyphicon-log-out"></span>Çıkış Yap</a>
            </c:if>
        </ul>

    </div>
</nav>


</body>
</html>
