package com.code.monkey.vo;

import lombok.Data;

@Data
public class MemberVO {
    private int member_idx;            //default
    private int level;                 //default: 1
    private String id;
    private String pw;
    private String name;
    private String alias;
    private String gender;
    private String address;
    private String role;         //default: 'iron'

    private ProfileImageVO fileImgData;
}
