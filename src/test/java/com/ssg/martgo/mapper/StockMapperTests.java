package com.ssg.martgo.mapper;

import com.ssg.martgowmsfullstack.mapper.StockHistoryMapper;
import com.ssg.martgowmsfullstack.mapper.StockMapper;
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
public class StockMapperTests {

    @Autowired
    private StockMapper stockMapper;

    @Autowired
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
