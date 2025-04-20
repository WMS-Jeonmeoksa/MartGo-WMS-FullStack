package com.ssg.martgowmsfullstack.mapper;

import com.ssg.martgowmsfullstack.domain.StockVO;
import com.ssg.martgowmsfullstack.dto.MonthlyRentDTO;
import com.ssg.martgowmsfullstack.dto.StockDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface StockMapper {
    // 회원이 입고한 재고 목록 확인
    List<StockVO> checkUserStock(@Param("user_id") String user_id);
    // 창고 관리자가 담당하고 있는 회원의 재고 목록 확인
    List<StockVO> checkAdminUserStock(@Param("admin_id") String admin_id);
    // 총 관리자가 담당하고 있는 창고의 재고 목록 확인
    List<StockVO> checkGeneralStock(@Param("admin_id") String admin_id);

}
