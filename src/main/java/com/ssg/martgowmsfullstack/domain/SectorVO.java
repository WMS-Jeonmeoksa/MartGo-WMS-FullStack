package com.ssg.martgowmsfullstack.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class SectorVO {
    private String sectorId;
    private int warehouseId;
    private int height;
    private int width;
    private BigDecimal FAR;
    private String status;

}
