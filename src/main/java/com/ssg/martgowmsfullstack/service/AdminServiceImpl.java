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
            return false;
        }

        // 초기 비밀번호가 "0"인 경우
        if ("0".equals(adminVO.getPassword())) {
            if ("0".equals(password)) {
                return true;
            } else {
                return false;
            }
        }

        // 일반 비밀번호 매칭
        boolean match = adminVO.getPassword().equals(password); // 나중에 암호화 비교로 변경 예정
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

    @Override
    public void updatePassword(String adminId, String newPw, String salt) {
        adminMapper.updateAdminPassword(adminId, newPw, salt);
    }


}
