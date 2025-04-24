package com.ssg.martgo.mapper;

import com.ssg.martgowmsfullstack.dto.DashBoardDTO;
import com.ssg.martgowmsfullstack.mapper.DashBoardMapper;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

@Log4j2
@ExtendWith(SpringExtension.class)
@WebAppConfiguration
@ContextConfiguration(locations = {
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/servlet-context.xml"
})
public class DashBoardMapperTests {

    @Autowired(required = false)
    DashBoardMapper dashBoardMapper;

    @Test
    public void test1() {
        log.info(dashBoardMapper.getAdminUserCount("admin03"));
        Object result = dashBoardMapper.getAdminUserCount("admin03");
        log.info(result.getClass().getName());
    }

    @Test
    public void test2() {
        log.info(dashBoardMapper.getSectorUsageList("admin03"));
        Object result = dashBoardMapper.getAdminUserCount("admin03");
        log.info(result.getClass().getName());

    }

    @Test
    public void test3() {
        log.info(dashBoardMapper.getWarehouseUsageRate("admin03"));
        Object result = dashBoardMapper.getAdminUserCount("admin03");
        log.info(result.getClass().getName());
    }


    @Test
    public void test4() {
        log.info(dashBoardMapper.getTotalUserCount());
    }
    @Test
    public void test5() {
        log.info(dashBoardMapper.getUserAdminList("seller01"));
    }
    @Test
    public void test6() {
        log.info(dashBoardMapper.getRentSectorWarehouseList("seller01"));
    }
    @Test
    public void test7() {
        log.info(dashBoardMapper.getRemainingDays("seller01"));
    }
    @Test
    public void test8() {
        log.info(dashBoardMapper.getUserSectorUsage("seller01"));
    }


    @Test
    public void test9(){
    }
}