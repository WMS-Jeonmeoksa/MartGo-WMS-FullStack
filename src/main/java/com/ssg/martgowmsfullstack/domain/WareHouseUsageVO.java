package com.ssg.martgowmsfullstack.domain;

import lombok.*;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class WareHouseUsageVO {
    private int warehouse_id;
    private String warehouse_name;
    private double FAR;
}
