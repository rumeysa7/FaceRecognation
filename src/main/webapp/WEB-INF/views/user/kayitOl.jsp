<%--
  Created by IntelliJ IDEA.
  User: RA
  Date: 16.07.2018
  Time: 11:24
  To change this template use File | Settings | File Templates.
--%>
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

<div class="row">
    <div class="col-2"></div>
    <div class="col-8">

<h2 align="center"> Kayıt Ol</h2>

<form method="post" action="/addAlien" align="center" enctype="multipart/form-data">

    <div class="form-col">
        <div class="row">
            </br>  <input type="text" name="firstname" class="form-control" placeholder="AD"></br>
        </div>
        <div class="row">
            </br>  <input type="text" name="lastname" class="form-control" placeholder="SOYAD"></br>
        </div>
    </div>
    </br>
    <input type="file" name="file"></br><br>
    <input type="submit" class="btn btn-primary"><br><br>
    <input type="button" class="btn btn-success" value="Listele" onclick="location.href='${contextPath}/lists',' width=400,height=400'"> <br>

</form>

    </div>
    <div class="col-2"></div>
    </div>


</body>
</html>
