package com.bootcamping.domain.VO;

import lombok.*;

import java.util.Date;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class ReviewVO {

    private int reviewid;
    private int menuid;
    private int memberid;
    private int orderid;
    private String content;
    private int rating;
    private Date regdate;


//    vo에만있는 join용

    private String name;
}
