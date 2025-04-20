package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.domain.OutgoingVO;
import com.ssg.martgowmsfullstack.dto.OutgoingDTO;
import com.ssg.martgowmsfullstack.dto.StockDTO;
import com.ssg.martgowmsfullstack.mapper.OutgoingMapper;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OutgoingServiceImpl implements OutgoingService {

    private final ModelMapper modelMapper;
    private final OutgoingMapper outgoingMapper;

    @Override
    public int getOutgoingCount(String adminId) {
        return outgoingMapper.getOutgoingCountByAdminId(adminId);
    }

    @Override
    public List<StockDTO> showStockByUserId(String userId) {
        return outgoingMapper.getStockByUserId(userId);
    }

    @Override
    public void requestOutgoing(OutgoingDTO outgoingDTO) {
        OutgoingVO outgoingVO = modelMapper.map(outgoingDTO, OutgoingVO.class);
        outgoingMapper.insertOutgoing(outgoingVO);
    }

    @Override
    public List<OutgoingDTO> getOutgoingByRole(String adminId, String role) {
        if (role.equals("창고관리자")) {
            return outgoingMapper.getOutgoingByStatus(adminId, "대기");
        } else if (role.equals("총관리자")) {
            return outgoingMapper.getOutgoingByStatusNext(adminId, "진행중");
        }
        return null;
    }

    @Override
    public void approveOutgoing(String adminId, int outgoingNum, String role) {
        String checkAdminId = null;
        if (role.equals("창고관리자")) {
            checkAdminId = outgoingMapper.getAdminIdByOutgoingNum(outgoingNum);
        } else if (role.equals("총관리자")) {
            checkAdminId = outgoingMapper.getAdminIdByOutgoingNumNext(outgoingNum);
        }
        if (checkAdminId != null && checkAdminId.equals(adminId)) {
            String newStatus = null;
            if (role.equals("창고관리자")) newStatus = "진행중";
            else if (role.equals("총관리자")) newStatus = "완료";
            outgoingMapper.updateOutgoingStatus(outgoingNum, newStatus);
        }
    }
}
