package com.ssg.martgowmsfullstack.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class WarehouseDTO {
    private int warehouseId;
    private String warehouseName;
    private String location;
    private int height;
    private int width;
    private BigDecimal FAR;

}
