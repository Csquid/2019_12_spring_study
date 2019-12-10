<%--
  Created by IntelliJ IDEA.
  User: lake0019
  Date: 2019-12-05
  Time: 오후 3:47
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@include file="Common/manageJS.jsp" %>
<%@include file="Common/manageCss.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="ie=edge" http-equiv="X-UA-Compatible">
  <title>Document</title>
</head>
<body>
<div class="header">
  <%@include file="fixSection/header.jsp" %>
</div>
<div class="main">
  <c:choose>
    <c:when test="${page == 'home'}">
      <%@include file="floatSection/home.jsp"%>
    </c:when>
    <c:when test="${page == 'sub1_Tab'}">
      <%@include file='floatSection/subs/sub1_Tab.jsp'%>
    </c:when>
  </c:choose>
</div>
<div class="footer">

</div>
</body>
</html>


