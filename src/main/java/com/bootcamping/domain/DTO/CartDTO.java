package com.bootcamping.domain.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotNull;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CartDTO {
    private int cartid;
    @NotNull
    private int memberid;
    @NotNull
    private int menuid;
    @NotNull
    private int amount;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date regdate;


    private String name;
    private int price;
    private String filename;
}
