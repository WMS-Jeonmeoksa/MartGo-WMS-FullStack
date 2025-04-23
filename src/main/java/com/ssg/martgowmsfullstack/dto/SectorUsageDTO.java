package com.ssg.martgowmsfullstack.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class SectorUsageDTO {
    private String sector_id;
    private double FAR;
    private int warehouse_id;
}
