<%--
  Created by IntelliJ IDEA.
  User: lake0019
  Date: 2019-12-05
  Time: 오후 3:47
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@include file="fixSection/header.jsp"%>
<c:choose>
  <c:when test="${page == 'home'}">
    <%@include file="floatSection/home.jsp"%>
  </c:when>
  <c:when test="${page == 'sub1_Tab'}">
    <%@include file='floatSection/subs/sub1_Tab.jsp'%>
  </c:when>
</c:choose>

<%--
<c:choose>
  <c:when test="${page == 'home' || page == null}">
    <%@include file='floatSection/home.jsp'%>
  </c:when>
  <c:when test="${page == 'sub1_Tab'}">
    <%@include file='floatSection/subs/sub1_Tab.jsp'%>
  </c:when>
  <c:when test="${page == 'sub2_Tab'}">
    <%@include file='floatSection/subs/sub2_Tab.jsp'%>
  </c:when>
  <c:when test="${page == 'sub3_Tab'}">
    <%@include file='floatSection/subs/sub3_Tab.jsp'%>
  </c:when>
  <c:when test="${page == 'parallax'}">
    <%@include file='floatSection/parallax.jsp'%>
  </c:when>
  <c:when test="${page == 'admin'}">
    <%@include file='floatSection/adminPage/adminPage.jsp'%>
  </c:when>
  <c:when test="${page == 'admin_table'}">
    <%@include file='floatSection/adminPage/adminPageUserTable.jsp'%>
  </c:when>
  <c:when test="${page == 'admin_user_table_search'}">
    <%@include file='floatSection/adminPage/adminPageUserTableSearch.jsp'%>
  </c:when>
  <c:when test="${page == 'admin_user_table_modify'}">
    <%@include file='floatSection/adminPage/adminPageUserTableModify.jsp'%>
  </c:when>
  <c:when test="${page == 'board'}">
    <%@include file='floatSection/boardPage/boardList.jsp'%>
  </c:when>
  <c:when test="${page == 'board_create'}">
    <%@include file='floatSection/boardPage/boardCreate.jsp'%>
  </c:when>
  <c:when test="${page == 'board_modify'}">
    <%@include file='floatSection/boardPage/boardModify.jsp'%>
  </c:when>
  <c:when test="${page == 'board_view'}">
    <%@include file='floatSection/boardPage/boardView.jsp'%>
  </c:when>
</c:choose>
--%>
