package com.ssg.martgowmsfullstack.domain;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.util.Date;

@Getter
@AllArgsConstructor
public class RentHistoryVO {
    private int rentNum;
    private String sectorId;
    private int warehouseId;
    private String userId;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date rentStartDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date rentEndDate;
    private int rentPrice;
    private String status;
    private String adminId;
    private Date approveDate;

    public RentHistoryVO() {
    }

    public RentHistoryVO(int rentPrice, Timestamp approveDate) {
        this.rentPrice = rentPrice;
        this.approveDate = approveDate;
    }
}
