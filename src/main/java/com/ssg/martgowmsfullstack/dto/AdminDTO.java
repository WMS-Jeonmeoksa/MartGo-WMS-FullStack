package com.ssg.martgowmsfullstack.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class AdminDTO {
    private String adminId;
    private String adminname;
//    private String password;
    private String phone;
    private String email;
    private String address;
    private String role;
    private String warehouse;
}
