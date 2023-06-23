package com.bootcamping.service.review;

import com.bootcamping.domain.DTO.ReviewDTO;
import com.bootcamping.domain.VO.ReviewVO;

import java.util.List;

public interface ReviewService {
    void insertReview(ReviewDTO reviewDTO);

    List<ReviewVO> reviewByMenuId(int menuid);
}
