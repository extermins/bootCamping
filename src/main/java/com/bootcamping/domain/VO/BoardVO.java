package com.bootcamping.domain.VO;

import lombok.*;

import java.util.Date;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class BoardVO {
    private int boardid;
    private String memberid;
    private String title;
    private String category;
    private String content;
    private int hit;
    private String filename;
    private int filesize;
    private int ripplecount;
    private Date regdate;
}
