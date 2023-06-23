package com.bootcamping.service.admin;

import com.bootcamping.domain.DTO.MenuDTO;

import java.util.List;

public interface AdminMenuService {
    void addMenu(MenuDTO menuDTO);

    List<MenuDTO> getAllMenu();

    void modify(MenuDTO menuDTO);

    void updateAmount(int mid, int amount);

    void deleteMenu(int mid);
}
