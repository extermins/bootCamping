package com.bootcamping.serviceImpl.payment;

import com.bootcamping.domain.DTO.PaymentDTO;
import com.bootcamping.mapper.payment.PaymentMapper;
import com.bootcamping.service.payment.PaymentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class PaymentServiceImpl implements PaymentService {
    private final PaymentMapper paymentMapper;

    @Override
    public void insertPayment(PaymentDTO paymentDTO) {
        paymentMapper.insertPayment(paymentDTO);
    }


}
