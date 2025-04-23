package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.domain.UserVO;
import com.ssg.martgowmsfullstack.dto.UserDTO;

public interface UserService {
    boolean login(String userid, String password); //로그인확인
    void register(UserDTO newUser); //회원가입
    UserDTO findByUserid(String userid); //검증
    void delete(String userid); // 회원탈퇴 비활성화
}
