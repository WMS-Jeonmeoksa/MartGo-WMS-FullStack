package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.dto.StockDTO;
import com.ssg.martgowmsfullstack.dto.StockHistoryDTO;
import com.ssg.martgowmsfullstack.mapper.StockHistoryMapper;
import com.ssg.martgowmsfullstack.mapper.StockMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StockServiceImpl implements StockService {

    @Autowired
    StockMapper stockMapper;

    @Autowired
    StockHistoryMapper stockHistoryMapper;


    @Override
    public List<StockDTO> getUserStock(String user_id) {
        return stockMapper.checkUserStock(user_id);
    }

    @Override
    public List<StockDTO> getAdminUserStock(String admin_id) {
        return stockMapper.checkAdminUserStock(admin_id);
    }

    @Override
    public List<StockDTO> getGeneralStock(String admin_id) {
        return stockMapper.checkGeneralStock(admin_id);
    }

    @Override
    public List<StockHistoryDTO> getAdminStockHistory(String admin_id) {
        return stockHistoryMapper.checkAdminStockHistory(admin_id);
    }

    @Override
    public List<StockHistoryDTO> getGeneralStockHistory(String admin_id) {
        return stockHistoryMapper.checkGeneralStockHistory(admin_id);
    }
}
