package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.dto.DashBoardDTO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface UserDashBoardService {
    DashBoardDTO getDashBoard(@Param("user_id") String user_id);
}
