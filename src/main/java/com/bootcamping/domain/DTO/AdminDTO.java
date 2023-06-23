package com.bootcamping.domain.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotEmpty;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AdminDTO {

    private int aid;
    @NotEmpty
    private String id;
    @NotEmpty
    private String password;


}
