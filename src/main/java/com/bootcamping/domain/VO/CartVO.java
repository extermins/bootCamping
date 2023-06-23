package com.bootcamping.domain.VO;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class CartVO {
    private int cartid;
    @NotNull
    @NotEmpty
    private int memberid;
    @NotNull
    @NotEmpty
    private int menuid;
    @NotNull
    @NotEmpty
    private int amount;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date regdate;

    private String name;
    private int price;
    private String filename;
}
