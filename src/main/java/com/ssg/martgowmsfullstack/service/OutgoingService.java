package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.dto.OutgoingDTO;
import com.ssg.martgowmsfullstack.dto.StockDTO;

import java.util.List;

public interface OutgoingService {
    List<StockDTO> showStockByUserId(String userId);
    void requestOutgoing(OutgoingDTO outgoingDTO);
    List<OutgoingDTO> getOutgoingByRole(String adminId, String role);
    void approveOutgoing(String adminId, int outgoingNum, String role);
    int getOutgoingCount(String adminId);
}
