package com.ssg.martgo.service;

import com.ssg.martgowmsfullstack.dto.OutgoingDTO;
import com.ssg.martgowmsfullstack.service.OutgoingService;
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
public class OutgoingServiceTest {

    @Autowired(required = false)
    private OutgoingService outgoingService;

    @Test
    public void testGetOutgoingCount() {
        log.info(outgoingService.getOutgoingCount("admin05"));
    }

    @Test
    public void testShowStockByUserId() {
        log.info(outgoingService.showStockByUserId("seller05"));
    }

    @Test
    public void testRequestOutgoing() throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date outgoingDate = sdf.parse("2025-07-07");

        OutgoingDTO outgoingDTO = OutgoingDTO.builder()
                .count(12)
                .outgoingDate(outgoingDate)
                .stockNum(5)
                .userId("seller05")
                .build();

        outgoingService.requestOutgoing(outgoingDTO);
        log.info(outgoingDTO);
    }

    @Test
    public void testGetOutgoingByRole() {
        log.info(outgoingService.getOutgoingByRole("admin07", "창고관리자"));
    }

    @Test
    public void testApproveOutgoing() {
        outgoingService.approveOutgoing("admin07", 16, "창고관리자");
        log.info(outgoingService.getOutgoingCount("admin07"));
    }
}
