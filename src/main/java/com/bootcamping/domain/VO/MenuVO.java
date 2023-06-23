package com.bootcamping.domain.VO;

import lombok.*;

import java.util.Date;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class MenuVO {
    private int mid;
    private String menutype;
    private String detailcategory;
    private String name;
    private int amount;
    private int price;
    private String filename;
    private int filesize;
    private int hit;
    private int salesRate;
    private Date regdate;
}
