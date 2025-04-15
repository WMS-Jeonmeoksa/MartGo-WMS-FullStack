package com.ssg.martgowmsfullstack.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StockHistoryDTO {
    Integer history_num;
    String product_id;
    String sector_id;
    Integer count;
    Date change_date;
    String change_type;
    String admin_id;
    Integer incoming_num;
    Integer outgoing_num;
    Integer stock_num;
}
