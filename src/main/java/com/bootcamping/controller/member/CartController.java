package com.bootcamping.controller.member;

import com.bootcamping.domain.DTO.CartDTO;
import com.bootcamping.domain.DTO.MemberDTO;
import com.bootcamping.service.cart.CartService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@Log4j2
@RestController
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartService cartService;


    @PostMapping("/addcart")
    public String addCartController(@Valid CartDTO cartDTO,
                                    BindingResult bindingResult,
                                    HttpSession session,
                                    RedirectAttributes redirectAttributes){
        if (session.getAttribute("member") == null) {
            redirectAttributes.addFlashAttribute("error", bindingResult.getAllErrors());
            return "/member/login";
        }
        if (bindingResult.hasErrors()) {
            log.info("has error");
            redirectAttributes.addFlashAttribute("error", bindingResult.getAllErrors());
            return "/menu/listMenu";
        }

        log.info(cartDTO);
        cartService.addCart(cartDTO);
        redirectAttributes.addFlashAttribute("registerOk", "register_ok");
        return "/";

    }

    @GetMapping("/mycart")
    public ModelAndView CartController(HttpSession session, ModelAndView modelAndView){
        MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
        if(memberDTO == null){
            modelAndView.setViewName("/member/login");
            return modelAndView;
        }

        int memberMid = memberDTO.getMid();
        log.info("memberMid : " +memberMid);

        modelAndView.addObject("cart",cartService.selectCart(memberMid));
        modelAndView.setViewName("/member/cart/cart");
//      회원정보를 토대로 장바구니를 가져오는 구문 작성 바람 --> return값 수정요망
        return modelAndView;
    }




    @DeleteMapping("{cartId}")
    public Map<String, String> deleteCart(@PathVariable("cartId") int cartId){
        Map<String, String> map = new HashMap<>();
        try {
            log.info(cartId);
            cartService.deleteCart(cartId);
            map.put("result", "삭제성공");
        }
        catch (Exception e){
            map.put("result", "삭제실패");
            e.printStackTrace();
        }
        return map;
    }



}
