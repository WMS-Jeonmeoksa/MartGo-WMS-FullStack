package com.ssg.martgowmsfullstack.dto;

import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class DashBoardDTO {
    // 1. 창고 전체 용적률
    private double warehouseUsageRate;
    // 2. 섹터별 용적률
    private List<SectorUsageDTO> sectorUsageList;
    // 3. 월별 임대 총합
    private List<MonthlyRentDTO> monthlyRentTotalList;
    // 4. 입고 승인 횟수
    private int approvedIncomingCount;
    // 5. 출고 승인 횟수
    private int approvedOutgoingCount;
    // 6. 전체 회원 수
    private int totalUserCount;
    // 7. 담당 회원 수 (해당 관리자 기준)
    private int adminUserCount;
}
