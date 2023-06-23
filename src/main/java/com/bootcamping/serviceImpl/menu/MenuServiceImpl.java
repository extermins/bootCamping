package com.bootcamping.serviceImpl.menu;

import com.bootcamping.domain.DTO.MenuDTO;
import com.bootcamping.domain.VO.MenuVO;
import com.bootcamping.mapper.menu.MenuMapper;
import com.bootcamping.service.menu.MenuService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class MenuServiceImpl implements MenuService {

    private final MenuMapper menuMapper;
    private final ModelMapper modelMapper;

    @Override
    public List<MenuDTO> list() {
        List<MenuVO> voList = menuMapper.listMenu();
        List<MenuDTO> dtoList = new ArrayList<>();
        for(MenuVO menuVO : voList){
            MenuDTO dto = modelMapper.map(menuVO, MenuDTO.class);
            dtoList.add(dto);
        }
        return dtoList;
    }


    //밀키트 가져오는 부분
    @Override
    public List<MenuDTO> getMealKitList() {
        List<MenuVO> voList = menuMapper.getMealKitList();
        List<MenuDTO> dtoList = new ArrayList<>();
        for(MenuVO menuVO : voList){
            MenuDTO dto = modelMapper.map(menuVO, MenuDTO.class);
            dtoList.add(dto);
        }
        return dtoList;
    }


    //캠핑용품 가져오는 부분
    @Override
    public List<MenuDTO> getCampingList() {
        List<MenuVO> voList = menuMapper.getCampingList();
        List<MenuDTO> dtoList = new ArrayList<>();
        for(MenuVO menuVO : voList){
            MenuDTO dto = modelMapper.map(menuVO, MenuDTO.class);
            dtoList.add(dto);
        }
        return dtoList;
    }

    @Override
    public List<MenuDTO> getAllMealKitList() {
        List<MenuVO> voList = menuMapper.getAllMealKitList();
        List<MenuDTO> dtoList = new ArrayList<>();
        for(MenuVO menuVO : voList){
            MenuDTO dto = modelMapper.map(menuVO, MenuDTO.class);
            dtoList.add(dto);
        }
        return dtoList;
    }

    @Override
    public List<MenuDTO> getAllCampingList() {
        List<MenuVO> voList = menuMapper.getAllCampingList();
        List<MenuDTO> dtoList = new ArrayList<>();
        for(MenuVO menuVO : voList){
            MenuDTO dto = modelMapper.map(menuVO, MenuDTO.class);
            dtoList.add(dto);
        }
        return dtoList;
    }

    @Override
    public MenuVO getOneMenu(int mid) {
        log.info("menuService getOne...");
        MenuVO menuVO = menuMapper.getOneMenu(mid);
        return menuVO;
    }

    @Override
    public void discountMenuAmount(int menuid, int amount) {
        menuMapper.discountAmount(menuid,amount);
    }

    @Override
    public void updateHit(int menuid) {
        menuMapper.updateHit(menuid);
    }

    @Override
    public void updateSalesRate(int salesRate, int menuid) {
        menuMapper.updateSalesRate(salesRate,menuid);
    }

    @Override
    public List<MenuDTO> relatedProducts(int menuid, String detailCategory) {
        List<MenuVO> voList = menuMapper.relatedProducts(menuid,detailCategory);
        List<MenuDTO> dtoList = new ArrayList<>();
        for(MenuVO menuVO : voList){
            MenuDTO dto = modelMapper.map(menuVO, MenuDTO.class);
            dtoList.add(dto);
        }
        return dtoList;
    }

    @Override
    public List<MenuVO> popularItem(String menutype) {
        List<MenuVO> menuVO = menuMapper.popularItem(menutype);
        return menuVO;
    }
}
