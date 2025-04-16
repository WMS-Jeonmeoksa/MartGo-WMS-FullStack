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
    Integer stock_num;
    Integer count;
    Integer total_price;
    String user_id;
    String product_id;
    String sector_id;
    Integer warehouse_id;
}
