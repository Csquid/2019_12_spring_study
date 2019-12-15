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
  <title>Document</title>
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
    </c:choose>
  </div>
  <div class="sidebar">
    <div class="login-area">
      <!-- is-valid -->
      <!-- is-invalid -->
      <!-- 만약 세션에 유저 정보가 empty 즉 null 이라면 로그인을 할수있는 창을 띄우며 그것이 아니면 유저의 정보를 띄운다. -->
      <c:choose>
        <c:when test="${empty sessionScope.userInfo}">
          <div class="login-before" style="display: inline">
            <input type="text" id="login-id" class="form-control"
                   style="margin-bottom: 5px; width: 100%;" placeholder="input your id">
            <input type="password" id="login-pw" class="form-control"
                   style="margin-bottom: 10px; width: 100%;" placeholder="input your password">

            <button class="btn btn-primary btn-block" id="submit-login">Sign in</button>
            <button class="btn btn-primary btn-block" id="move-register" type="submit">Sign up</button>
          </div>
        </c:when>
        <c:otherwise>
          <div class="login-after" style="display: inline">
            <div class="user-avatar" style="text-align: center;">
              <img src="/resources/images/programmer-icon.jpg" width="50%" style="background-color: white">
            </div>
            <div class="user-information">
              <h5 style="text-align: center; margin-top: .5rem; margin-bottom: 0;">${sessionScope.userInfo.id}</h5>
              <h5 style="text-align: center;">Lv. 1</h5>
            </div>
            <button id="logout" class="btn btn-primary btn-block" type="button">Logout</button>
          </div>
        </c:otherwise>
      </c:choose>

    </div>
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



