package com.ssg.martgowmsfullstack.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class WareHouseUsageDTO{
    private int warehouse_id;
    private String warehouse_name;
    private double FAR;
}
