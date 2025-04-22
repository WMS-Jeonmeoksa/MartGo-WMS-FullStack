package com.ssg.martgowmsfullstack.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RentSelectDTO {
    private Integer warehouseId;
    private String warehouseName;
    private String sectorId;
    private int month;
    private String rentStartDate;
    private String rentEndDate;
    private int monthly;
    private Integer rentPrice;
}
