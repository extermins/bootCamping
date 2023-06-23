package com.bootcamping.serviceImpl.admin;

import com.bootcamping.domain.DTO.MenuDTO;
import com.bootcamping.domain.VO.MenuVO;
import com.bootcamping.mapper.admin.AdminMenuMapper;
import com.bootcamping.service.admin.AdminMenuService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class AdminMenuServiceImpl implements AdminMenuService {
    private final ModelMapper modelMapper;
    private final AdminMenuMapper adminMenuMapper;

    @Override
    public void addMenu(MenuDTO menuDTO) {
        MenuVO menuVO = modelMapper.map(menuDTO,MenuVO.class);
        adminMenuMapper.addMenu(menuVO);
    }

    @Override
    public List<MenuDTO> getAllMenu() {
        return adminMenuMapper.getAllMenu();
    }

    @Override
    public void modify(MenuDTO menuDTO) {
        log.info("menuService Modify...");
        MenuVO menuVO = modelMapper.map(menuDTO, MenuVO.class);
        log.info(menuVO);
        adminMenuMapper.modifyMenu(menuVO);
    }

    @Override
    public void updateAmount(int mid, int amount) {
        adminMenuMapper.updateAmount(mid,amount);
    }

    @Override
    public void deleteMenu(int mid) {
        adminMenuMapper.deleteMenu(mid);
    }


}
