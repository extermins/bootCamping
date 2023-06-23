package com.bootcamping.controller.member;

import com.bootcamping.domain.DTO.MemberDTO;
import com.bootcamping.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.UUID;

@Log4j2
@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberLoginController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/login")
    public String MemberLoginController(){
        return "member/profile/login";
    }

    @PostMapping("/login")
    public String MemberLoginCheckController(MemberDTO memberDTO,
                                             HttpServletRequest request,
                                             HttpServletResponse response,
                                             BindingResult bindingResult,
                                             RedirectAttributes redirectAttributes){
        log.info("MemberLogin.................");
        HttpSession session = request.getSession();
        String auto = request.getParameter("auto");
        boolean rememberMe = auto!= null && auto.equals("on");


        if (bindingResult.hasErrors()){
            log.info("hasError().......");
            redirectAttributes.addFlashAttribute("error",bindingResult.getAllErrors());
            return "redirect:/member/login";
        }

        MemberDTO dto = memberService.MemberLogin(memberDTO);

        if (dto == null){
            redirectAttributes.addFlashAttribute("error","일치하는 정보가 없습니다.");
            return "redirect:/member/login";
        }


        if (rememberMe){
            String uuid = UUID.randomUUID().toString();

            memberService.updateRememberme(dto,uuid);


            Cookie rememberCookie = new Cookie("rememberme",uuid);
            rememberCookie.setMaxAge(60*60*24*7);
            rememberCookie.setPath("/");

            response.addCookie(rememberCookie);
        }
        session.setAttribute("member",dto);

        return "redirect:/";
    }


    @GetMapping("/logout")
    public String logout(HttpServletRequest request,HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.removeAttribute("member");
            session.invalidate();
            Cookie rememberCookie = new Cookie("rememberme","uuid");
            rememberCookie.setMaxAge(0);
            rememberCookie.setPath("/");

            response.addCookie(rememberCookie);
            return "redirect:/";
        }
        return "redirect:/";
    }
}
