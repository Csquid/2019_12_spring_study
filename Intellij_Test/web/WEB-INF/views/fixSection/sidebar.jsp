<%--
  Created by IntelliJ IDEA.
  User: lake0019
  Date: 2019-12-17
  Time: 오전 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
          <!-- 이곳에 유저의 아이콘 이미지가 들어가며 만약 없을경우 default 이미지를 박아둔다.  -->
            <%--          <img src="/resources/images/default_user_icon.png" width="50%" style="background-color: white; border-radius: 50%">--%>
          <img src=${sessionScope.userInfo.fileImgData eq null ?
            "/resources/images/default_user_icon.png" : sessionScope.userInfo.fileImgData.file_path}
                       width="50%" style="background-color: white; border-radius: 50%; border: 3px black solid">
        </div>
        <div class="user-information">
          <h5 style="text-align: center; margin-top: .5rem; margin-bottom: 0;">${sessionScope.userInfo.id}</h5>
          <h5 style="text-align: center;">Lv. ${sessionScope.userInfo.level}</h5>
        </div>
        <button id="move-MyProfile" class="btn btn-primary btn-block" type="button">My Profile</button>
        <button id="logout" class="btn btn-primary btn-block" type="button">Logout</button>
      </div>
    </c:otherwise>
  </c:choose>

</div>