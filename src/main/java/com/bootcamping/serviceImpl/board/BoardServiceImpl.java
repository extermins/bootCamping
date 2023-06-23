package com.bootcamping.serviceImpl.board;

import com.bootcamping.domain.DTO.BoardDTO;
import com.bootcamping.domain.DTO.MemberDTO;
import com.bootcamping.domain.DTO.PageRequestDTO;
import com.bootcamping.domain.DTO.PageResponseDTO;
import com.bootcamping.domain.VO.BoardVO;
import com.bootcamping.mapper.board.BoardMapper;
import com.bootcamping.mapper.member.MemberProfileMapper;
import com.bootcamping.mapper.ripple.RippleMapper;
import com.bootcamping.service.board.BoardService;
import com.bootcamping.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Log4j2
@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

    private final BoardMapper boardMapper;
    private final MemberService memberService;
    private final ModelMapper modelMapper;
    private final RippleMapper rippleMapper;
    @Override
    public void addBoard(BoardDTO boardDTO, MultipartFile file) {
        log.info("addBoard()...");
        processForm(file, boardDTO);
        BoardVO boardVO = modelMapper.map(boardDTO,BoardVO.class);
        boardMapper.addBoard(boardVO);
        log.info(boardVO);

    }

    @SneakyThrows
    private void processForm(MultipartFile file, BoardDTO boardDTO) {
        String path = "c:/img/board/";

        File dir = new File(path);
        if(!dir.exists()){
            dir.mkdirs();
        }

        if(file != null && !file.isEmpty()){
            String imageName = UUID.randomUUID().toString() + file.getOriginalFilename();
            int imageSize = (int) file.getSize();
            log.info(imageName);

            boardDTO.setFilesize(imageSize);
            boardDTO.setFilename(imageName);
            file.transferTo(new File(path, imageName));
        }
    }


    @Override
    public BoardDTO getOneBoard(int boardid) {
        log.info("getOneBoard()...");
        BoardDTO boardDTO = boardMapper.getOneBoard(boardid);
        boardDTO.setMemberDTO(memberService.getOneMember(boardDTO.getMemberid()));
        return boardDTO;
    }


    @Override
    public void updateBoard(BoardDTO boardDTO, MultipartFile file) {
        log.info("updateBoard()...");
        if(file.isEmpty() || file == null){
            String fileName = boardMapper.getOneBoard(boardDTO.getBoardid()).getFilename();
            boardDTO.setFilename(fileName);
        }
        processForm(file, boardDTO);
        BoardVO boardVO =modelMapper.map(boardDTO,BoardVO.class);
        boardMapper.updateBoard(boardVO);
    }

    @Override
    public void deleteBoard(int boardid) {
        log.info("deleteBoard()...");
        boardMapper.deleteBoard(boardid);
    }

    @Override
    public PageResponseDTO<BoardDTO> getList(PageRequestDTO pageRequestDTO) {
        log.info("page..........." + pageRequestDTO);
        List<BoardVO> voList = boardMapper.selectList(pageRequestDTO);
        List<BoardDTO> dtoList = new ArrayList<>();
        for(BoardVO boardVO : voList){
            BoardDTO todoDTO = modelMapper.map(boardVO, BoardDTO.class);
            todoDTO.setRipplecount(rippleMapper.rippleCount(todoDTO.getBoardid()));
            todoDTO.setMemberDTO(memberService.getOneMember(todoDTO.getMemberid()));
            dtoList.add(todoDTO);
        }
//        List<TodoDTO> dtoList = voList.stream()
//                .map(vo -> modelMapper.map(vo, TodoDTO.class))
//                .collect(Collectors.toList());
        int total = boardMapper.getCount(pageRequestDTO);

        PageResponseDTO<BoardDTO> pageResponseDTO = PageResponseDTO.<BoardDTO>withAll()
                .dtoList(dtoList)
                .total(total)
                .pageRequestDTO(pageRequestDTO)
                .build();

        return pageResponseDTO;
    }

    @Override
    public int rippleCount(int boardnum, int boardid) {
        int cnt = boardMapper.rippleCount(boardnum, boardid);
        return cnt;
    }

    @Override
    public void updateBoardRippleCount(int ripplecount, int boardid) {
        boardMapper.updateBoardRippleCount(ripplecount, boardid);
    }

    @Override
    public void updateHit(int boardid) {
        boardMapper.updateHit(boardid);
    }

}
