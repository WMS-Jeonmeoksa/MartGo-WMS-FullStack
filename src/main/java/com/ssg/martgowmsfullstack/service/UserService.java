package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.domain.UserVO;

public interface UserService {
    boolean login(UserVO inputUser); //로그인확인
    void register(UserVO newUser); //회원가입
    UserVO findByUserid(String userid); //검증
    void delete(String userid); // 회원탈퇴 비활성화

}
