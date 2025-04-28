package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.domain.AdminVO;
import com.ssg.martgowmsfullstack.dto.AdminDTO;
import com.ssg.martgowmsfullstack.mapper.AdminMapper;
import com.ssg.martgowmsfullstack.util.Encrypt;
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

        // salt가 있을 때 암호화해서 비교
        if (adminVO.getSalt() != null) {
            String encryptedInputPw = Encrypt.getEncrypt(password, adminVO.getSalt());
            boolean match = encryptedInputPw.equals(adminVO.getPassword());
            return match;
        }

        return adminVO.getPassword().equals(password);
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
