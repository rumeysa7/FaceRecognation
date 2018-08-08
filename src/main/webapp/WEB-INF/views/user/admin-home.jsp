<%--
  Created by IntelliJ IDEA.
  User: RA
  Date: 31.07.2018
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>

    <title>Welcome</title>
</head>
<body>
<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <sec:authorize access="hasRole('ROLE_ADMIN')">
        <h2>Hosgeldin admin ${pageContext.request.userPrincipal.name} </h2>
        </sec:authorize>
        <sec:authorize access="hasRole('ROLE_GUEST')">
        <h2>Hosgeldin guest ${pageContext.request.userPrincipal.name} </h2>
        </sec:authorize>

    </c:if>
</div>

</body>
</html>