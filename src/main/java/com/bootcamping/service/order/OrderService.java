package com.bootcamping.service.order;

import com.bootcamping.domain.DTO.OrderDTO;
import com.bootcamping.domain.VO.OrderVO;
import lombok.extern.log4j.Log4j2;

import java.util.List;


public interface OrderService {
    void insertOrder(OrderDTO orderDTO);
    void updatePayCheck(String orderId);
    List<OrderVO> individualOrder(int mid);

    OrderVO getOneOrder(int orderid, int memberid);

    void updateReviewChaek(int orderid);
}
