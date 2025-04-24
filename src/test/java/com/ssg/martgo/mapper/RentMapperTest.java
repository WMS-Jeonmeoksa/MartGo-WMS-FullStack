package com.ssg.martgo.mapper;

import com.ssg.martgowmsfullstack.domain.RentHistoryVO;
import com.ssg.martgowmsfullstack.dto.CostInfoDTO;
import com.ssg.martgowmsfullstack.dto.RentHistoryDTO;
import com.ssg.martgowmsfullstack.dto.SectorDTO;
import com.ssg.martgowmsfullstack.dto.WarehouseDTO;
import com.ssg.martgowmsfullstack.mapper.RentMapper;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

@Log4j2
@ExtendWith(SpringExtension.class)
@WebAppConfiguration
@ContextConfiguration(locations = {
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/servlet-context.xml"
})
public class RentMapperTest {

    @Autowired(required = false)
    private RentMapper rentMapper;

    @Autowired(required = false)
    private ModelMapper modelMapper;

//    @Test
//    void testGetAllWarehouses() {
//        List<WarehouseDTO> list = rentMapper.getAllWarehouses();
//        assertNotNull(list);
//        list.forEach(System.out::println);
//    }

    @Test
    void testGetAllSectors() {
        List<SectorDTO> list = rentMapper.getAllSectors(1);
        assertNotNull(list);
        list.forEach(System.out::println);
    }

    @Test
    void testGetCostInfo() {
        List<CostInfoDTO> list = rentMapper.getCostInfo(1, "1A");
        assertNotNull(list);
        list.forEach(System.out::println);
    }

    @Test
    void testGetRentPrice() {
        int price = rentMapper.getRentPrice(1, "1A", 6);
        assertNotNull(price);
        System.out.println("Rent Price: " + price);
    }

    @Test
    void testSaveDb() {
        RentHistoryDTO dto = new RentHistoryDTO();
        dto.setWarehouseId(1);
        dto.setSectorId("1A");
        dto.setRentStartDate(Date.valueOf("2025-05-01"));
        dto.setRentEndDate(Date.valueOf("2025-11-01"));
        dto.setRentPrice(600);
        dto.setUserId("user02");
        RentHistoryVO vo = modelMapper.map(dto, RentHistoryVO.class);
        rentMapper.saveDb(vo);
    }



    @Test
    void testUpdateUserAdminId() {
        assertDoesNotThrow(() -> rentMapper.updateUserAdminId());
    }

    @Test
    void testUpdateAdminId() {
        rentMapper.updateAdminId(1, "admin01");
    }


    @Test
    void testGetHoldRentHistory() {
        List<RentHistoryDTO> list = rentMapper.getHoldRentHistory("admin01");
        list.forEach(System.out::println);
    }


    @Test
    void testGetInProgressRentHistory() {
        List<RentHistoryDTO> list = rentMapper.getInProgressRentHistory("admin01");
        list.forEach(System.out::println);
    }

    @Test
    void testApproveRentHistory() {
        rentMapper.updateAdminId(60,"admin07");
        rentMapper.updateUserAdminId();
    }

    @Test
    void testCompletedRentStatus() {
        rentMapper.completedRentStatus(1, "admin01");
    }


}
