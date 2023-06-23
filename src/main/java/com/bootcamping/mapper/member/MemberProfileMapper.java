package com.bootcamping.mapper.member;

import com.bootcamping.domain.DTO.MemberDTO;
import com.bootcamping.domain.VO.MemberVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberProfileMapper {
    int isExistId(MemberVO memberVO);

    void insertMember(MemberVO memberVO);

    void updateMember(MemberVO memberVO);

    void deleteMember(int memberId);

    MemberDTO passwordCheck(String password,int mid);

    MemberVO getOneMember(int mid);


}
