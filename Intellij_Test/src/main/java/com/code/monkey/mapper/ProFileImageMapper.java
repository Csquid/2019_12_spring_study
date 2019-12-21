package com.code.monkey.mapper;

import com.code.monkey.vo.ProfileImageVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface ProFileImageMapper {
  ProfileImageVO selectImgFile(@Param("member_idx")int member_idx);
}