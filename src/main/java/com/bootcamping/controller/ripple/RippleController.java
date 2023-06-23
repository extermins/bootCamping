package com.bootcamping.controller.ripple;


import com.bootcamping.domain.DTO.RippleDTO;
import com.bootcamping.service.board.BoardService;
import com.bootcamping.service.ripple.RippleService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Log4j2
@RequestMapping("/ripple/*")
@RequiredArgsConstructor
public class RippleController {

    private final RippleService rippleService;
    private final BoardService boardService;

    @PostMapping(value = "/addRipple", consumes = MediaType.APPLICATION_JSON_VALUE)
    public String addRipple(@RequestBody RippleDTO rippleDTO, HttpSession session, Model model) {
        if (session.getAttribute("member") == null) {
            return "redirect:/member/login";
        }
        log.info("댓글작성으로 들어옴");
        rippleService.addRipple(rippleDTO);
        model.addAttribute("ripple", rippleDTO);
        return "addRipple";
    }

    @GetMapping(value = "/getListRipple/{boardid}")
    public List<RippleDTO> getListRipple(@PathVariable("boardid") int boardnum) {
        log.info("getListRipple");
        List<RippleDTO> list = rippleService.getListRipple(boardnum);
        return list;
    }


    @DeleteMapping(value = "/deleteRipple/{rippleid}")
    public Map<String, Integer> deleteRipple(@PathVariable("rippleid") int rippleid) {
        rippleService.deleteRipple(rippleid);
        Map<String, Integer> resultMap = new HashMap<>();
        resultMap.put("rippleid", rippleid);
        return resultMap;
    }
}
