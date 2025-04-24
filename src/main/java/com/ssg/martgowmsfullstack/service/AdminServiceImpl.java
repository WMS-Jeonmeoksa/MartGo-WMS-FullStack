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

    private final AdminMapper adminMapper;


    @Override
    public boolean login(String adminId, String password) {
        AdminVO adminVO = adminMapper.findByAdminId(adminId);

        if (adminVO == null) {
            System.out.println("관리자 ID 없음");
            return false;
        }

        boolean match = adminVO.getPassword().equals(password);
        System.out.println("관리자 비밀번호 일치 여부: " + match);
        return match;
    }

    @Override
    public AdminDTO getAdminById(String adminId) {
        AdminVO adminVO = adminMapper.findByAdminId(adminId);
        if (adminVO == null) {
            return null;
        }
        return AdminDTO.builder()
                .adminId(adminVO.getAdminId())
                .password(adminVO.getPassword())
                .adminname(adminVO.getAdminname())
                .phone(adminVO.getPhone())
                .email(adminVO.getEmail())
                .address(adminVO.getAddress())
                .role(adminVO.getRole())
                .warehouse(adminVO.getWarehouse())
                .build();
    }
}
