package com.bootcamping.serviceImpl.member;

import com.bootcamping.domain.DTO.MemberDTO;
import com.bootcamping.domain.VO.MemberVO;
import com.bootcamping.mapper.member.MemberLoginMapper;
import com.bootcamping.mapper.member.MemberProfileMapper;
import com.bootcamping.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberLoginMapper memberLoginMapper;
    private final MemberProfileMapper memberProfileMapper;
    private final ModelMapper modelMapper;
    @Override
    public MemberDTO MemberLogin(MemberDTO memberDTO) {
        MemberVO memberVO = modelMapper.map(memberDTO,MemberVO.class);
        MemberDTO dto = memberLoginMapper.memberLogin(memberVO);
        return dto;
    }

    @Override
    public boolean isExistId(MemberDTO memberDTO) {
        MemberVO memberVO= modelMapper.map(memberDTO,MemberVO.class);

        if (memberProfileMapper.isExistId(memberVO)>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public void insert(MemberDTO memberDTO) {
        MemberVO memberVO= modelMapper.map(memberDTO,MemberVO.class);
        memberProfileMapper.insertMember(memberVO);
    }

    @Override
    public void updateMember(MemberDTO memberDTO) {
        MemberVO memberVO= modelMapper.map(memberDTO,MemberVO.class);
        log.info(memberVO);
        memberProfileMapper.updateMember(memberVO);
    }

    @Override
    public boolean passwordCheck(MemberDTO memberDTO,String password) {
        MemberDTO dto = memberProfileMapper.passwordCheck(password,memberDTO.getMid());
        if (dto != null){
            return true;
        }else {
            return false;
        }
    }

//  로그인시에 uuid를 로그인처리
    @Override
    public void updateRememberme(MemberDTO memberDTO, String rememberme) {
        MemberVO memberVO = modelMapper.map(memberDTO,MemberVO.class);
        memberLoginMapper.updateRememberme(memberVO,rememberme);
    }

    @Override
    public MemberDTO getByUUID(String uuid) {
        MemberVO memberVO = memberLoginMapper.getRememberme(uuid);
        MemberDTO dto = modelMapper.map(memberVO,MemberDTO.class);
        return dto;
    }

    @Override
    public MemberDTO getOneMember(int mid) {
        return modelMapper.map(memberProfileMapper.getOneMember(mid),MemberDTO.class);

    }


}
