package com.bootcamping.service.board;

import com.bootcamping.domain.DTO.BoardDTO;
import com.bootcamping.domain.DTO.PageRequestDTO;
import com.bootcamping.domain.DTO.PageResponseDTO;
import org.springframework.web.multipart.MultipartFile;



public interface BoardService {
    void addBoard(BoardDTO boardDTO, MultipartFile file);

    BoardDTO getOneBoard(int boardid);

    PageResponseDTO<BoardDTO> getList(PageRequestDTO pageRequestDTO);


    void updateBoard(BoardDTO boardDTO, MultipartFile file);

    void deleteBoard(int boardid);


    int rippleCount(int boardnum, int boardid);

    void updateBoardRippleCount(int ripplecount, int boardid);

    void updateHit(int boardid);
}
