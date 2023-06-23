package com.bootcamping.controller.member;

import com.bootcamping.domain.DTO.MemberDTO;
import com.bootcamping.service.order.OrderService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Log4j2
@Controller
@RequestMapping("/myorder")
public class MemberOrderCompleteController {
    @Autowired
    private OrderService orderService;


    @GetMapping("/all")
    public String getAllOrderController(HttpSession session, Model model){
        MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
        if (memberDTO == null){
            return "redirect:/member/login";
        }
        model.addAttribute("orderList",orderService.individualOrder(memberDTO.getMid()));
        return "member/order/completePayment";
    }


    @GetMapping("/one")
    public String getOneOrderController(int orderid,Model model,HttpSession session){
        MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
        log.info("order : " + orderService.getOneOrder(orderid,memberDTO.getMid()));
        model.addAttribute("order",orderService.getOneOrder(orderid,memberDTO.getMid()));
        return "member/order/oneOrder";
    }
}
