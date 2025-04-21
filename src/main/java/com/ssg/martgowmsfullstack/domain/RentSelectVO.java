package com.ssg.martgowmsfullstack.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class RentSelectVO {
    private Integer warehouseId;
    private String warehouseName;
    private String sectorId;
    private int month;
    private String rentStartDate;
    private String rentEndDate;
    private int monthly;
    private Integer rentPrice;
}
