package com.ssg.martgowmsfullstack.dto;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RentHistoryDTO {
    private int rentNum;
    private String sectorId;
    private int warehouseId;
    private String userId;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date rentStartDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date rentEndDate;
    private int rentPrice;
    private Date approveDate;
    private String status;
    private String adminId;


}
