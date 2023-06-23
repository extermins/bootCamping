package com.bootcamping.serviceImpl.order;

import com.bootcamping.domain.DTO.OrderDTO;
import com.bootcamping.domain.VO.OrderVO;
import com.bootcamping.mapper.order.OrderMapper;
import com.bootcamping.service.order.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j2
@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderService {

    private final OrderMapper orderMapper;
    @Override
    public void insertOrder(OrderDTO orderDTO) {
        orderMapper.insertOrder(orderDTO);
    }

    @Override
    public void updatePayCheck(String toss) {
        orderMapper.updatePayCheck(toss);
    }

    @Override
    public List<OrderVO> individualOrder(int mid) {
        return orderMapper.individualOrder(mid);
    }

    @Override
    public OrderVO getOneOrder(int orderid, int memberid) {
        return  orderMapper.getOneOrder(orderid,memberid);
    }

    @Override
    public void updateReviewChaek(int orderid) {
        orderMapper.updateReviewCheck(orderid);
    }
}
