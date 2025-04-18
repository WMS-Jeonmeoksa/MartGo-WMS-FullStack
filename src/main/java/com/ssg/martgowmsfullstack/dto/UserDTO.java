package com.ssg.martgowmsfullstack.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserDTO {
    private String userid;
    private String username;
    private String password;
    private String phone;
    private String email;
    private String address;
    private String role; // enum이지만 String으로 받는 게 일반적
    private String adminid;
}