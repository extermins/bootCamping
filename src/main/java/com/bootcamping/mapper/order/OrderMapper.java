package com.bootcamping.mapper.order;

import com.bootcamping.domain.DTO.OrderDTO;
import com.bootcamping.domain.VO.OrderVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {
    void insertOrder(OrderDTO orderDTO);

    void updatePayCheck(String orderId);

    List<OrderVO> individualOrder(int mid);

    OrderVO getOneOrder(int orderid, int memberid);

    void updateReviewCheck(int orderid);
}
