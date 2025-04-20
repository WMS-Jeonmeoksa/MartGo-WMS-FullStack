package com.ssg.martgowmsfullstack.domain;

import lombok.*;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductVO {
    private String productId;
    private String productName;
    private String category;
    private int height;
    private int width;
    private int price;
    private String manufacturer;
    private String userId;
}
