package com.bootcamping.domain.VO;

import lombok.*;

import java.util.Date;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class OrderVO {
    private String orderId;
    private String tossOrderId;
    private int memberId;
    private String recipient;
    private int menuid;
    private String orderItem;
    private int price;
    private int amount;
    private String phone;
    private String zipcode;
    private String address1;
    private String address2;
    private String request;
    private boolean paycheck;
    private boolean reviewcheck;
    private Date regdate;

    // vo 에서만 있는 조인에 필요한 항목
    private String filename;
    private String name;
}
