package com.bootcamping.serviceImpl.admin;

import com.bootcamping.domain.DTO.AdminDTO;
import com.bootcamping.domain.VO.AdminVO;
import com.bootcamping.mapper.admin.AdminLoginMapper;
import com.bootcamping.service.admin.AdminService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
@Log4j2
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {

    private final AdminLoginMapper adminLoginMapper;
    private final ModelMapper modelMapper;

    @Override
    public AdminDTO AdminLogin(AdminDTO adminDTO) {
        AdminVO adminVo = modelMapper.map(adminDTO,AdminVO.class);
        AdminDTO dto = adminLoginMapper.AdminLogin(adminVo);
        return dto;
    }
}
