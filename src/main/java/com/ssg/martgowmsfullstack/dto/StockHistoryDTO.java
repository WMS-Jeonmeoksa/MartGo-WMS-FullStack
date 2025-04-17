package com.ssg.martgowmsfullstack.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StockHistoryDTO {
    private Integer history_num;
    private String product_id;
    private String sector_id;
    private Integer count;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date change_date;
    private String change_type;
    private String admin_id;
    private Integer incoming_num;
    private Integer outgoing_num;
    private Integer stock_num;
}
