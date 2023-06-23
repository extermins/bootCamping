package com.bootcamping.service.menu;

import com.bootcamping.domain.DTO.MenuDTO;
import com.bootcamping.domain.VO.MenuVO;

import java.util.List;

public interface MenuService {
    List<MenuDTO> list();
    List<MenuDTO> getMealKitList();
    List<MenuDTO> getCampingList();
    List<MenuDTO> getAllMealKitList();
    List<MenuDTO> getAllCampingList();
    MenuVO getOneMenu(int mid);
    void discountMenuAmount(int menuid, int amount);
    void updateHit(int menuid);
    void updateSalesRate(int salesRate ,int menuid);
    List<MenuDTO> relatedProducts(int menuid, String detailCategory);

    List<MenuVO> popularItem(String menutype);


}
