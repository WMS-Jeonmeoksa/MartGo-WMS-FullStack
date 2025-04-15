package controller;

import model.dto.RentHistoryDTO;

import java.util.List;

public interface RentController {
     void applyRent(String userId);
     void holdRentList(String adminId);
     void inProgressRentList(String adminId);
     List<RentHistoryDTO> showMonthlyPerformance(String adminId);

}
