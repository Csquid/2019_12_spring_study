<%--
  Created by IntelliJ IDEA.
  User: lake0019
  Date: 2019-12-05
  Time: 오후 3:47
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@include file="Common/manageCss.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Planner Community</title>
</head>
<body>
<div class="header">
  <%@include file="fixSection/header.jsp" %>
</div>
<div class="main monkey-max-width">
  <div class="content">
    <c:choose>
      <c:when test="${page == 'home'}">
        <%@include file="floatSection/home.jsp" %>
      </c:when>
      <c:when test="${page == 'sub1_Tab'}">
        <%@include file='floatSection/subs/sub1_Tab.jsp' %>
      </c:when>
      <c:when test="${page == 'register'}">
        <%@include file='floatSection/member/register_component.jsp' %>
      </c:when>
      <c:when test="${page == 'imgUpload'}">
        <%@include file="floatSection/file/upload.jsp"%>
      </c:when>
      <c:when test="${page == 'result'}">
        <%@include file="floatSection/file/result.jsp"%>
      </c:when>
      <c:when test="${page == 'myProfile'}">
        <%@include file="floatSection/member/member_detail.jsp"%>
      </c:when>
    </c:choose>
  </div>
  <div class="sidebar">
    <%@include file="fixSection/sidebar.jsp"%>
  </div>
</div>
<div class="footer">
  <%@include file="fixSection/footer.jsp" %>
</div>
<div class="links">
  <%@include file="Common/manageJS.jsp" %>
</div>
</body>
</html>



