package com.ssg.martgowmsfullstack.controller;


import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;

import java.util.List;

public interface RentController {
     void applyRent(String userId);
     void holdRentList(String adminId);
     void inProgressRentList(String adminId);
     List<RentHistoryDTO> showMonthlyPerformance(String adminId);

}
