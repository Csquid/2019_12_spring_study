<%--
  Created by IntelliJ IDEA.
  User: lake0019
  Date: 2019-12-19
  Time: 오후 7:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main-content member-content">
  <h1>Member Page</h1>
  <hr>
  <img src="/resources/images/default_user_icon.png" alt="member-icon" width="80px"
       style="vertical-align: bottom; background: white; border-radius: 50%; border: 2px black solid;">
  <h4 style="display: inline-block;">CodeMonkey</h4>
  <hr>
  <!-- Input_ID -->
  <div class="input-group mb-3">
    <div class="input-group-prepend" style="width: 130px;">
      <span class="input-group-text" style="width: 100%;">ID</span>
    </div>
    <input type="text" class="form-control" value="lake0019" disabled="true" style="background: white;">
  </div>
  <!-- Input_Name -->
  <div class="input-group mb-3">
    <div class="input-group-prepend" style="width: 130px;">
      <span class="input-group-text" style="width: 100%;">Name</span>
    </div>
    <input type="text" class="form-control" value="정준영" disabled="true" style="background: white;">
  </div>
  <!-- Input_Alias -->
  <div class="input-group mb-3">
    <div class="input-group-prepend" style="width: 130px;">
      <span class="input-group-text" id="inputGroup-sizing-sm" style="width: 100%;">Alias</span>
    </div>
    <input type="text" class="form-control" value="CodeMonkey" disabled="true" style="background: white;">
  </div>
  <!-- Select Gender -->
  <div class="input-group mb-3">
    <div class="input-group-prepend" style="width: 130px;">
      <label class="input-group-text" style="width: 100%;">Gender</label>
    </div>
    <input type="text" class="form-control" value="Man" disabled="true" style="background: white;">
  </div>
  <!-- Input Address -->
  <div class="input-group mb-3">
    <div class="input-group-prepend" style="width: 130px;">
      <label class="input-group-text" style="width: 100%;">Address</label>
    </div>
    <input type="text" class="form-control" value="Daegu" disabled="true" style="background: white;">
  </div>
  <!-- Member Profile Image -->
  <div class="input-group mb-3">
    <div class="input-group-prepend" style="width: 130px;">
      <label class="input-group-text" style="width: 100%;">Profile Photo</label>
    </div>
    <img src="/resources/images/default_user_icon.png" alt="member-icon" width="200px"
         style="vertical-align: bottom; background: white; border: 2px black solid; margin-left: 10px;">
    <button type="button" class="btn btn-outline-dark" style="width: 46%; margin-left: 10px;">Replace Image</button>
  </div>
  <button type="button" class="btn btn-outline-dark" id="submit-register" style="width: 100%;">Modify</button>
  <button type="button" id="modal-setting" class="btn btn-secondary" data-toggle="modal"
          data-target="#exampleModalCenter">
    Launch demo modal
  </button>

  <!-- Modal -->
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
       aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Change Profile Image</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>

        <!-- Modal Body -->
        <div class="modal-body" style="width: 100%; text-align: center;">
          <div style="width: 200px; display: inline-block;">
            <h3 style="text-align: center;">현재 아이콘</h3>
            <img src="/resources/images/default_user_icon.png" alt="member-icon" id="member-icon-square"
                 style="margin-left: 0px;">
            <input type="file" name="file" id="file1" style="margin-left: 0px; margin-top: 10px;" value="">
          </div>
        </div>

        <div class="modal-footer" style="justify-content: center;">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" style="float: left;">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>

      </div>
    </div>
  </div>

</div>