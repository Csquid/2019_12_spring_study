<%--
  Created by IntelliJ IDEA.
  User: lake0019
  Date: 2019-12-10
  Time: 오후 7:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="register-content" style="padding-top: 11%;">
    <h1 style="text-align: center;">Register</h1> <br />
    <!-- Input_ID -->
    <div class="input-group mb-3">
        <div class="input-group-prepend" style="width: 130px;">
            <span class="input-group-text" id="member-id" style="width: 100%;">ID</span>
        </div>
        <input type="text" class="form-control" placeholder="ID" aria-label="Example text with button addon"
               aria-describedby="button-addon1">
        <div class="input-group-prepend">
            <button class="btn btn-outline-secondary" type="button" id="button-member-id">중복 체크</button>
        </div>
    </div>
    <!-- Input_Alias -->
    <div class="input-group mb-3">
        <div class="input-group-prepend" style="width: 130px;">
            <span class="input-group-text" id="member-alias" style="width: 100%;">Alias</span>
        </div>
        <input type="text" class="form-control" placeholder="Alias" aria-label="Example text with button addon"
               aria-describedby="button-addon1">
        <div class="input-group-prepend">
            <button class="btn btn-outline-secondary" type="button" id="button-member-alias">중복 체크</button>
        </div>
    </div>
    <!-- Input Password -->
    <div class="input-group mb-3">
        <div class="input-group-prepend" style="width: 130px;">
            <span class="input-group-text" id="password-first" style="width: 100%;">Password</span>
        </div>
        <input type="password" class="form-control" placeholder="" aria-label="Example text with button addon"
               aria-describedby="button-addon1">
    </div>
    <!-- Input Confirm Password -->
    <div class="input-group mb-3">
        <div class="input-group-prepend" style="width: 130px;">
            <span class="input-group-text" id="password-second" style="width: 100%;">Password</span>
        </div>
        <input type="password" class="form-control" placeholder="" aria-label="Example text with button addon"
               aria-describedby="button-addon1">
        <div class="input-group-prepend">
            <button class="btn btn-outline-secondary" type="button" id="button-password">비밀번호 확인</button>
        </div>
    </div>
    <!-- Select Gender -->
    <div class="input-group mb-3">
        <div class="input-group-prepend" style="width: 130px;">
            <label class="input-group-text" for="member-gender" style="width: 100%;">Gender</label>
        </div>
        <select class="custom-select" id="member-gender">
            <option value="man">Man</option>
            <option value="woman" selected>WoMan</option>
        </select>
    </div>
    <!-- Input Address -->
    <div class="input-group mb-3">
        <div class="input-group-prepend" style="width: 130px;">
            <label class="input-group-text" for="address" style="width: 100%;">Address</label>
        </div>
        <input type="text" class="form-control" placeholder="Address" id="address"
               aria-label="Example text with button addon" aria-describedby="button-addon1">
    </div>

    <button type="button" class="btn btn-secondary" style="width: 50%;">Cancel</button>
    <button type="button" class="btn btn-secondary" style="width: 49%;">Create</button>
</div>