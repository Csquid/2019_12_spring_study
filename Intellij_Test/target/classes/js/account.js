const l_id = $('#login-id');
const l_pw = $('#login-pw');

//l_object: login_object
const l_object = {
  id: l_id,
  pw: l_pw
};

const l_alert_null = $("#login-alert-input-null");
const l_alert_id = $("#login-alert-wrong-id");
const l_alert_pw = $("#login-alert-wrong-pw");

//l_alert_object: login_alert_object
const l_alert_object = {
  null: l_alert_null,
  id: l_alert_id,
  pw: l_alert_pw
};

const r_id = $("#register-id");
const r_pw_first = $("#password-first");
const r_pw_second = $("#password-second");
const r_name = $("#register-name");
const r_alias = $("#register-alias");
const r_gender = $("#register-gender");
const r_address = $("#register-address");

//r_object: register_object
const r_object = {
  id: r_id,
  pw: r_pw_first,
  name: r_name,
  alias: r_alias,
  gender: r_gender,
  address: r_address
};

//      $("#register-alert-input-null").css("display", "none");
//       $("#register-alert-not-equals-password").css("display", "none");

const r_alert_null_all = $("#register-alert-input-null-all");
const r_alert_null_id = $("#register-alert-input-null-id");
const r_alert_null_alias = $("#register-alert-input-null-alias");
const r_alert_neq_pw = $("#register-alert-not-equals-password");
const r_alert_overlap_id = $("#register-alert-overlap-id");
const r_alert_overlap_alias = $("#register-alert-overlap-alias");

const r_alert_object = {
  null: {
    all: r_alert_null_all,
    id: r_alert_null_id,
    alias: r_alert_null_alias
  },
  overlap: {
    id: r_alert_overlap_id,
    alias: r_alert_overlap_alias
  },
  pw: r_alert_neq_pw
};

