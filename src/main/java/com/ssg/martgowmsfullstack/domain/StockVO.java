package com.ssg.martgowmsfullstack.domain;

import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class StockVO {
    private Integer stock_num;
    private Integer count;
    private Integer total_price;
    private String user_id;
    private String product_id;
    private String sector_id;
    private Integer warehouse_id;
}
