package com.ssg.martgo.mapper;

import com.ssg.martgowmsfullstack.domain.IncomingVO;
import com.ssg.martgowmsfullstack.mapper.IncomingMapper;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import java.sql.Date;
import java.time.LocalDate;

@Log4j2
@ExtendWith(SpringExtension.class)
@WebAppConfiguration
@ContextConfiguration(locations = {
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/servlet-context.xml"
})
public class IncomingMapperTest {
    @Autowired(required = false)
    private IncomingMapper incomingMapper;

    @Test
    public void testGetIncomingByStatus() {
        log.info(incomingMapper.getIncomingByStatus("admin05", "대기"));
    }

    @Test
    public void testInsertIncoming() {
        IncomingVO incomingVO = IncomingVO.builder()
                .count(10)
                .incomingDate(Date.valueOf(LocalDate.now()))
                .productId("PRD0123")
                .userId("seller07")
                .build();
        incomingMapper.insertIncoming(incomingVO);
        log.info(incomingVO);
    }

    @Test
    public void testGetAdminRoleById() {
        log.info(incomingMapper.getAdminRoleById("admin05"));
    }

    @Test
    public void testGetIncomingByStatusNext() {
        log.info(incomingMapper.getIncomingByStatusNext("admin05", "대기"));
    }

    @Test
    public void testUpdateIncomingStatus() {
        incomingMapper.updateIncomingStatus(5, "진행중");
        log.info("updateIncomingStatus");
    }

    @Test
    public void testGetAdminIdByIncomingNum() {
        log.info(incomingMapper.getAdminIdByIncomingNum(5));
    }

    @Test
    public void testGetAdminIdByIncomingNumNext() {
        log.info(incomingMapper.getAdminIdByIncomingNumNext(10));
    }

    @Test
    public void testGetIncomingCountByAdminId() {
        log.info(incomingMapper.getIncomingCountByAdminId("admin05"));
    }
}
