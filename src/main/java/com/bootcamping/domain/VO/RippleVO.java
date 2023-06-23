package com.bootcamping.domain.VO;

import lombok.*;

import java.util.Date;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class RippleVO {

    private int rippleid;
    private int boardnum;
    private int memberid;
    private String content;
    private Date regdate;

}
