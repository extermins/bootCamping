package com.bootcamping.controller.menu;

import com.bootcamping.domain.DTO.MenuDTO;
import com.bootcamping.domain.VO.MenuVO;
import com.bootcamping.service.menu.MenuService;
import com.bootcamping.service.review.ReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/menu")
public class MenuController {
    private final MenuService menuService;
    private final ReviewService reviewService;

    @GetMapping("/mealkit")
    public String getAllMealKitController(Model model) {
        model.addAttribute("mealkit",menuService.getAllMealKitList());
        model.addAttribute("popularItem",menuService.popularItem("mealkit"));
        return "menu/mealkit";
    }

    @GetMapping("/camp")
    public String getAllCampingController(Model model) {
        model.addAttribute("camp",menuService.getAllCampingList());
        model.addAttribute("popularItem",menuService.popularItem("camp"));
        return "menu/camp";
    }

    @GetMapping("/getOneMenu")
    public String getOneMenu(int mid, Model model){
        MenuVO menuVO = menuService.getOneMenu(mid);
        List<MenuDTO> relatedMenuVO = menuService.relatedProducts(menuVO.getMid(),menuVO.getDetailcategory());
        menuService.updateHit(mid);
        model.addAttribute("review",reviewService.reviewByMenuId(mid));
        model.addAttribute("dto",menuVO);
        model.addAttribute("related",relatedMenuVO);
        return "menu/getOneMenu";
    }



//    public void getOneMenu(int mid, Model model, HttpServletRequest request){
//        HttpSession session =request.getSession();
//        MenuDTO menuDTO = menuService.getOne(mid);
//        model.addAttribute("dto",menuDTO);
//    }
}
