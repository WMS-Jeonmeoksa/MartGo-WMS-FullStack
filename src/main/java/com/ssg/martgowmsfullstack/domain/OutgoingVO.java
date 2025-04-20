package com.ssg.martgowmsfullstack.domain;

import lombok.*;

import java.util.Date;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OutgoingVO {
    private int outgoingNum;
    private int count;
    private Date outgoingDate;
    private String status;
    private String userId;
    private int stockNum;
}