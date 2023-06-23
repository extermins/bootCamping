package com.bootcamping.controller.admin;

import com.bootcamping.domain.DTO.AdminDTO;
import com.bootcamping.service.admin.AdminService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping("/admin")
public class AdminLoginController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/index")
    public String AdminIndexPageController(){
        return "admin/index";
    }

    @GetMapping("/login")
    public String AdminLoginController(){
        return "admin/login";
    }

    @PostMapping("/login")
    public String AdminLoginFormController(@Valid AdminDTO adminDTO,
                                           HttpServletRequest request,
                                           BindingResult bindingResult,
                                           RedirectAttributes redirectAttributes){
        log.info("LoginController()............Admin");
        HttpSession session = request.getSession();
        AdminDTO dto = adminService.AdminLogin(adminDTO);
        log.info(dto);

        if (bindingResult.hasErrors()){
            log.info("hasError().......");
            redirectAttributes.addFlashAttribute("error",bindingResult.getAllErrors());
            return "redirect:/admin/login";
        }

        if (dto == null){
            redirectAttributes.addFlashAttribute("error","No_Exist_Admin");
            return "redirect:/admin/login";
        }

        session.setAttribute("admin",dto);
        return "redirect:/admin/index";
    }

}
