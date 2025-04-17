package com.ssg.martgo.service;

import com.ssg.martgowmsfullstack.domain.ProductVO;
import com.ssg.martgowmsfullstack.dto.ProductDTO;
import com.ssg.martgowmsfullstack.service.ProductService;
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
        "file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
public class ProductServiceTest {

    @Autowired(required = false)
    private ProductService productService;

    @Test
    public void testRegisterProduct() {
        ProductDTO productDTO = ProductDTO.builder()
                .productId("test02")
                .productName("Service테스트")
                .category("세탁기")
                .height(22)
                .width(40)
                .price(1000000)
                .manufacturer("삼성세탁기")
                .userId("seller05")
                .build();
        productService.registerProduct(productDTO);
        log.info(productDTO);
    }
}
