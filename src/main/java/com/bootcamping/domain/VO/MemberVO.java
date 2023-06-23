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
public class MemberVO {

    private int mid;
    private String id;
    private String password;

    private String phone;
    private String name;
    private String zipcode;
    private String address1;
    private String address2;
    private Date birth;

    private String rememberme;
    private String snslogin;
    private Date regdate;
}
