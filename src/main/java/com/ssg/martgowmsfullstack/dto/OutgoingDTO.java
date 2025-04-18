package com.ssg.martgowmsfullstack.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OutgoingDTO {
    private int outgoingNum;
    private int count;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date outgoingDate;
    @Builder.Default
    private String status = "대기";
    private String userId;
    private int stockNum;
}
