<%--
  Created by IntelliJ IDEA.
  User: lake0019
  Date: 2019-12-10
  Time: 오후 7:32
  To change this template use File | Settings | File Templates.
--%>
<!--
register - {id, pw, name != null}

-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-content register-content register-max-width" style="padding-top: 11%;">
  <div class="alerts">
    <div id="register-alert-overlap-id" class="alert alert-danger register-max-width" role="alert">
      <strong>아이디가 중복됩니다.</strong>
    </div>
    <div id="register-alert-overlap-alias" class="alert alert-danger register-max-width" role="alert">
      <strong>별명이 중복됩니다.</strong>
    </div>
    <!-- 아이디 중복 체크할때만 이벤트 발생 -->
    <div id="register-alert-input-null-id" class="alert alert-danger register-max-width" role="alert">
      <strong>아이디를 적어주세요.</strong>
    </div>
    <!-- 별명 중복 체크할때만 이벤트 발생 -->
    <div id="register-alert-input-null-alias" class="alert alert-danger register-max-width" role="alert">
      <strong>별명을 적어주세요.</strong>
    </div>
    <div id="register-alert-input-null-all" class="alert alert-danger register-max-width" role="alert">
      <strong>아이디, 패스워드, 이름을 필수로 적어주세요.</strong>
    </div>
    <div id="register-alert-not-equals-password" class="alert alert-danger register-max-width" role="alert">
      <strong>패스워드가 서로 다릅니다</strong>
    </div>
  </div>
  <h1 style="text-align: center;">Register</h1> <br/>
  <!-- Input_ID -->
  <div class="input-group mb-3">
    <div class="input-group-prepend" >
      <span class="input-group-text" style="width: 100%;">ID</span>
    </div>
    <input type="text" class="form-control" placeholder="ID" id="register-id"
           aria-label="Example text with button addon"
           aria-describedby="button-addon1">
    <div class="input-group-prepend">
      <button class="btn btn-outline-secondary" type="button" id="submit-overlap-check-id">중복 체크</button>
    </div>
  </div>
  <!-- Input_Name -->
  <div class="input-group mb-3">
    <div class="input-group-prepend" >
      <span class="input-group-text" style="width: 100%;">Name</span>
    </div>
    <input type="text" class="form-control" id="register-name" placeholder="Name" aria-describedby="button-addon1">
  </div>
  <!-- Input_Alias -->
  <div class="input-group mb-3">
    <div class="input-group-prepend" >
      <span class="input-group-text" style="width: 100%;">Alias</span>
    </div>
    <input type="text" class="form-control" id="register-alias" placeholder="Alias"
           aria-label="Example text with button addon"
           aria-describedby="button-addon1">
    <div class="input-group-prepend">
      <button class="btn btn-outline-secondary" type="button" id="submit-overlap-check-alias">중복 체크</button>
    </div>
  </div>
  <!-- Input Password -->
  <div class="input-group mb-3">
    <div class="input-group-prepend" >
      <span class="input-group-text" style="width: 100%;">Password</span>
    </div>
    <input type="password" class="form-control" id="password-first" placeholder=""
           aria-label="Example text with button addon"
           aria-describedby="button-addon1">
  </div>
  <!-- Input Confirm Password -->
  <div class="input-group mb-3">
    <div class="input-group-prepend" >
      <span class="input-group-text" style="width: 100%;">Password</span>
    </div>
    <input type="password" class="form-control" id="password-second" placeholder=""
           aria-label="Example text with button addon"
           aria-describedby="button-addon1">
    <div class="input-group-prepend">
      <button class="btn btn-outline-secondary" type="button" id="button-password">비밀번호 확인</button>
    </div>
  </div>
  <!-- Select Gender -->
  <div class="input-group mb-3">
    <div class="input-group-prepend" >
      <label class="input-group-text" for="register-gender" style="width: 100%;">Gender</label>
    </div>
    <select class="custom-select" id="register-gender">
      <option value="man">Man</option>
      <option value="woman" selected>WoMan</option>
    </select>
  </div>
  <!-- Input Address -->
  <div class="input-group mb-3">
    <div class="input-group-prepend" >
      <label class="input-group-text" for="register-address" style="width: 100%;">Address</label>
    </div>
    <input type="text" class="form-control" placeholder="Address" id="register-address"
           aria-label="Example text with button addon" aria-describedby="button-addon1">
  </div>

  <button type="button" class="btn btn-outline-dark" onclick="history.back();" style="width: 50%;">Cancel</button>
  <button type="button" class="btn btn-outline-dark" id="submit-register" style="width: 49%;">Create</button>
</div>