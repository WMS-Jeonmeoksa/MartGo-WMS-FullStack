package com.ssg.martgowmsfullstack.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
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
