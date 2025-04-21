package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.domain.UserVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ssg.martgowmsfullstack.mapper.UserMapper;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements  UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean login(UserVO inputUser) {
        UserVO dbUser = userMapper.findByUserid(inputUser.getUserid());
        if(dbUser==null){
            System.out.println("아이디 없음");
            return false;
        }
        boolean match = dbUser.getPassword().equals(inputUser.getPassword());
        System.out.println("비밀번호 일치 여부: " + match);
        return match;
    }

    @Override
    public void register(UserVO newUser) {
        userMapper.insertUser(newUser);

    }

    @Override
    public UserVO findByUserid(String userid) {
        return userMapper.findByUserid(userid);
    }

    @Override
    public void delete(String userid) {
        userMapper.disableUser(userid);
    }


}
