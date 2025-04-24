package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.mapper.SectorMapper;
import com.ssg.martgowmsfullstack.mapper.UserUpdateMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RentCleanupServiceImpl implements RentCleanupService {

    private final SectorMapper sectorMapper;
    private final UserUpdateMapper userUpdateMapper;

    @Override
    public void cleanupExpiredRentData() {
        sectorMapper.resetSectorStatus();
        userUpdateMapper.updateExpiredUsers();
    }
}
