package com.ssg.martgowmsfullstack.domain;

import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class AdminVO {
    private String adminId;
    private String adminname;
    private String password;
    private String phone;
    private String email;
    private String address;
    private String role;
    private String warehouse;
}
