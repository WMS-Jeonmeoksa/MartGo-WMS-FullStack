package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.dto.DashBoardDTO;
import com.ssg.martgowmsfullstack.dto.MonthlyRentDTO;
import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;
import com.ssg.martgowmsfullstack.mapper.DashBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DashBoardServiceImpl implements DashBoardService {

    private final DashBoardMapper dashBoardMapper;
    private final IncomingService incomingService;
    private final OutgoingService outgoingService;

    @Override
    public DashBoardDTO getDashBoard(String admin_id) {
        List<MonthlyRentDTO> monthRentDTO = dashBoardMapper.getMonthlyRentTotal();
        DashBoardDTO dashBoardDTO = DashBoardDTO.builder()
                .warehouseUsageRate(dashBoardMapper.getWarehouseUsageRate(admin_id))
                .sectorUsageList(dashBoardMapper.getSectorUsageList(admin_id))
                .totalUserCount(dashBoardMapper.getTotalUserCount())
                .adminUserCount(dashBoardMapper.getAdminUserCount(admin_id))
                .approvedIncomingCount(incomingService.getIncomingCount(admin_id))
                .approvedOutgoingCount(outgoingService.getOutgoingCount(admin_id))
                .monthlyRentTotalList(monthRentDTO)
                .build();
        return dashBoardDTO;
    }
}
