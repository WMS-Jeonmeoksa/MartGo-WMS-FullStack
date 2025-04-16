package com.ssg.martgowmsfullstack.dto;



import lombok.AllArgsConstructor;
import lombok.Data;

import java.sql.Timestamp;
import java.util.Date;

@Data
@AllArgsConstructor
public class RentHistoryDTO {
    private int rentNum;
    private String sectorId;
    private int warehouseId;
    private String userId;
    private Date rentStartDate;
    private Date rentEndDate;
    private int rentPrice;
    private String status;
    private String adminId;
    private Date approveDate;

    public RentHistoryDTO() {
    }

    public RentHistoryDTO(int rentPrice, Timestamp approveDate) {
        this.rentPrice = rentPrice;
        this.approveDate = approveDate;
    }
}
