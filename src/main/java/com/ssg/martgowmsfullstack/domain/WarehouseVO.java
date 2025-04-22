package com.ssg.martgowmsfullstack.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class WarehouseVO {
    private int warehouseId;
    private String warehouseName;
    private String location;
    private int height;
    private int width;
    private BigDecimal FAR;

}
