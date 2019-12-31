package com.code.monkey.vo;

import lombok.Data;

@Data
public class ProfileImageVO {
  private int profile_img_idx;
  private int member_idx;
  private int file_size;
  private String creation_date;
  private String original_file_name;
  private String stored_file_name;
  private String file_path;
  private String delete_whether;
  private String extension;
}

/*

  creation_date: 생성된 날짜
  file_size: 파일 사이즈
  original_file_name: 원래 이름
  stored_file_name: 저장된 이름
  file_path: 파일이 저장된 위치
  delete_whether: 삭제 여부   --> 나중에 일괄 처리 한다.

*/