$(function () {

  /* 만약 현재 주소가 /member/logout 이라면 root로 돌아가게 만듬. */
  if (location.href.indexOf("/member/logout") !== -1) {
    location.href = '/';
  }

  function loginInit() {
    $.each(l_object, function (index, item) {
      item.removeClass('is-valid');
      item.removeClass('is-invalid');
    });
    $.each(l_alert_object, function (index, item) {
      item.css("display", "none");
    });
  }

  function loginErrorAlert(err) {
    if (err === "Wrong ID or Empty Account") {
      l_object.id.addClass("is-invalid");
      l_alert_object.id.css("display", "block");
    } else if (err === "Wrong Password") {
      l_object.pw.addClass("is-invalid");
      l_alert_object.pw.css("display", "block");
    }
  }

  /* 로그인 처리 부분 */
  $("#submit-login").click(function () {
    loginInit();
    //만약 아이디 또는 패스워드를 적지 않았다면 에러 띄우기
    if (l_object.id.val() === '' || l_object.pw.val() === '') {

      $.each(l_object, function (index, item) {
        if (item.val() === '')
          item.addClass('is-invalid');
      });

      l_alert_object.null.css("display", "block");

      return;
    }

    const loginFormData = JSON.stringify({
      id: l_object.id.val(),
      pw: l_object.pw.val()
    });

    $.ajax({
      type: "POST",
      url: "/member/login",
      data: loginFormData,
      dataType: "json",
      contentType: "application/json",
      success: function (data) {
        console.log(data);
        if (data.signal === "success") { // 만약 로그인에 성공한다면 로그인창을 닫아준다.
          location.reload();
        } else {
          loginInit();
          loginErrorAlert(data.detail);
        }
      }
    });

  });

  function registerInit() {
    $.each(r_object, function (index, item) {
      console.log("break");
      item.removeClass('is-valid');
      item.removeClass('is-invalid');
    });

    r_alert_object.null.all.css("display", "none");
    r_alert_object.pw.css("display", "none");
    r_alert_object.overlap.id.css("display", "none");
    r_alert_object.overlap.alias.css("display", "none");
  }

  $("#submit-register").click(function () {
    registerInit();
    /* register 버튼 눌렀을때 만약 not null 중에 빈값이 있는경우 실행 */
    if(r_object.id.val() === '' || r_object.alias.val() === '' || r_object.name.val() === '' ||
        r_object.pw.val() === '' || r_object.address.val() === '' || r_object.gender.val() === '')
    {
      $.each(r_object, function (index, item) {
        if (item.val() === '') {
          item.addClass('is-invalid');
        } else {
          item.addClass('is-valid');
        }
      });

      r_alert_object.null.css("display", "block");

      return;
    }

    if (r_pw_first.val() !== r_pw_second.val()) {   //패스워드 첫번째와 두번재가 서로 다른경우
      $.each({r_pw_first, r_pw_second}, function (index, item) {
        item.addClass('is-invalid');
      });

      r_alert_object.pw.css("display", "block");
      return;
    }

    /*
    if (r_object.id.val() === '' || r_object.pw.val() === '' || r_object.name.val() === '') {
      $.each({r_id, r_pw_first, r_pw_second, r_name}, function (index, item) {
        if (item.val() === '') {
          item.addClass('is-invalid');
        } else {
          item.addClass('is-valid')
        }
      });

      r_alert_object.null.css("display", "block");

      return;
    } else if(r_pw_first.val() !== r_pw_second.val()) {   //패스워드 첫번째와 두번재가 서로 다른경우
      $.each({r_pw_first, r_pw_second}, function (index, item) {
        item.addClass('is-invalid');
      });

      r_alert_object.pw.css("display", "block");
      return;
    }
     */
    const registerFormData = JSON.stringify({
      id: r_object.id.val(),
      pw: r_object.pw.val(),
      name: r_object.name.val(),
      alias: r_object.alias.val(),
      gender: r_object.gender.val(),
      address: r_object.address.val()
    });

    $.ajax({
      type: "POST",
      url: "/member/register/create",
      data: registerFormData,
      dataType: "json",
      contentType: "application/json",
      success: function (data) {
        console.log(data);
        if (data.signal === "success") { // 회원가입 완료
          location.href = "/";
        } else {
          //만약 데이터가 중복이 된다면.
          if (data.overlap) {
            if (data.overlap_id) {
              r_object.id.addClass("is-invalid");
              r_alert_object.overlap_id.css("display", "block");
            }
            if (data.overlap_alias) {
              r_object.alias.addClass("is-invalid");
              r_alert_object.overlap_alias.css("display", "block");
            }
          }
        }
      }
    })
  });

  $("#submit-overlap-check-id").click(function () {
    registerInit();
    if (r_object.id.val() === '') {
      r_alert_object.null.id.css("display", "block");
      r_object.id.addClass("is-invalid");
      return;
    }

    const overlapFormData = JSON.stringify({
      id: r_object.id.val()
    });

    $.ajax({
      type: "POST",
      url: "member/register/overlap/id",
      data: overlapFormData,
      dataType: "json",
      contentType: "application/json",
      success: function (data) {
        console.log(data);
        //만약 중복이 아니라면 signal 을 success 로 받아온다.
        if (data.signal === "success") {
          alert("아이디가 중복되지 않습니다.");
        } else {
          alert("아이디가 중복 됩니다.");
        }
      }
    });

  });

  $("#submit-overlap-check-alias").click(function () {
    registerInit();
    if (r_object.alias.val() === '') {
      r_alert_object.null.alias.css("display", "block");
      r_object.alias.addClass("is-invalid");
      return;
    }

    const overlapFormData = JSON.stringify({
      alias: r_object.alias.val()
    });

    $.ajax({
      type: "POST",
      url: "member/register/overlap/alias",
      data: overlapFormData,
      dataType: "json",
      contentType: "application/json",
      success: function (data) {
        console.log(data);
        //만약 중복이 아니라면 signal 을 success 로 받아온다.
        if (data.signal === "success") {
          alert("별명이 중복되지 않습니다.");
        } else {
          alert("별명이 중복 됩니다.");
        }
      }
    });
  });
});

$('#logout').click(function () {
  window.location.href = "/member/logout";
});

$('#move-register').click(function () {
  window.location.href = "/member/register";
});

