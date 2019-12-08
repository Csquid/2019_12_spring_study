package com.spring.mapper;

import com.spring.dto.MemberDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    MemberDTO selectMember(String id);
}
