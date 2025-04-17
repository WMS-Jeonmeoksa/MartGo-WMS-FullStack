package com.ssg.martgowmsfullstack.domain;

import lombok.*;

import java.util.Date;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class StockHistoryVO {
    private Integer history_num;
    private String product_id;
    private String sector_id;
    private Integer count;
    private Date change_date;
    private String change_type;
    private String admin_id;
    private Integer incoming_num;
    private Integer outgoing_num;
    private Integer stock_num;
}
