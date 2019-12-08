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

    public MemberVO selectMember(String id) {
        MemberVO memberVO = memberMapper.selectMember(id);

        System.out.println("MemberDTO:" + memberVO.toString());
        return memberVO;
    }

    public List<MemberVO> selectMembers() {
        List<MemberVO> memberVOs = memberMapper.selectMembers();

        return memberVOs;
    }
}
