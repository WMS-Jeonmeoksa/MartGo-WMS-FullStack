package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.domain.RentSectorWarehouseVO;
import com.ssg.martgowmsfullstack.domain.SectorUsageVO;
import com.ssg.martgowmsfullstack.domain.UserAdminVO;
import com.ssg.martgowmsfullstack.dto.DashBoardDTO;
import com.ssg.martgowmsfullstack.dto.RentSectorWarehouseDTO;
import com.ssg.martgowmsfullstack.dto.SectorUsageDTO;
import com.ssg.martgowmsfullstack.dto.UserAdminDTO;
import com.ssg.martgowmsfullstack.mapper.DashBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CustomerDashBoardServiceImpl implements CustomerDashBoardService {

    private final DashBoardMapper dashBoardMapper;


    @Override
    public DashBoardDTO getDashBoard(String user_id) {
        List<RentSectorWarehouseVO> rentSectorWarehouseVOList = dashBoardMapper.getRentSectorWarehouseList(user_id);
        List<RentSectorWarehouseDTO> rentSectorWarehouseDTOList = rentSectorWarehouseVOList.stream()
                .map(vo -> RentSectorWarehouseDTO.builder()
                        .sector_id(vo.getSector_id())
                        .warehouse_name(vo.getWarehouse_name())
                        .build())
                .collect(Collectors.toList());

        List<UserAdminVO> userAdminVOList = dashBoardMapper.getUserAdminList(user_id);
        List<UserAdminDTO> userAdminDTOList = userAdminVOList.stream()
                .map(vo -> UserAdminDTO.builder()
                        .admin_name(vo.getAdmin_name())
                        .phone_num(vo.getPhone_num())
                        .build())
                .collect(Collectors.toList());

        List<SectorUsageVO> userSectorUsageVOList = dashBoardMapper.getUserSectorUsage(user_id);
        List<SectorUsageDTO> userSectorUsageDTOList = userSectorUsageVOList.stream()
                .map(vo -> SectorUsageDTO.builder()
                        .sector_id(vo.getSector_id())
                        .warehouse_id(vo.getWarehouse_id())
                        .FAR(vo.getFAR())
                        .build())
                .collect(Collectors.toList());

        Integer remainingDays = dashBoardMapper.getRemainingDays(user_id);
        if(remainingDays == null || remainingDays == 0) {
            remainingDays = 0;
        }
        DashBoardDTO dashBoardDTO = DashBoardDTO.builder()
                .remainingDays(remainingDays)
                .rentSectorWarehouseList(rentSectorWarehouseDTOList)
                .userAdminList(userAdminDTOList)
                .userSectorUsage(userSectorUsageDTOList)
                .build();

        return dashBoardDTO;
    }

}
