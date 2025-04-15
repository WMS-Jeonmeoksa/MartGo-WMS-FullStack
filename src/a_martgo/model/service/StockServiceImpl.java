package model.service;

import model.dao.StockDAO;
import model.dao.StockDAOImpl;
import model.dto.StockDTO;
import model.dto.StockHistoryDTO;


import java.util.List;
import java.util.stream.Collectors;

public class StockServiceImpl implements StockService {
    private StockDAO stockDAO = new StockDAOImpl();

    @Override
    public List<StockDTO> getUserStock(String user_id) {
        return stockDAO.checkUserStock(user_id).stream()
                .filter(stock -> stock.getCount() > 0)
                .collect(Collectors.toList());
    }


    @Override
    public List<StockDTO> getAdminUserStock(String admin_id) {
        return stockDAO.checkAdminUserStock(admin_id).stream()
                .filter(stock -> stock.getCount() > 0)
                .collect(Collectors.toList());
    }

    @Override
    public List<StockDTO> getGeneralStock(String admin_id) {
        return stockDAO.checkGeneralStock(admin_id).stream()
                .filter(stock -> stock.getCount() > 0)
                .collect(Collectors.toList());
    }

    @Override
    public List<StockHistoryDTO> getAdminStockHistory(String admin_id) {
        List<StockHistoryDTO> resultAdminStockHistory = stockDAO.checkAdminStockHistory(admin_id);
        return resultAdminStockHistory;
    }

    @Override
    public List<StockHistoryDTO> getGeneralStockHistory(String admin_id) {
        List<StockHistoryDTO> resultGeneralStockHistory = stockDAO.checkGeneralStockHistory(admin_id);
        return resultGeneralStockHistory;
    }

}