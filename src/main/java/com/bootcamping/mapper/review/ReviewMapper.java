package com.bootcamping.mapper.review;

import com.bootcamping.domain.DTO.ReviewDTO;
import com.bootcamping.domain.VO.ReviewVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReviewMapper {
    void insertReview(ReviewDTO reviewDTO);

    List<ReviewVO> reviewByMenuId(int menuid);
}
