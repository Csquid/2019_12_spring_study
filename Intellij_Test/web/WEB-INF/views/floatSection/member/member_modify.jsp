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
  <h4 style="display: inline-block;">CodeMonkey</h4>
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
      <img src="${pageContext.request.contextPath}/resources/images/default_user_icon.png" alt="member-icon"
           class="member-icon-square">
      <button type="button" class="btn btn-outline-dark" style="width: 100%; margin-top: 10px">Replace Image</button>
    </div>

  </div>
  <button type="button" class="btn btn-outline-dark" id="submit-modify" style="width: 100%;">Apply</button>

  <!-- Button to <Change Member Profile Image> Modal -->
  <button type="button" id="modal-setting" class="btn btn-secondary" data-toggle="modal"
          data-target="#changeMemberProfileImage">
    Change Profile Image
  </button>

  <!-- <Change Member Profile Image> Modal -->
  <div class="modal fade" id="changeMemberProfileImage" tabindex="-1" role="dialog"
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
            <h3 id="icon-help" style="text-align: center;">현재 아이콘</h3>
            <img src="${pageContext.request.contextPath}/resources/images/default_user_icon.png" alt="member-icon"
                 class="member-icon-square"
                 id="current-member-icon" style="margin-left: 0;">
            <input type="file" name="file" id="input-file-image" style="margin-left: 0; margin-top: 10px;">
            <button type="button" class="btn btn-outline-dark" id="change-default-image-icon">기본 이미지</button>
          </div>
        </div>
        <!-- Modal Footer -->
        <div class="modal-footer" style="justify-content: center;">
          <button type="button" class="btn btn-secondary" data-dismiss="modal" style="float: left;">Close</button>
          <button type="button" class="btn btn-primary" id="profile-image-submit">Save changes</button>
        </div>

      </div>
    </div>
  </div>
  <script !src="">
    /*
    *
    *   processCheck
    *     - null: 바뀐게 없음
    *         --> 1. 변동이 없다는 뜻
    *                  1.1. 경고 메세지를 뿌려주고 아무 동작 하지않음.
    *     - "change": 바껴야 한다.
    *         --> 1. 만약 전에 프로필 아이콘이 있었다:
    *                  1.1. 원래 있던 사진 데이터(서버에 남아있는)를 지우지 않고 DB 에서 profile_img -
    *                       전에 쓰던 사진의 이미지 테이블에서 해당 컬럼 값을 delete_whether(삭제 여부)를 'N'에서 'Y'로 바꾼다.
    *                       (차후에 일괄처리)
    *                  1.2. 새로운 사진 데이터를 DB에 등록한다.
    *                       데이터를 찾을때 profile_img 테이블에서 fk인 member_idx 와 delete_whether 값중 'N' 값을 비교하여
    *                       if (member_idx && delete_whether.equals('n')): 이런식으로 SELECT 쿼리를 날려서 값을 가져온다.
    *
    *         --> 2. 만약 전에 프로필이 없거나 또는 기본 아이콘이다 (즉 없다):
    *                  2.1. 새로운 사진 데이터를 DB에 등록한다. 끝.
    *     - "default": 기본 아이콘으로 바꾼다.
    *         --> 1. 원래 아이콘이 없다, 원래 기본 아이콘이다:
    *                  1.1 modal.close()로 닫음 -끝
    *             2. 원래 유저 아이콘이 있었다:
    *                  2.1. 원래 있던 사진 데이터(서버에 남아있는)를 지우지 않고 DB 에서 profile_img -
    *                       전에 쓰던 사진의 이미지 테이블에서 해당 컬럼 값을 delete_whether(삭제 여부)를 'N'에서 'Y'로 바꾼다.
    *                       (차후에 일괄처리)
    *
    *   processCheck 가 발생하는 시점:
    *     1. Choose File 을 하여 새로운 프로필 아이콘으로 변경하는경우
    *         --> processCheck: "change"
    *     2. 기본 이미지 버튼을 클릭하였을 경우
    *         --> processCheck: "default"
    *
    */
    const inputDatas = $("input");
    let processCheck = null;


    $("#change-default-image-icon").click(function () {
      //file 영역을 비어준다.
      //fileList 영역은 readOnly 라서 속성 또는 delete 로 삭제가 불가능하다. 그래서 value 값에 "" 을 넣어 초기화를 시켜준다.
      $("#input-file-image")[0].value = "";
      $("#current-member-icon").attr("src", "/resources/images/default_user_icon.png");
      processCheck = "default";
    });

    $(document).ready(function () {
      inputDisabled(false);
      $("#input-file-image").on("change", handleImgFile);
    });

    $("#profile-image-submit").click(function () {
      if (processCheck === null) {
        alert("변경이 없습니다.");
        return;
      } else if (processCheck === "change") {
        //현재 로그인한 유저의 파일이 null 인지 아닌지 체크.
        //즉 파일이 없기때문에 새로 만들어야함.
        if (${sessionScope.userInfo.fileImgData eq null}) {
          alert("true");
          //TODO: ajax로 통신하여 form 태그 ajax 연동하여 파일 db 연동하여 저장하기.
          //$.ajax()
        } else {
          alert("false");
        }
      }
    });


    /*
    *
    */
    function handleImgFile(e) {
      /*

      *** 원래 소스 ***

      const files = e.target.files;
      const filesArr = Array.prototype.slice.call(files);


      filesArr.forEach(function (f) {
        if(!f.type.match("image.*")) {
          alert("확장자는 이미지의 확장자만 가능합니다.");
          return;
        }

        let reader = new FileReader();
        //reader.readAsDataURL(f);
        reader.onload = function (e) {
          console.log("break 2");
          $("#current-member-icon").attr("src", e.target.result);
        };
        reader.readAsDataURL(f);
      });
      */

      /*
      *    *** 수정 소스 ***
      */
      const file = e.target.files[0];
      if (!file.type.match("image.*")) {
        alert("확장자는 이미지 확장자만 가능합니다.");
        return;
      }

      let reader = new FileReader();

      reader.readAsDataURL(file);
      reader.onload = function (e) {
        $("#icon-help")[0].innerText = "바뀔 아이콘";
        $("#current-member-icon").attr("src", e.target.result);
        processCheck = "change";
      }
    }
  </script>
</div>