package com.ssg.martgowmsfullstack.mapper;

import com.ssg.martgowmsfullstack.domain.ProductVO;
import com.ssg.martgowmsfullstack.dto.ProductDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ProductMapper {

    void insertProduct(ProductVO productVO);

    boolean isUserAuthorized(@Param("userId") String userId);

    List<ProductDTO> getProductByUserId(@Param("userId") String userId);
}