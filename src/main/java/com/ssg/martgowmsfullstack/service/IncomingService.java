package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.dto.IncomingDTO;
import com.ssg.martgowmsfullstack.dto.ProductDTO;

import java.util.List;

public interface IncomingService {
    List<ProductDTO> getProductByUserId(String userId);
    void requestIncoming(IncomingDTO incomingDTO);
    List<IncomingDTO> getIncomingByRole(String adminId, String role);
    void approveIncoming(String adminId, int incomingNum, String role);
    String getAdminRoleById(String adminId);
    int getIncomingCount(String adminId);
}
