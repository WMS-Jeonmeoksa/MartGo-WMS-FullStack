package com.ssg.martgowmsfullstack.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
public class Warehouse {
    private int warehouseId;      // warehouse_id (INTEGER)
    private String warehouseName; // warehouse_name (VARCHAR)
    private String location;      // location (VARCHAR)
    private int height;           // height (INTEGER)
    private int width;            // width (INTEGER)
    private BigDecimal far;
}