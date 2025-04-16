package com.ssg.martgowmsfullstack.service;


import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;
import com.ssg.martgowmsfullstack.mapper.RentMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
@Service
@Log4j2
@RequiredArgsConstructor
@Transactional
public class RentServiceImpl implements RentService {
    RentMapper rentMapper;

    public void saveRentHistory(RentHistoryDTO rentHistory, int month, String startDay) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDate = LocalDate.parse(startDay, formatter);
        LocalDate endDate = startDate.plusMonths(month);

        rentHistory.setSectorId(rentHistory.getSectorId());
        rentHistory.setWarehouseId(rentHistory.getWarehouseId());
        rentHistory.setRentStartDate(Date.valueOf(startDate));
        rentHistory.setRentEndDate(Date.valueOf(endDate));
        rentHistory.setRentPrice(rentHistory.getRentPrice());

        rentMapper.saveDb(rentHistory);
    }
    public String endDate(int month, String startDay) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate startDate = LocalDate.parse(startDay, formatter);
        LocalDate endDate = startDate.plusMonths(month);
        return endDate.format(formatter);
    }

    public List<RentHistoryDTO> getMonthlyPerformance(String adminId) {
        return rentMapper.getMonthlyPerformance(adminId);
    }
}
