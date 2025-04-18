package com.ssg.martgo.mapper;

import com.ssg.martgowmsfullstack.mapper.IncomingMapper;
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
public class IncomingMapperTest {
    @Autowired(required = false)
    private IncomingMapper incomingMapper;

    @Test
    public void testGetIncomingByStatus() {
        log.info(incomingMapper.getIncomingByStatus("admin05", "대기"));
    }
}
