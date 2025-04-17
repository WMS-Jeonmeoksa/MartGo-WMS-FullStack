package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.domain.ProductVO;
import com.ssg.martgowmsfullstack.dto.ProductDTO;
import com.ssg.martgowmsfullstack.mapper.ProductMapper;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

    private final ProductMapper productMapper;
    private final ModelMapper modelMapper;

    @Override
    public void registerProduct(ProductDTO productDTO) {
        if(!productMapper.isUserAuthorized(productDTO.getUserId())) {
            return;
        }
        ProductVO productVO = modelMapper.map(productDTO, ProductVO.class);
        productMapper.insertProduct(productVO);
    }
}
