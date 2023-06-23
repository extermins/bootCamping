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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;

@Log4j2
@Controller
@RequiredArgsConstructor
public class MemberProfileController {

    @Autowired
    private MemberService memberService;


    @GetMapping("/signup")
    public String SignUpController(){
        return "member/profile/signup";
    }

    @GetMapping("/signup/ajaxIdCheck")
    public void ajaxIdCheckController(String id, HttpServletResponse response) throws IOException {
        log.info("ajaxIdCheck()..................................");
        log.info(id);
        MemberDTO memberDTO = MemberDTO.builder()
                .id(id)
                .build();
        log.info(memberDTO);
        boolean a = memberService.isExistId(memberDTO);
        log.info(a);
        response.getWriter().print("{\"result\":\"");
        if (a == true) {
            response.getWriter().print("true");
        } else {
            response.getWriter().print("false");
        }
        response.getWriter().print("\"}");
    }


    @PostMapping("/signup")
    public String SignUpOkController(@Valid MemberDTO memberDTO,
                                     BindingResult bindingResult,
                                     RedirectAttributes redirectAttributes){
        if (bindingResult.hasErrors()) {
            log.info("has error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/signup";
        }
        memberService.insert(memberDTO);
        redirectAttributes.addFlashAttribute("registerOk", "register_ok");
        return "redirect:/";

    }


}
