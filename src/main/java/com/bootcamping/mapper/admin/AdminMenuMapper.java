package com.bootcamping.mapper.admin;

import com.bootcamping.domain.DTO.MenuDTO;
import com.bootcamping.domain.VO.MenuVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMenuMapper {
    void addMenu(MenuVO menuVO);

    List<MenuDTO> getAllMenu();

    void modifyMenu(MenuVO menuVO);

    void updateAmount(int mid,int amount);

    void deleteMenu(int mid);

}
