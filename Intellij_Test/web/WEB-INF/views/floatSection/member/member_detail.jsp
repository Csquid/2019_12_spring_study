<%--
  Created by IntelliJ IDEA.
  User: lake0019
  Date: 2019-12-21
  Time: 오전 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-content member-content">
  <script src="https://code.jquery.com/jquery-3.4.1.js"
          integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
          crossorigin="anonymous"></script>
  <h1>Member Page</h1>
  <hr>
  <img src="${pageContext.request.contextPath}/resources/images/default_user_icon.png" alt="member-icon"
       class="member-icon-round profile">
  <h4 style="display: inline-block;">${ sessionScope.userInfo.id }</h4>
  <hr>
  <!-- Input_ID -->
  <div class="input-group mb-3">
    <div class="input-group-prepend">
      <span class="input-group-text">ID</span>
    </div>
    <input type="text" class="form-control white" value="${ sessionScope.userInfo.id }">
  </div>
  <!-- Input_Name -->
  <div class="input-group mb-3">
    <div class="input-group-prepend">
      <span class="input-group-text">Name</span>
    </div>
    <input type="text" class="form-control white" value="${ sessionScope.userInfo.name }">
  </div>
  <!-- Input_Alias -->
  <div class="input-group mb-3">
    <div class="input-group-prepend">
      <span class="input-group-text">Alias</span>
    </div>
    <input type="text" class="form-control white" value="${ sessionScope.userInfo.alias }">
  </div>
  <!-- Select Gender -->
  <div class="input-group mb-3">
    <div class="input-group-prepend">
      <label class="input-group-text">Gender</label>
    </div>
    <input type="text" class="form-control white" value="${ sessionScope.userInfo.gender }">
  </div>
  <!-- Input Address -->
  <div class="input-group mb-3">
    <div class="input-group-prepend">
      <label class="input-group-text">Address</label>
    </div>
    <input type="text" class="form-control white" value="${ sessionScope.userInfo.address }">
  </div>
  <!-- Member Profile Image -->
  <div class="input-group mb-3">
    <div class="input-group-prepend">
      <label class="input-group-text">Profile Photo</label>
    </div>
    <div style="width: 200px; margin-left: 10px">
      <img src="${pageContext.request.contextPath}/resources/images/default_user_icon.png" alt="member-icon" class="member-icon-square">
    </div>

  </div>
  <button type="button" class="btn btn-outline-dark" id="move-member-modify" style="width: 100%;">Modify</button>

  <script>
    const inputDatas = $("input");

    $(document).ready(function () {
      inputDisabled(true);
    });

    $("#move-member-modify").click( function () {
      location.href = "/move/member/profile/modify";
    });
  </script>
</div>