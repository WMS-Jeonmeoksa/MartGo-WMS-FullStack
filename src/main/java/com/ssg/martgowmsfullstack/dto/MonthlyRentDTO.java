package com.ssg.martgowmsfullstack.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MonthlyRentDTO {
    private String month;      // "2024-01"
    private int total_rent;     // 월별 총 임대 금액
}
