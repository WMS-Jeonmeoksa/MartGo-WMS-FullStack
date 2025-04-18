package com.ssg.martgowmsfullstack.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StockDTO {
    private Integer stock_num;
    private Integer count;
    private Integer total_price;
    private String user_id;
    private String product_id;
    private String sector_id;
    private Integer warehouse_id;
}
