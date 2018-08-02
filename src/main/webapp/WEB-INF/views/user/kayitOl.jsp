<%--
  Created by IntelliJ IDEA.
  User: RA
  Date: 16.07.2018
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<html>
<head>
    <title>Title</title>

</head>
<body>

<div class="container">
<h2 align="center"> Kayıt Ol</h2>
<form method="post" action="/addAlien" align="center" enctype="multipart/form-data">

    <div class="form-group" align="center">
        <div class="form-group">
            </br>  <input type="text" name="firstname" class="form-control"  placeholder="AD" style="width: 250px" style="height:250px" required="required"></br>
        </div>
        <div class="form-group">
            </br>  <input type="text" name="lastname" class="form-control"  placeholder="SOYAD"  style="width: 250px" style="height:250px" required="required"></br>
        </div>
        <div class="form-group">
            </br>  <input type="email" name="email" class="form-control"  placeholder="E-MAIL"  style="width: 250px" style="height:250px" required="required"></br>
        </div>
        <div class="form-group">
            </br>  <input type="password" name="password" class="form-control"  placeholder="SİFRE"  style="width: 250px" style="height:250px" required="required"></br>
        </div>
        <div class="form-group">
            </br><input type="file" name="file"  align="center"></br>
        </div>
    </div>

    </br><br><input type="submit" class="btn btn-primary"><br><br>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
</div>

</body>
</html>
