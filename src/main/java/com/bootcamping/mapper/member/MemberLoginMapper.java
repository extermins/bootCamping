package com.bootcamping.mapper.member;

import com.bootcamping.domain.DTO.MemberDTO;
import com.bootcamping.domain.VO.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberLoginMapper {
    MemberDTO memberLogin(MemberVO memberVO);

    void updateRememberme(MemberVO memberVO,String rememberme);

    MemberVO getRememberme(String uuid);
}
