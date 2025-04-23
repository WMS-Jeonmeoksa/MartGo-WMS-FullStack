package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.domain.MonthlyRentVO;
import com.ssg.martgowmsfullstack.domain.SectorUsageVO;
import com.ssg.martgowmsfullstack.domain.WareHouseUsageVO;
import com.ssg.martgowmsfullstack.dto.DashBoardDTO;
import com.ssg.martgowmsfullstack.dto.MonthlyRentDTO;
import com.ssg.martgowmsfullstack.dto.SectorUsageDTO;
import com.ssg.martgowmsfullstack.dto.WareHouseUsageDTO;
import com.ssg.martgowmsfullstack.mapper.DashBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class AdminDashBoardServiceImpl implements AdminDashBoardService {

    private final DashBoardMapper dashBoardMapper;
    private final IncomingService incomingService;
    private final OutgoingService outgoingService;

    @Override
    public DashBoardDTO getDashBoard(String admin_id) {
        List<MonthlyRentVO> monthlyRentVOList = dashBoardMapper.getMonthlyRentTotal();
        List<MonthlyRentDTO> monthlyRentDTOList = monthlyRentVOList.stream()
                .map(vo -> MonthlyRentDTO.builder()
                        .month(vo.getMonth())
                        .total_rent(vo.getTotal_rent())
                        .build())
                .collect(Collectors.toList());

        List<SectorUsageVO> sectorUsageVOList = dashBoardMapper.getSectorUsageList(admin_id);
        List<SectorUsageDTO> sectorUsageDTOList = sectorUsageVOList.stream()
                .map(vo -> SectorUsageDTO.builder()
                        .sector_id(vo.getSector_id())
                        .warehouse_id(vo.getWarehouse_id())
                        .FAR(vo.getFAR())
                        .build())
                .collect(Collectors.toList());

        List<WareHouseUsageVO> wareHouseUsageVOList = dashBoardMapper.getAllWareHouseUsageList();
        List<WareHouseUsageDTO> wareHouseUsageDTOList = wareHouseUsageVOList.stream()
                .map(vo -> WareHouseUsageDTO.builder()
                        .warehouse_name(vo.getWarehouse_name())
                        .FAR(vo.getFAR())
                        .build())
                .collect(Collectors.toList());

        DashBoardDTO dashBoardDTO = DashBoardDTO.builder()
                .warehouseUsageRate(dashBoardMapper.getWarehouseUsageRate(admin_id))
                .sectorUsageList(sectorUsageDTOList)
                .totalUserCount(dashBoardMapper.getTotalUserCount())
                .adminUserCount(dashBoardMapper.getAdminUserCount(admin_id))
                .approvedIncomingCount(incomingService.getIncomingCount(admin_id))
                .approvedOutgoingCount(outgoingService.getOutgoingCount(admin_id))
                .monthlyRentTotalList(monthlyRentDTOList)
                .wareHouseUsageList(wareHouseUsageDTOList)
                .build();

        return dashBoardDTO;
    }

}
