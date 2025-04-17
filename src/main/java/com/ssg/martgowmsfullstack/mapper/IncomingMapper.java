package com.ssg.martgowmsfullstack.mapper;

import com.ssg.martgowmsfullstack.dto.IncomingDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface IncomingMapper {

    void insertIncoming(IncomingDTO incomingDTO);

    String getAdminRoleById(String adminId);

    List<IncomingDTO> getIncomingByStatus(@Param("adminId") String adminId,
                                          @Param("status") String status);

    List<IncomingDTO> getIncomingByStatusNext(@Param("adminId") String adminId,
                                              @Param("status") String status);

    void updateIncomingStatus(@Param("incomingNum") int incomingNum,
                              @Param("status") String status);

    String getAdminIdByIncomingNum(@Param("incomingNum") int incomingNum);

    String getAdminIdByIncomingNumNext(@Param("incomingNum") int incomingNum);

    int getIncomingCountByAdminId(@Param("adminId") String adminId);
}
