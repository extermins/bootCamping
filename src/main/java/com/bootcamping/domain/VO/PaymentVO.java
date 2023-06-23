package com.bootcamping.domain.VO;

import lombok.*;

import java.util.Date;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class PaymentVO {
    private String paymentid;
    private String paymothod;
    private int amount;
    private String moinformation;
    private Date regdate;
}
