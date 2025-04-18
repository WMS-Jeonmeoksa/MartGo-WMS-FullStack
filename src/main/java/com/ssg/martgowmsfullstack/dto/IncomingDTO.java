package com.ssg.martgowmsfullstack.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class IncomingDTO {
    private int incomingNum;
    private int count;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date incomingDate;
    @Builder.Default
    private String status = "대기";
    private String productId;
    private String userId;
}