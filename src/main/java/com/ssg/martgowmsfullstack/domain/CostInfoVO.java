package com.ssg.martgowmsfullstack.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CostInfoVO {
    private int priceNum;
    private int warehouseId;
    private char sectorId;
    private String period;
    private int price;

}
