package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.domain.StockHistoryVO;
import com.ssg.martgowmsfullstack.domain.StockVO;
import com.ssg.martgowmsfullstack.dto.StockDTO;
import com.ssg.martgowmsfullstack.dto.StockHistoryDTO;
import com.ssg.martgowmsfullstack.mapper.StockHistoryMapper;
import com.ssg.martgowmsfullstack.mapper.StockMapper;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class StockServiceImpl implements StockService {

    private final StockMapper stockMapper;
    private final StockHistoryMapper stockHistoryMapper;
    private final ModelMapper modelMapper;

    @Override
    public List<StockDTO> getUserStock(String user_id) {
        List<StockVO> vo = stockMapper.checkUserStock(user_id);
        return vo.stream()
                .map( i -> modelMapper.map(i, StockDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public List<StockDTO> getAdminUserStock(String admin_id) {
        List<StockVO> vo = stockMapper.checkAdminUserStock(admin_id);
        return vo.stream()
                .map( i -> modelMapper.map(i, StockDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public List<StockDTO> getGeneralStock(String admin_id) {
        List<StockVO> vo = stockMapper.checkGeneralStock(admin_id);
        return vo.stream()
                .map(i -> modelMapper.map(i, StockDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public List<StockHistoryDTO> getAdminStockHistory(String admin_id) {
        List<StockHistoryVO> vo = stockHistoryMapper.checkAdminStockHistory(admin_id);
        return vo.stream()
                .map(i -> modelMapper.map(i, StockHistoryDTO.class))
                .collect(Collectors.toList());
    }

    @Override
    public List<StockHistoryDTO> getGeneralStockHistory(String admin_id) {
        List<StockHistoryVO> vo = stockHistoryMapper.checkGeneralStockHistory(admin_id);
        return vo.stream()
                .map(i -> modelMapper.map(i,StockHistoryDTO.class))
                .collect(Collectors.toList());
    }
}
