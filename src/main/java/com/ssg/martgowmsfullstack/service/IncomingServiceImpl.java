package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.domain.IncomingVO;
import com.ssg.martgowmsfullstack.domain.ProductVO;
import com.ssg.martgowmsfullstack.dto.IncomingDTO;
import com.ssg.martgowmsfullstack.dto.ProductDTO;
import com.ssg.martgowmsfullstack.mapper.IncomingMapper;
import com.ssg.martgowmsfullstack.mapper.ProductMapper;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class IncomingServiceImpl implements IncomingService {

    private final ModelMapper modelMapper;
    private final IncomingMapper incomingMapper;
    private final ProductMapper productMapper;

    @Override
    public int getIncomingCount(String adminId) {
        return incomingMapper.getIncomingCountByAdminId(adminId);
    }

    @Override
    public List<ProductDTO> getProductByUserId(String userId) {
        return productMapper.getProductByUserId(userId);
    }

    @Override
    public void requestIncoming(IncomingDTO incomingDTO) {
        IncomingVO incomingVO = modelMapper.map(incomingDTO, IncomingVO.class);
        incomingMapper.insertIncoming(incomingVO);
    }

    @Override
    public List<IncomingDTO> getIncomingByRole(String adminId, String role) {
        if (role.equals("창고관리자")) {
            return incomingMapper.getIncomingByStatus(adminId,"대기");
        } else if (role.equals("총관리자")) {
            return incomingMapper.getIncomingByStatusNext(adminId,"진행중");
        }
        return null;
    }

    @Override
    public void approveIncoming(String adminId, int incomingNum, String role) {
        String checkAdminId = null;
        if (role.equals("창고관리자")) {
            checkAdminId = incomingMapper.getAdminIdByIncomingNum(incomingNum);
        } else if (role.equals("총관리자")) {
            checkAdminId = incomingMapper.getAdminIdByIncomingNumNext(incomingNum);
        }
        if (checkAdminId != null && checkAdminId.equals(adminId)) {
            String newStatus = null;
            if (role.equals("창고관리자")) newStatus = "진행중";
            else if (role.equals("총관리자")) newStatus = "완료";
            incomingMapper.updateIncomingStatus(incomingNum, newStatus);
        }
    }

    @Override
    public String getAdminRoleById(String adminId) {
        return incomingMapper.getAdminRoleById(adminId);
    }
}
