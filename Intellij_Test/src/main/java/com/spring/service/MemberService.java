package com.spring.service;

import com.spring.dto.MemberDTO;
import com.spring.mapper.MemberMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class MemberService {
    //private MemberDAO memberDao;
    private MemberMapper memberMapper;

    public MemberDTO selectMember(String id) {
        /*
        MemberDTO memberDto = null;
        if(memberDao != null) {
            memberDto = memberDao.selectMember(id);
        } else {
            System.out.println("Null");
        }
        */
        MemberDTO memberDto = memberMapper.selectMember(id);

        System.out.println("MemberDTO:" + memberDto.toString());
        return memberDto;
    }
}
