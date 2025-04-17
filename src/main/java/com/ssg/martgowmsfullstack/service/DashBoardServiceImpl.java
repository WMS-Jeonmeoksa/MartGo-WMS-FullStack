package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.dto.DashBoardDTO;
import com.ssg.martgowmsfullstack.mapper.DashBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DashBoardServiceImpl implements DashBoardService {

    private final DashBoardMapper dashBoardMapper;
    private final IncomingService incomingService;
    private final OutgoingService outgoingService;
    private final RentService rentService;

    @Override
    public DashBoardDTO getDashBoard(String admin_id) {
        List<RentDTO>
        DashBoardDTO dashBoardDTO = DashBoardDTO.builder()
                .warehouseUsageRate(dashBoardMapper.getWarehouseUsageRate(admin_id))
                .sectorUsageList(dashBoardMapper.getSectorUsageList(admin_id))
                .totalUserCount(dashBoardMapper.getTotalUserCount(admin_id))
                .AdminUserCount(dashBoardMapper.getAdminUserCount(admin_id))
                .approvedIncomingCount(incomingService.)
                .approvedOutgoingCount(outgoingService.)
                .monthlyRentTotalList()
                .build();
        return
    }
}
