package com.ssg.martgowmsfullstack.domain;

import lombok.*;

import java.util.Date;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class IncomingVO {
    private int incomingNum;
    private int count;
    private Date incomingDate;
    private String status;
    private String productId;
    private String userId;
}
