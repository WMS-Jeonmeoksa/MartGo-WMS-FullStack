package com.ssg.martgo.mapper;

import com.ssg.martgowmsfullstack.domain.OutgoingVO;
import com.ssg.martgowmsfullstack.mapper.OutgoingMapper;
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
public class OutgoingMapperTest {

    @Autowired(required = false)
    private OutgoingMapper outgoingMapper;

    @Test
    public void testGetStockByUserId() {
        log.info(outgoingMapper.getStockByUserId("seller05"));
    }

    @Test
    public void testInsertOutgoing() {
        OutgoingVO outgoingVO = OutgoingVO.builder()
                .count(5)
                .outgoingDate(Date.valueOf(LocalDate.now()))
                .status("대기")
                .userId("seller08")
                .stockNum(8)
                .build();
        outgoingMapper.insertOutgoing(outgoingVO);
        log.info(outgoingVO);
    }

    @Test
    public void testGetOutgoingByStatus() {
        log.info(outgoingMapper.getOutgoingByStatus("admin05", "대기"));
    }

    @Test
    public void testGetOutgoingByStatusNext() {
        log.info(outgoingMapper.getOutgoingByStatusNext("admin10", "진행중"));
    }

    @Test
    public void testUpdateOutgoingStatus() {  // 실제 존재하는 출고번호
        outgoingMapper.updateOutgoingStatus(20, "진행중");
        log.info("updateOutgoingStatus");
    }

    @Test
    public void testGetAdminIdByOutgoingNum() {
        log.info(outgoingMapper.getAdminIdByOutgoingNum(20));
    }

    @Test
    public void testGetAdminIdByOutgoingNumNext() {
        log.info(outgoingMapper.getAdminIdByOutgoingNumNext(20));
    }

    @Test
    public void testGetOutgoingCountByAdminId() {
        log.info(outgoingMapper.getOutgoingCountByAdminId("admin05"));
    }

}
