package com.ssg.martgowmsfullstack.domain;

import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MonthlyRentVO {
    private String month;      // "2024-01"
    private int total_rent;     // 월별 총 임대 금액
}
