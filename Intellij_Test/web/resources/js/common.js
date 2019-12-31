function inputDisabled(check) {
  inputDatas.each(function (index, element) {
    if (element.type === "text") {
      console.log(element);

      if (check || element.id === "modify-id") { //true
        element.setAttribute("disabled", "");
      } else {
        element.removeAttribute("disabled");
      }

    }
  });
}
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