package com.ssg.martgowmsfullstack.dto;

import lombok.Data;

@Data
public class MonthlyRentDTO {
    private String month;      // "2024-01"
    private int total_rent;     // 월별 총 임대 금액
}
