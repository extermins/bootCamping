package com.bootcamping.mapper.menu;

import com.bootcamping.domain.VO.MenuVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MenuMapper {
    List<MenuVO> listMenu();
    List<MenuVO> getMealKitList();
    List<MenuVO> getCampingList();
    List<MenuVO> getAllMealKitList();
    List<MenuVO> getAllCampingList();

    MenuVO getOneMenu(int mid);

    void discountAmount(int menuid, int amount);

    List<MenuVO> relatedProducts(int mid, String detailCategory);

    void updateHit(int menuid);

    void updateSalesRate(int salesRate,int menuid);

    List<MenuVO> popularItem(String menutype);


}
