package com.code.monkey.mapper;

import com.code.monkey.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {
    List<MemberVO> selectMembers();
    MemberVO selectMember(String id);
}
