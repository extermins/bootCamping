package com.bootcamping.serviceImpl.ripple;

import com.bootcamping.domain.DTO.RippleDTO;
import com.bootcamping.domain.VO.RippleVO;
import com.bootcamping.mapper.ripple.RippleMapper;
import com.bootcamping.service.member.MemberService;
import com.bootcamping.service.ripple.RippleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class RippleServiceImpl implements RippleService {

    private final ModelMapper modelMapper;
    private final RippleMapper rippleMapper;
    private final MemberService memberService;

    @Override
    public void addRipple(RippleDTO rippleDTO) {
        log.info("addRipple()...");
        RippleVO rippleVO = modelMapper.map(rippleDTO, RippleVO.class);
        log.info(rippleVO);
        rippleMapper.addRipple(rippleVO);
        log.info(rippleVO);
    }

    @Override
    public List<RippleDTO> getListRipple(int boardnum) {
        log.info("getListRipple()...");
        List<RippleDTO> listRipple = rippleMapper.getListRipple(boardnum)
                .stream().map(m -> modelMapper.map(m, RippleDTO.class)).collect(Collectors.toList());
        for(RippleDTO list : listRipple) {
            list.setMemberDTO(memberService.getOneMember(list.getMemberid()));
        }
        return listRipple;
    }


    @Override
    public RippleDTO getOneRipple(int rippleid) {
        log.info("getOneRipple()...");
        RippleDTO rippleDTO = rippleMapper.getOneRipple(rippleid);
        rippleDTO.setMemberDTO(memberService.getOneMember(rippleDTO.getMemberid()));
        return rippleDTO;
    }

    @Override
    public void deleteRipple(int rippleid) {
        log.info("deleteRipple()...");
        rippleMapper.deleteRipple(rippleid);
    }

}
