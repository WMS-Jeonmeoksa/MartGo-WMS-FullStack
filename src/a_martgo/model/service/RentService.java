package model.service;

import model.dto.RentHistoryDTO;

import java.util.List;

public interface RentService {
    void saveRentHistory(RentHistoryDTO rentHistory, int month, String startDay);
    String endDate(int month, String startDay);
    List<RentHistoryDTO> getMonthlyPerformance(String adminId);
}
