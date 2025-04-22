package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.domain.AdminVO;
import com.ssg.martgowmsfullstack.dto.AdminDTO;
import com.ssg.martgowmsfullstack.mapper.AdminMapper;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {

    private final ModelMapper modelMapper;
    private final AdminMapper adminMapper;

    @Override
    public AdminDTO getAdminById(String adminId) {
        AdminVO adminVO = adminMapper.findByAdminId(adminId);
        return modelMapper.map(adminVO, AdminDTO.class);
    }
}
