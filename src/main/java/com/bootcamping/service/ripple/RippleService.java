package com.bootcamping.service.ripple;

import com.bootcamping.domain.DTO.RippleDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RippleService {
    void addRipple(RippleDTO rippleDTO);

    List<RippleDTO> getListRipple(int boardnum);

    RippleDTO getOneRipple(int rippleid);

    void deleteRipple(int rippleid);
}
