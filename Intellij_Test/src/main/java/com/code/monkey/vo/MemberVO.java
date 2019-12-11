package com.code.monkey.vo;

import lombok.Data;

@Data
public class MemberVO {
    private int idx;
    private String id;
    private String pw;
    private String name;
    private String alias;
    private String gender;
    private String address;
    private String role;
}
