package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.mapper.IncomingMapper;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class IncomingServiceImpl implements IncomingService {

    private final ModelMapper modelMapper;
    private final IncomingMapper incomingMapper;

    @Override
    public int getIncomingCount(String adminId) {
        return incomingMapper.getIncomingCountByAdminId(adminId);
    }
}
