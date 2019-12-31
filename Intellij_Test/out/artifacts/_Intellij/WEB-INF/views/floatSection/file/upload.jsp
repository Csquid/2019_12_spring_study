<%--
  Created by IntelliJ IDEA.
  User: lake0019
  Date: 2019-12-17
  Time: 오후 6:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"
        integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
<!-- form enctype="multipart/form-data"를 적어줘야 한다. -->
<form method="post" action="upload_test" enctype="multipart/form-data" id="img-upload-form">
  <label>email:</label>
  <input type="text" name="email">
  <br><br>
  <label>파일:</label>
  <input type="file" name="file1" id="file">
  <br><br>
  <input type="submit" value="upload" id="img-send">
</form>

<script>
  const form = $("#img-upload-form");
  const reg = /(.*?)\.(jpg|jpeg|png|gif|bmp)$/;
  let sendStatus = {
    signal: false,              //default: false
    detail: "file is null"      //default: "file is null"
  };

  $(document).ready(function () {
    $("#file").on("change", function () {
      const file = $("#file").val().toLowerCase();

      console.log(file);

      if (file.match(reg)) {
        sendStatus.signal = true;
      } else {
        alert("해당 파일은 이미지 파일 아닙니다.");
        sendStatus.signal = false;
        sendStatus.detail = "This is not an image file."
      }
    });
  });

  $(function () {
    $("#img-send").click(function (e) {
      //이벤트 발생을 막음
      e.preventDefault();

      if (sendStatus.signal) {
        form[0].submit();
      } else {
        switch (sendStatus.detail) {
          case "file is null":
            alert("파일을 확인해주세요.");
            break;
          case "This is not an image file.":
            alert("이미지 파일이 아닙니다.");
            break;
        }
      }
    });
  });
</script>