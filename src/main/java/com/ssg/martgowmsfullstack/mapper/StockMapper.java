package com.ssg.martgowmsfullstack.mapper;

import com.ssg.martgowmsfullstack.dto.StockDTO;

import java.util.List;

public interface StockMapper {
    // 회원이 입고한 재고 목록 확인
    List<StockDTO> checkUserStock(String user_id);
    // 창고 관리자가 담당하고 있는 회원의 재고 목록 확인
    List<StockDTO> checkAdminUserStock(String admin_id);
    // 총 관리자가 담당하고 있는 창고의 재고 목록 확인
    List<StockDTO> checkGeneralStock(String admin_id);
}
