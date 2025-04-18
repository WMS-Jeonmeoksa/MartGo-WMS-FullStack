package com.ssg.martgowmsfullstack.service;

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

    }

    @Override
    public List<IncomingDTO> getIncomingByRole(String adminId, String role) {
        return List.of();
    }

    @Override
    public void approveIncoming(String adminId, int incomingNum, String role) {

    }

    @Override
    public String getAdminRoleById(String adminId) {
        return "";
    }
}
