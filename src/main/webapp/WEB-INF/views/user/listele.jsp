<%--
  Created by IntelliJ IDEA.
  User: kadir
  Date: 17.07.2018
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script>

</head>
<body>
<c:if test="${not empty lists}">
<table class="table table-hover">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">AD</th>
        <th scope="col">SOYAD</th>
        <th scope="col">sil</th>



    </tr>
    </thead>
    <tbody>

    <ul>


        <c:forEach var="listValue" items="${lists}">

            <tr>
                <td>${listValue.getid()}</td>
                <td>${listValue.name}</td>
                <td>${listValue.lastname}</td>
                <td> <button class="btn btn-danger" onclick="this.disabled= true; location.href='${contextPath}/profile/${listValue.getid()}/delete'">Delete</button></td>
            <td><input type="button" class="btn btn-success" value="profil" onclick="location.href='${contextPath}/profile/${listValue.getid()}'" > <br></td>
            </tr>
        </c:forEach>

    </ul>

    </tbody>
</table>

</c:if>
</body>
</html>
