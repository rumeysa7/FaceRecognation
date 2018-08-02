<%--
  Created by IntelliJ IDEA.
  User: RA
  Date: 30.07.2018
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>

    <title>Login</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


</head>

<body>

<div class="container">

    <form method="POST" align="center" action="${contextPath}/login" class="form-signin">
        <h2 class="form-heading" style="font-family: Georgia">GİRİŞ YAP</h2>
        <div class="form-group" align="center">
        <div class="form-group  ${error != null ? 'has-error' : ''}">
            </br><span>${message}</span></br>
            </br>  <input type="email" name="username" class="form-control"  placeholder="Email" style="width: 250px" style="height:250px"></br>
            </br>  <input type="password" name="password" class="form-control"  placeholder="Parola"  style="width: 250px" style="height:250px" maxlength="6"></br>
            <span>${error}</span></br>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </br><button class="btn btn-primary btn-block" type="submit" style="width: 250px" style="height:250px">Giriş Yap</button></br>
            </br><button class="btn btn-info" style="width: 250px" style="height:250px"   onclick="this.disabled= true; location.href='${contextPath}/addAlien'">Kayıt Olmak İçin Tıklayınız...</button>
        </div>
        </div>
    </form>

</div>

</body>
</html>