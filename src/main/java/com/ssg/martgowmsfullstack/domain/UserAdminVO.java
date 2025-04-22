package com.ssg.martgowmsfullstack.domain;

import lombok.*;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserAdminVO {
    private String admin_name;
    private String phone_num;
}
