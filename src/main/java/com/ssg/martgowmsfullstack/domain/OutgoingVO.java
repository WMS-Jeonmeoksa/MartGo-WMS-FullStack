package com.ssg.martgowmsfullstack.domain;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OutgoingVO {
    private int outgoingNum;
    private int count;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date outgoingDate;
    @Builder.Default
    private String status = "대기";
    private String userId;
    private int stockNum;
}