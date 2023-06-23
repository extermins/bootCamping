package com.bootcamping.service.member;

import com.bootcamping.domain.DTO.MemberDTO;

public interface MemberService {
    MemberDTO MemberLogin(MemberDTO memberDTO); // 로그인
    boolean isExistId(MemberDTO memberDTO); // ajax id 체크
    void insert(MemberDTO memberDTO); // 회원 등록
    void updateMember(MemberDTO memberDTO);
    boolean passwordCheck(MemberDTO memberDTO,String password);
    void updateRememberme(MemberDTO memberDTO,String rememberme);
    MemberDTO getByUUID(String uuid);

    MemberDTO getOneMember(int mid);
}
