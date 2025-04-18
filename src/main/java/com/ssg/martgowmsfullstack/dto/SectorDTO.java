package com.ssg.martgowmsfullstack.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SectorDTO {
    private String sectorId;
    private int warehouseId;
    private int height;
    private int width;
    private BigDecimal FAR;
    private String status;

}
