package com.ssg.martgo.service;

import com.ssg.martgowmsfullstack.dto.IncomingDTO;
import com.ssg.martgowmsfullstack.service.IncomingService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import java.text.SimpleDateFormat;
import java.util.Date;

@Log4j2
@ExtendWith(SpringExtension.class)
@WebAppConfiguration
@ContextConfiguration(locations = {
        "file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
public class IncomingServiceTest {

    @Autowired(required = false)
    private IncomingService incomingService;

    @Test
    public void testGetIncomingCount() {
        log.info(incomingService.getIncomingCount("admin05"));
    }

    @Test
    public void testGetProductByUserId() {
        log.info(incomingService.getProductByUserId("seller05"));
    }

    @Test
    public void testRequestIncoming() throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date incomingDate = sdf.parse("2025-05-10");

        IncomingDTO incomingDTO = IncomingDTO.builder()
                .productId("P007")
                .count(12121)
                .incomingDate(incomingDate)
                .userId("seller05")
                .build();

        incomingService.requestIncoming(incomingDTO);
        log.info(incomingDTO);
    }

    @Test
    public void testGetIncomingByRole() {
        log.info(incomingService.getIncomingByRole("admin05", "창고관리자"));
    }
    
    @Test
    public void testApproveIncoming() {
        incomingService.approveIncoming("admin05", 3, "창고관리자");
        log.info(incomingService.getIncomingByRole("admin05", "창고관리자"));
    }

    @Test
    public void testGetAdminRoleById() {
        log.info(incomingService.getAdminRoleById("admin05"));
    }
}
