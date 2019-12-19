package com.code.monkey.vo;

import lombok.Data;

@Data
public class ProfileImageVO {
  private int profile_img_idx;
  private int member_idx;
  private String creation_date;
  private int file_size;
  private String original_file_name;
  private String stored_file_name;
  private String file_path;
}
