package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.dto.AdminDTO;

public interface AdminService {
    boolean login(String adminId, String password);
    AdminDTO getAdminById(String adminId);

}
