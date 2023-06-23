package com.bootcamping.serviceImpl.review;

import com.bootcamping.domain.DTO.ReviewDTO;
import com.bootcamping.domain.VO.ReviewVO;
import com.bootcamping.mapper.review.ReviewMapper;
import com.bootcamping.service.review.ReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {
    private final ReviewMapper reviewMapper;
    @Override
    public void insertReview(ReviewDTO reviewDTO) {
        reviewMapper.insertReview(reviewDTO);
    }

    @Override
    public List<ReviewVO> reviewByMenuId(int menuid) {
        List<ReviewVO> reviewVOS = reviewMapper.reviewByMenuId(menuid);
        return reviewVOS;
    }

}
