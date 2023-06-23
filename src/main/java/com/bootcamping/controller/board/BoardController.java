package com.bootcamping.controller.board;

import com.bootcamping.domain.DTO.BoardDTO;
import com.bootcamping.domain.DTO.MemberDTO;
import com.bootcamping.domain.DTO.PageRequestDTO;
import com.bootcamping.service.board.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Log4j2
@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;


    @GetMapping("/addBoard")
    public String addBoardGET(HttpSession session) {
        MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
        if (memberDTO == null) {
            return "redirect:/member/login";
        }
        return "board/addBoard";
    }

    @PostMapping("/addBoard")
    public String addBoardPOST(BoardDTO boardDTO, @RequestParam("file") MultipartFile file, HttpSession session) {
        if (session.getAttribute("member") == null) {
            return "redirect:/member/login";
        }
        log.info("POST addBoard...");
        log.info(boardDTO.getContent());

        // HTML 태그를 제거하여 텍스트만 얻는다
//        String plainText = Jsoup.clean(boardDTO.getContent(), Whitelist.none());
//        boardDTO.setContent(plainText);

        boardService.addBoard(boardDTO, file);
        return "redirect:/customer/board/getListBoard";
    }

    @GetMapping("/getOneBoard")
    public String getOneBoard(int boardid, Model model) {
        log.info("OneBoard...");
        log.info(boardid);
        BoardDTO boardDTO = boardService.getOneBoard(boardid);
        boardService.updateHit(boardid);
        log.info(boardDTO);

        model.addAttribute("board", boardDTO);

        return "board/getOneBoard";
    }

    @GetMapping("/getListBoard")
    public String list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, Model model){
        log.info(pageRequestDTO);

        if(bindingResult.hasErrors()){
            pageRequestDTO = PageRequestDTO.builder().build();
        }
        log.info(pageRequestDTO);
        model.addAttribute("responseDTO",boardService.getList(pageRequestDTO));
        log.info(boardService.getList(pageRequestDTO));

        return "board/getListBoard";
    }



    @GetMapping( "/updateBoard")
    public String updateBoard(int boardid, Model model) {
        log.info("OneBoard...");
        log.info(boardid);
        BoardDTO boardDTO = boardService.getOneBoard(boardid);
        log.info(boardDTO);

        model.addAttribute("board", boardDTO);
        return "board/updateBoard";
    }
}
