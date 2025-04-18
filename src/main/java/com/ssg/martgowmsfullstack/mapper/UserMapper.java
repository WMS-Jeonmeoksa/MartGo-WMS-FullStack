package com.ssg.martgowmsfullstack.mapper;

import com.ssg.martgowmsfullstack.domain.UserVO;

public interface UserMapper {
    UserVO findByUserid(String userId); //로그인시 아이디로 조회
    void insertUser(UserVO user); //회원가입



}
