package com.ssg.martgowmsfullstack.domain;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class IncomingVO {
    private int incomingNum;
    private int count;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date incomingDate;
    @Builder.Default
    private String status = "대기";
    private String productId;
    private String userId;
}
