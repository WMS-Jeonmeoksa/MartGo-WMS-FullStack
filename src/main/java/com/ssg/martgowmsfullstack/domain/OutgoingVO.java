package com.ssg.martgowmsfullstack.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
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