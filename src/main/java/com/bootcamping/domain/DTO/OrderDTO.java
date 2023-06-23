package com.bootcamping.domain.DTO;

import lombok.*;

import java.util.Date;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDTO {
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

}
