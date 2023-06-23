package com.bootcamping.domain.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuDTO {
    private int mid;
    @NotEmpty
    private String menutype;
    private String detailcategory;
    @NotEmpty
    private String name;
    @NotNull
    private int amount;
    @NotNull
    private int price;
    private String filename;
    private int filesize;
    private int hit;
    private int salesRate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date regdate;
}
