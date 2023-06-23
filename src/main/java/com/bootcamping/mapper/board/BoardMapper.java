package com.bootcamping.mapper.board;

import com.bootcamping.domain.DTO.BoardDTO;
import com.bootcamping.domain.DTO.PageRequestDTO;
import com.bootcamping.domain.VO.BoardVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    void addBoard(BoardVO boardVO);

    BoardDTO getOneBoard(int boardid);


    void updateBoard(BoardVO boardVO);

    void deleteBoard(int boardid);

    List<BoardVO> selectList(PageRequestDTO pageRequestDTO);

    int getCount(PageRequestDTO pageRequestDTO);

    int rippleCount(int boardnum, int boardid);

    void updateBoardRippleCount(int ripplecount, int boardid);

    void updateHit(int boardid);


}
