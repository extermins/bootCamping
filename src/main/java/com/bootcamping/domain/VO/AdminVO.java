package com.bootcamping.domain.VO;

import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class AdminVO {
    private int aid;
    private String id;
    private String password;
}
