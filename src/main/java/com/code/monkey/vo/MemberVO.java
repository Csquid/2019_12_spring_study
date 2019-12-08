package com.code.monkey.vo;

import lombok.Data;

@Data
public class MemberVO {
    private int member_idx;
    private String member_id;
    private String member_pw;
    private String member_name;
    private String member_gender;
    private String member_address;
    private String member_role;
}
