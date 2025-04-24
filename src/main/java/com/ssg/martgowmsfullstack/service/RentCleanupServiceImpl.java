package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.mapper.UserUpdateMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class RentCleanupServiceImpl implements RentCleanupService {

    private final UserUpdateMapper userUpdateMapper;

    @Override
    public void cleanupExpiredRentData() {
        userUpdateMapper.resetSectorStatus();
        userUpdateMapper.updateExpiredUsers();
    }
}
