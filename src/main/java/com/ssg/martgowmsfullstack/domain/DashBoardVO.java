package com.ssg.martgowmsfullstack.domain;

import com.ssg.martgowmsfullstack.dto.*;
import lombok.*;

import java.util.List;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DashBoardVO {
    // 1. 담당 창고 용적률
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
    // 8. 창고 전체 용적률
    private List<WareHouseUsageDTO> wareHouseUsageList;
    // 9. 거래처 본인의 담당 관리자 정보
    private List<UserAdminDTO> userAdminList;
    // 10. 거래처 본인의 임대까지 남은 기간
    private int remainingDays;
    // 11. 거래처 본인이 임대한 섹터 ID 와 창고 이름
    private List<RentSectorWarehouseDTO> rentSectorWarehouseList;
    // 12. 거래처 본인이 임대한 섹터의 용적률
    private List<SectorUsageDTO> userSectorUsage;
}
