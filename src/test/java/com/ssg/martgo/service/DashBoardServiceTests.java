package com.ssg.martgo.service;

import com.ssg.martgowmsfullstack.service.AdminDashBoardService;
import com.ssg.martgowmsfullstack.service.CustomerDashBoardService;
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
public class DashBoardServiceTests {

    @Autowired(required = false)
    private AdminDashBoardService adminDashBoardService;

    @Autowired(required = false)
    private CustomerDashBoardService userDashBoardService;

    @Test
    public void testAdminDashBoardService() {
        log.info(adminDashBoardService.getDashBoard("admin01"));
        Object result = adminDashBoardService.getDashBoard("admin01");
        log.info(result.getClass().getName());
    }
    @Test
    public void testUserDashBoardService() {
        log.info(userDashBoardService.getDashBoard("seller01"));
        Object result = userDashBoardService.getDashBoard("seller01");
        log.info(result.getClass().getName());
    }
}
