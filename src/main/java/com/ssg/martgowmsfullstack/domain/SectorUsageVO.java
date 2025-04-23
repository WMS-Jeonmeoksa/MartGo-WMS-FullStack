package com.ssg.martgowmsfullstack.domain;

import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SectorUsageVO {
    private String sector_id;
    private double FAR;
    private int warehouse_id;
}
