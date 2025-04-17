package com.ssg.martgowmsfullstack.mapper;

import com.ssg.martgowmsfullstack.dto.OutgoingDTO;
import com.ssg.martgowmsfullstack.dto.StockDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface OutgoingMapper {

    List<StockDTO> getStockByUserId(@Param("userId") String userId);

    void insertOutgoing(OutgoingDTO outgoingDTO);

    List<OutgoingDTO> getOutgoingByStatus(@Param("adminId") String adminId,
                                          @Param("status") String status);

    List<OutgoingDTO> getOutgoingByStatusNext(@Param("adminId") String adminId,
                                              @Param("status") String status);

    void updateOutgoingStatus(@Param("outgoingNum") int outgoingNum,
                              @Param("status") String status);

    String getAdminIdByOutgoingNum(@Param("outgoingNum") int outgoingNum);

    String getAdminIdByOutgoingNumNext(@Param("outgoingNum") int outgoingNum);

    int getOutgoingCountByAdminId(@Param("adminId") String adminId);
}
