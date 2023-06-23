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
public class ReviewDTO {
    private int reviewid;
    private int menuid;
    private int memberid;
    private int orderid;
    private String content;
    private int rating;
    private Date regdate;

}
