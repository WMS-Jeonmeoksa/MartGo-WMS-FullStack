package com.ssg.martgowmsfullstack.domain;

import lombok.*;
import org.apache.ibatis.type.Alias;

@Alias("UserVO")
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class UserVO {
    private String userid;
    private String username;
    private String password;
    private String phone;
    private String email;
    private String address;
    private String role;
    private String adminid;
    private String status;
    private String salt;

}