package com.bootcamping.controller.member;

import com.bootcamping.domain.DTO.MemberDTO;
import com.bootcamping.service.member.MemberService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping("/member")
public class MemberMyPageController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/mypage")
    public String MyPageController(HttpSession session,
                                   RedirectAttributes redirectAttributes){

        if (session.getAttribute("member") == null){
            redirectAttributes.addFlashAttribute("Not_Login","로그인 에러");
            redirectAttributes.addFlashAttribute("Not_Login_Value","로그인을 먼저 해주세요");
            return "redirect:/member/login";
        }

        return "member/profile/mypage";
    }

    @GetMapping("/pwcheck")
    public String PasswordCheckViewController(HttpSession session,
                                              RedirectAttributes redirectAttributes){
        MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
        if (memberDTO == null){
            redirectAttributes.addFlashAttribute("Not_Login","로그인 에러");
            redirectAttributes.addFlashAttribute("Not_Login_Value","로그인을 먼저 해주세요");
            return "redirect:/member/login";
        }

        return "member/profile/pwcheck";//경로 수정요망
    }


    @PostMapping("/pwcheck")
    public String PasswordCheckController(HttpSession session,
                                          RedirectAttributes redirectAttributes,
                                          String password){
        MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
        log.info(memberDTO);
        log.info("password : " + password);
        if (memberDTO == null){
            redirectAttributes.addFlashAttribute("Not_Login","로그인 에러");
            redirectAttributes.addFlashAttribute("Not_Login_Value","로그인을 먼저 해주세요");
            return "redirect:/member/login";
        }
        log.info("check" + memberService.passwordCheck(memberDTO,password));

        if (memberService.passwordCheck(memberDTO,password) == false){
            redirectAttributes.addFlashAttribute("erroe","에러");
            redirectAttributes.addFlashAttribute("error_value","비밀번호가 일치하지않습니다.");
            return "redirect:/member/pwcheck";
        }

        return "redirect:/member/modifyMember";
    }





    @GetMapping("/modifyMember")
    public String ModifyMemberController(HttpSession session,
                                         RedirectAttributes redirectAttributes){

        if (session.getAttribute("member") == null){
            redirectAttributes.addFlashAttribute("","");
            return "redirect:/member/login";
        }

        return "member/profile/updateProfile";
    }

    @PostMapping("/modifyMember")
    public String ModifyFormController(@Valid MemberDTO memberDTO,
                                       BindingResult bindingResult,
                                       RedirectAttributes redirectAttributes,
                                       HttpSession session){
        if (session.getAttribute("member")==null){
            redirectAttributes.addFlashAttribute("error","잘못된 접근입니다. 로그인 해주세요");
//      404 ERROR 페이지 작성요망
        }

        log.info(memberDTO);
        if (bindingResult.hasErrors()) {
            log.info("has error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/member/modifyMember";
        }
        memberService.updateMember(memberDTO);
        session.invalidate();

        redirectAttributes.addFlashAttribute("Modify_Ok", "회원수정이 완료되었습니다.");
        redirectAttributes.addFlashAttribute("Modify_Ok_Value", "다시 로그인 해주십시요");

        return "redirect:/member/login";

    }
}
