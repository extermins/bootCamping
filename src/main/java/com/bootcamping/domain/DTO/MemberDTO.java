package com.bootcamping.domain.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberDTO {

    private int mid;
    private String id;
    private String password;

    private String phone;
    private String name;
    @NotEmpty
    private String zipcode;
    @NotEmpty
    private String address1;
    @NotEmpty
    private String address2;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birth;

    private String rememberme;
    private String snslogin;
    private Date regdate;
}
