package com.spring.dao;

import com.spring.dto.MemberDTO;
import com.spring.mapper.MemberMapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
    @Autowired
    private SqlSession sqlSession;

    public MemberDTO selectMember(final String id) {

        MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

        MemberDTO userDto = mapper.selectMember(id);

        return userDto;
    }
}
