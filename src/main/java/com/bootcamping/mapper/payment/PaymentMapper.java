package com.bootcamping.mapper.payment;

import com.bootcamping.domain.DTO.PaymentDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentMapper {
    void insertPayment(PaymentDTO paymentDTO);
}
