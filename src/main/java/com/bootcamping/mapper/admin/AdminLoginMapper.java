package com.bootcamping.mapper.admin;

import com.bootcamping.domain.DTO.AdminDTO;
import com.bootcamping.domain.VO.AdminVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminLoginMapper {
    AdminDTO AdminLogin(AdminVO adminVO);
}
