package com.bootcamping.domain.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardDTO {
    private int boardid;
    private int memberid;
    private String title;
    private String category;
    private String content;
    private int hit;
    private String filename;
    private int filesize;
    private int ripplecount;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date regdate;

    private MemberDTO memberDTO;
}
