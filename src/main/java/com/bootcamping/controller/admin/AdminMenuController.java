package com.bootcamping.controller.admin;

import com.bootcamping.domain.DTO.AdminDTO;
import com.bootcamping.domain.DTO.MenuDTO;
import com.bootcamping.domain.VO.AdminVO;
import com.bootcamping.domain.VO.MenuVO;
import com.bootcamping.service.admin.AdminMenuService;
import com.bootcamping.service.menu.MenuService;
import lombok.SneakyThrows;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping("/admin/menu")
public class AdminMenuController {


    @Autowired
    private AdminMenuService adminMenuService;
    @Autowired
    private MenuService menuService;

    @GetMapping("/add")
    public String AddMenuController(HttpSession session,
                                    RedirectAttributes redirectAttributes) {
        AdminDTO adminDTO = (AdminDTO) session.getAttribute("admin");
        if (adminDTO == null) {
            redirectAttributes.addFlashAttribute("error", "로그인을 하십시요");
            return "redirect:/admin/login";
        }
        return "admin/menu/addMenu";
    }


    @PostMapping("/add")
    public String AddMenuController(@Valid MenuDTO menuDTO,
                                    MultipartFile file,
                                    HttpSession session,
                                    BindingResult bindingResult,
                                    RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            log.info("has error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/admin/menu/add";
        }

        AdminDTO adminDTO = (AdminDTO) session.getAttribute("admin");
        if (adminDTO == null) {
            redirectAttributes.addFlashAttribute("error", "로그인을 하십시요");
            return "redirect:/admin/login";
        }

        processForm(file, menuDTO);
        log.info("menuDTO : "+menuDTO);



        adminMenuService.addMenu(menuDTO);
        redirectAttributes.addFlashAttribute("error", "메뉴가 등록되었습니다.");
        return "redirect:/admin/index";


    }

    @SneakyThrows
    private static void processForm(MultipartFile file, MenuDTO menuDTO) {
        String path = "c:/img/menu/";

        File dir = new File(path);
        if(!dir.exists()){
            dir.mkdirs();
        }

        if(file != null && !file.isEmpty()){
            String imageName = UUID.randomUUID().toString() + file.getOriginalFilename();
            int imageSize = (int) file.getSize();
            log.info(imageName);

            menuDTO.setFilesize(imageSize);
            menuDTO.setFilename(imageName);
            file.transferTo(new File(path, imageName));
        }
    }

    @GetMapping("/list")
    public String getAllMenu(HttpSession session, Model model){
        AdminDTO adminDTO =  (AdminDTO) session.getAttribute("admin");
        if (adminDTO== null){
            return "redirect:/admin/login";
        }
        model.addAttribute("menu",adminMenuService.getAllMenu());
        return "admin/menu/listMenu";
    }

    @GetMapping("/getOneMenu")
    public String getOneMenu(int mid, Model model,HttpSession session){
        AdminDTO adminDTO =  (AdminDTO) session.getAttribute("admin");
        if (adminDTO== null){
            return "redirect:/admin/login";
        }
        MenuVO menuVO = menuService.getOneMenu(mid);
        model.addAttribute("dto",menuVO);
        return "admin/menu/getOneMenu";
    }

    @GetMapping("/update")
    public String updateMenu(int mid, Model model,HttpSession session){
        AdminDTO adminDTO =  (AdminDTO) session.getAttribute("admin");
        if (adminDTO== null){
            return "redirect:/admin/login";
        }

        model.addAttribute("dto",menuService.getOneMenu(mid));
        return "admin/menu/updateMenu";
    }

    @PostMapping("/update")
    public String updateFormMenu(@Valid MenuDTO menuDTO,
                                 MultipartFile file,
                                 HttpSession session,
                                 BindingResult bindingResult,
                                 RedirectAttributes redirectAttributes){
        AdminDTO adminDTO = (AdminDTO) session.getAttribute("admin");
        if (adminDTO == null) {
            redirectAttributes.addFlashAttribute("error", "로그인을 하십시요");
            return "redirect:/admin/login";
        }
        processForm(file, menuDTO);

        log.info("--------modify--------");
        if (bindingResult.hasErrors()) {
            log.info("has error...");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addAttribute("tno", menuDTO.getMid());
            return "redirect:/admin/menu/update";
        }
        log.info(menuDTO);
        adminMenuService.modify(menuDTO);

        return "redirect:/admin/menu/list";

    }

    @PostMapping("/amount")
    public String updateAmount(int mid, int amount){
        adminMenuService.updateAmount(mid,amount);
        return "redirect:/admin/menu/list";
    }

    @GetMapping("/delete")
    public String deleteMenu(int mid){
        adminMenuService.deleteMenu(mid);
        return "redirect:/admin/menu/list";
    }
}
