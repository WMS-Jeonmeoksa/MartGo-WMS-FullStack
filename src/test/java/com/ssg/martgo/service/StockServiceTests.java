package com.ssg.martgo.service;

import com.ssg.martgowmsfullstack.service.StockService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {
        "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/servlet-context.xml"
})
public class StockServiceTests {

    @Autowired
    private StockService stockService;


    @Test
    public void testUserStock() {
        log.info(stockService.getUserStock("seller01"));
    }

    @Test
    public void testAdminUserStock() {
        log.info(stockService.getAdminUserStock("admin03"));
    }

    @Test
    public void testGeneralStock() {
        log.info(stockService.getGeneralStock("admin01"));
    }

    @Test
    public void testAdminStockHistory() {
        log.info(stockService.getAdminStockHistory("admin03"));
    }

    @Test
    public void testGeneralStockHistory() {
        log.info(stockService.getGeneralStockHistory("admin01"));
    }
}
