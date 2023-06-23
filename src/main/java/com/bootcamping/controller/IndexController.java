package com.bootcamping.controller;

import com.bootcamping.service.menu.MenuService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Log4j2
@Controller
@RequiredArgsConstructor
public class IndexController {

    private final MenuService menuService;

    @GetMapping("/")
    public String indexController(Model model){
        model.addAttribute("dto", menuService.list());
        model.addAttribute("dtoCamp",menuService.getCampingList());
        model.addAttribute("dtoMealKit",menuService.getMealKitList());
        return "index";
    }

    @GetMapping("/test")
    public String testController(){
        return "member/profile/mypage";
    }
}
