package com.bootcamping.domain.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentDTO {
    private String paymentid;
    private String paymethod;
    private int amount;
    private String moinformation;
    private Date regdate;

}
