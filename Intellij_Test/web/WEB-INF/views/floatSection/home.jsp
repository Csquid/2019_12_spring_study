<%--
  Created by IntelliJ IDEA.
  User: lake0019
  Date: 2019-12-06
  Time: 오후 3:34
  To change this template use File | Settings | File Templates.
--%>
<script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
<div class="content">

</div>
<div class="sidebar">
    <div class="login-area">
        <input type="text" placeholder="input your id" id="login-id" style="margin-bottom: 5px; width: 100%;"> <br>
        <input type="password" placeholder="input your password" id="login-pw" style="margin-bottom: 10px; width: 100%;"> <br>
        <button class="btn btn-primary btn-block" id="login-submit">Sign in</button>
        <button class="btn btn-primary btn-block" type="submit">Sign up</button>
    </div>
    <div class="todo-day">
        <h3>Today</h3>
        Walking <input type="checkbox" name="walking" class="walking"> <br>
        Walking <input type="checkbox" name="walking" class="walking"> <br>
        Walking <input type="checkbox" name="walking" class="walking"> <br>
        Running <input type="checkbox" name="walking" class="walking"> <br>
    </div>
    <div class="todo-day">
        <h3>Week</h3>
        Running <input type="checkbox" name="walking" class="walking"> <br>
        Running <input type="checkbox" name="walking" class="walking"> <br>
        Running <input type="checkbox" name="walking" class="walking"> <br>
    </div>
</div>

<script type="text/javascript">
    const l_id = $('#login-id');
    const l_pw = $('#login-pw');
    const l_object = {
        id : l_id,
        pw : l_pw
    };

    $(function () {
        $("#login-submit").click(function () {

            /*
            if (l_object.id.val() === '' || l_object.pw.val() === '') {

                $.each(l_object, function (index, item) {
                    if (item.val() === '')
                        item.addClass('is-invalid');
                });

                $("#login-alert-input-null").css("display", "block");
                $("#login-alert-wrong-id").css("display", "none");
                $("#login-alert-wrong-pw").css("display", "none");

                return;
            }
            */

            const loginFormData = JSON.stringify({
                id: $('#monkey-login-id').val(),
                pw: $('#monkey-login-pw').val()
            });

            $.ajax({
                type: "POST",
                url: "/member/login",
                data: loginFormData,
                dataType: "json",
                contentType: "application/json",
                success: function (data) {
                    console.log(data);
                    console.log("+");
                    if (data.signal == "success") { // 만약 로그인에 성공한다면 로그인창을 닫아준다.
                        modalLoginFrom.removeClass("show");
                        $(".modal-backdrop").remove("");

                        // 로그인 버튼 삭제
                        buttonLogin.css('display', 'none');

                        // 로그아웃 버튼 생성
                        buttonLogout.css('display', 'block');

                        console.log("break two");

                        // 유저 카드 생성
                        monkeyUserCard.css("display", "block");

                        // 로그인 성공 즉시 유저 아이디 영역에 아이디 문자열 추가
                        $("#sessionID").append(data.id);
                        if (data.userInfo.role === 'admin') {
                            $("#user-card-admin-page").css("display", "block");
                        }

                        location.reload();
                    } else {

                        // TODO: 만약 input 폼안에 null 유효성 css style이 들어있다면, 지우는 처리를
                        // 해준다.
                        console.log("break");
                        login_default_init(data.detail);

                    }
                }
            })

        })
    })
</script>