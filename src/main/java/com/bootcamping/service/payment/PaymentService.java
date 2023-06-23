package com.bootcamping.service.payment;

import com.bootcamping.domain.DTO.PaymentDTO;

public interface PaymentService {
    void insertPayment(PaymentDTO paymentDTO);
}
