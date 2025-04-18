package com.ssg.martgo.mapper;

import com.ssg.martgowmsfullstack.domain.ProductVO;
import com.ssg.martgowmsfullstack.mapper.ProductMapper;
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
public class ProductMapperTest {

    @Autowired(required = false)
    private ProductMapper productMapper;

    @Test
    public void testInsertProduct() {
        ProductVO productVO = ProductVO.builder()
                .productId("test04")
                .productName("제품테스트")
                .category("건조기")
                .height(30)
                .width(50)
                .price(500000)
                .manufacturer("LG전자")
                .userId("seller05")
                .build();
        productMapper.insertProduct(productVO);
        log.info(productVO);
    }

    @Test
    public void testIsUserAuthorized() {
        log.info(productMapper.isUserAuthorized("seller05"));
    }

    @Test
    public void testGetProductByUserId() {
        log.info(productMapper.getProductByUserId("seller05"));
    }
}
