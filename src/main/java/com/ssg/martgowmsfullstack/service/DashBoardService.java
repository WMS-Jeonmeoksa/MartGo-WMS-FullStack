package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.dto.DashBoardDTO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface DashBoardService {
    DashBoardDTO getDashBoard(@Param("admin_id") String admin_id);
}
