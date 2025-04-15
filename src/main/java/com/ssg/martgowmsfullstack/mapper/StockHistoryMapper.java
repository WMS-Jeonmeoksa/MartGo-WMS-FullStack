package com.ssg.martgowmsfullstack.mapper;

import com.ssg.martgowmsfullstack.dto.StockHistoryDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StockHistoryMapper {
    // 창고 관리자가 담당하고 있는 회원의 재고 변경 이력 확인
    List<StockHistoryDTO> checkAdminStockHistory(String admin_id);
    // 총 관리자가 담당하고 있는 창고의 재고 변경 이력 확인
    List<StockHistoryDTO> checkGeneralStockHistory(String admin_id);
}
