package com.bootcamping.controller.review;

import com.bootcamping.domain.DTO.MemberDTO;
import com.bootcamping.domain.DTO.ReviewDTO;
import com.bootcamping.service.order.OrderService;
import com.bootcamping.service.review.ReviewService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Log4j2
@Controller
@RequestMapping("/review")
public class ReviewController {
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private OrderService orderService;

    @PostMapping("/add")
    public String reviewSubmitController(ReviewDTO reviewDTO, HttpSession session){
        MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
        if (memberDTO ==null){
            return "redirect:/member/login";
        }
        log.info("reviewDTO : " + reviewDTO);

        reviewService.insertReview(reviewDTO);

        orderService.updateReviewChaek(reviewDTO.getOrderid());
        return "redirect:/";
    }
}
