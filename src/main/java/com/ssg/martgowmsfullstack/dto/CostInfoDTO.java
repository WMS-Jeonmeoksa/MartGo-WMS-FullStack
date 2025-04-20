package com.ssg.martgowmsfullstack.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CostInfoDTO {
    private int priceNum;
    private int warehouseId;
    private char sectorId;
    private String period;
    private int price;

}
