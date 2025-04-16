package com.ssg.martgo.mapper;

import com.ssg.martgowmsfullstack.mapper.StockHistoryMapper;
import com.ssg.martgowmsfullstack.mapper.StockMapper;
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
public class StockMapperTests {

    @Autowired(required = false)
    private StockMapper stockMapper;

    @Autowired(required = false)
    private StockHistoryMapper stockHistoryMapper;

    @Test
    public void testUserStock() {
        log.info(stockMapper.checkUserStock("seller01"));
    }

    @Test
    public void testAdminUserStock() {
        log.info(stockMapper.checkAdminUserStock("admin03"));
    }

    @Test
    public void testGeneralStock() {
        log.info(stockMapper.checkGeneralStock("admin01"));
    }

    @Test
    public void testAdminStockHistory() {
        log.info(stockHistoryMapper.checkAdminStockHistory("admin03"));
    }

    @Test
    public void testGeneralStockHistory() {
        log.info(stockHistoryMapper.checkGeneralStockHistory("admin01"));
    }


}
