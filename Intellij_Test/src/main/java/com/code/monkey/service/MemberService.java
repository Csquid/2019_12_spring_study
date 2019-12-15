package com.code.monkey.service;

import com.code.monkey.mapper.MemberMapper;
import com.code.monkey.vo.MemberVO;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class MemberService {
    //private MemberDAO memberDao;
    private MemberMapper memberMapper;

    public List<MemberVO> selectMembers() {
        return memberMapper.searchMembers();
    }

    public MemberVO searchMemberID(MemberVO vo) {
        return memberMapper.searchMemberID(vo);
    }

    public MemberVO searchMemberAlias(MemberVO vo) {
        return memberMapper.searchMemberAlias(vo);
    }

    public int insertMember(MemberVO vo) {
        return memberMapper.insertMember(vo);
    }

}
