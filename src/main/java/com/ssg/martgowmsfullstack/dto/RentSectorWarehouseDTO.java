package com.ssg.martgowmsfullstack.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RentSectorWarehouseDTO {
    private String sector_id;
    private String warehouse_name;

}
