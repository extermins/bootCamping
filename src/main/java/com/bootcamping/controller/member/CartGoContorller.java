package com.bootcamping.controller.member;

import com.bootcamping.domain.DTO.CartDTO;
import com.bootcamping.domain.DTO.MemberDTO;
import com.bootcamping.service.cart.CartService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Log4j2
@Controller
@RequiredArgsConstructor
public class CartGoContorller {

    @Autowired
    private CartService cartService;

    @PostMapping("/purchase/goPurchase")
    public String purchaseController(String cartIds, HttpSession session, Model model){
        MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
        if(memberDTO == null){
            return "redirect:/member/login";
        }
        log.info(cartIds);
        session.setAttribute("cartid",cartIds);
        log.info(cartService.purchaseCart(cartIds));
        session.setAttribute("payment",cartService.purchaseCart(cartIds));


        return "member/cart/payment";
    }



    @PostMapping("/addcart")
    public String addCartController(@Valid CartDTO cartDTO,
                                    BindingResult bindingResult,
                                    HttpSession session,
                                    RedirectAttributes redirectAttributes){
        if (session.getAttribute("member") == null) {
            redirectAttributes.addFlashAttribute("error", bindingResult.getAllErrors());
            return "redirect:/member/login";
        }
        if (bindingResult.hasErrors()) {
            log.info("has error");
            redirectAttributes.addFlashAttribute("error", bindingResult.getAllErrors());
            return "redirect:/menu/listMenu";
        }

        log.info(cartDTO);
        cartService.addCart(cartDTO);
        redirectAttributes.addFlashAttribute("registerOk", "register_ok");
        return "redirect:/";

    }
}
