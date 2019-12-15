package com.code.monkey.mapper;

import com.code.monkey.vo.MemberVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {
    List<MemberVO> searchMembers();
    MemberVO searchMemberID(MemberVO vo);
    MemberVO searchMemberAlias(MemberVO vo);
    int insertMember(MemberVO vo);
}
