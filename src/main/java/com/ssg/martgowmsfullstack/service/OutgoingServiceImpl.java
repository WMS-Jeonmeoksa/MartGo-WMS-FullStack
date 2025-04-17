package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.mapper.OutgoingMapper;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OutgoingServiceImpl implements OutgoingService {

    private final ModelMapper modelMapper;
    private final OutgoingMapper outgoingMapper;

    @Override
    public int getOutgoingCount(String adminId) {
        return outgoingMapper.getOutgoingCountByAdminId(adminId);
    }
}
