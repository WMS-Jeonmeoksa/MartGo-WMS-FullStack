package com.ssg.martgowmsfullstack.mapper;

import com.ssg.martgowmsfullstack.dto.StockHistoryDTO;

import java.util.List;

public interface StockHistoryMapper {
    // 창고 관리자가 담당하고 있는 회원의 재고 변경 이력 확인
    List<StockHistoryDTO> checkAdminStockHistory(String admin_id);
    // 총 관리자가 담당하고 있는 창고의 재고 변경 이력 확인
    List<StockHistoryDTO> checkGeneralStockHistory(String admin_id);
}
