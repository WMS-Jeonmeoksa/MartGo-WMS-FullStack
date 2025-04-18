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
            return false;
        }
        return dbUser.getPassword().equals(inputUser.getPassword()); //암호와 고려
    }

    @Override
    public void register(UserVO newUser) {
        userMapper.insertUser(newUser);

    }
}
