package com.bootcamping.mapper.ripple;

import com.bootcamping.domain.DTO.RippleDTO;
import com.bootcamping.domain.VO.RippleVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RippleMapper {
    void addRipple(RippleVO rippleVO);

    List<RippleVO> getListRipple(int boardnum);

    RippleDTO getOneRipple(int rippleid);

    void deleteRipple(int rippleid);

    int rippleCount(int boardnum);
}
