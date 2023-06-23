package com.bootcamping.mapper.cart;

import com.bootcamping.domain.DTO.CartDTO;
import com.bootcamping.domain.VO.CartVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CartMapper {
    void insertCart(CartVO cartVO);

    List<CartVO> selectCart(int cid);

    CartDTO purchaseCart(int cartid);

    void deleteCart(int cartid);



}
