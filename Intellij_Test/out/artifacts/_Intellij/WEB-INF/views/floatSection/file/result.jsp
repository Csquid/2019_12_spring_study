<%--
  Created by IntelliJ IDEA.
  User: lake0019
  Date: 2019-12-18
  Time: 오후 3:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h1>Upload completed</h1>

<div class="result-images">
  <img src="${pageContext.request.contextPath }${url }" style="width:150px">
</div>

<p> <a href='/fileupload/form'> 다시 업로드 하기 </a> </p>

