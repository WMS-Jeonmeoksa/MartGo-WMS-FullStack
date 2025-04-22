package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.dto.DashBoardDTO;
import com.ssg.martgowmsfullstack.mapper.DashBoardMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserDashBoardServiceImpl implements UserDashBoardService {

    private final DashBoardMapper dashBoardMapper;


    @Override
    public DashBoardDTO getDashBoard(String user_id) {
        DashBoardDTO dashBoardDTO = DashBoardDTO.builder()
                .remainingDays(dashBoardMapper.getRemainingDays(user_id))
                .rentSectorWarehouseList(dashBoardMapper.getRentSectorWarehouseList(user_id))
                .userAdminList(dashBoardMapper.getUserAdminList(user_id))
                .userSectorUsage(dashBoardMapper.getUserSectorUsage(user_id))
                .build();
        return dashBoardDTO;
    }
}
