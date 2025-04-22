package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.domain.UserVO;
import com.ssg.martgowmsfullstack.dto.UserDTO;
import com.ssg.martgowmsfullstack.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserMapper userMapper;
    private final ModelMapper modelMapper;

    @Override
    public boolean login(UserDTO userDTO) {
        // DB에서 조회 (아이디 기준)
        UserVO dbUser = userMapper.findByUserid(userDTO.getUserid());

        if (dbUser == null) {
            System.out.println("아이디 없음");
            return false;
        }

        if (!"활성화".equals(dbUser.getStatus())) {
            System.out.println("비활성 상태");
            return false;
        }

        // DTO → VO 매핑해서 비교
        UserVO inputUser = modelMapper.map(userDTO, UserVO.class);
        boolean match = dbUser.getPassword().equals(inputUser.getPassword());

        System.out.println("비밀번호 일치 여부: " + match);
        return match;
    }


    @Override
    public void register(UserDTO userDTO) {
        UserVO userVO = modelMapper.map(userDTO, UserVO.class);
        userMapper.insertUser(userVO);
    }


    @Override
    public UserDTO findByUserid(String userid) {
        UserVO userVO = userMapper.findByUserid(userid);
        return (userVO != null) ? modelMapper.map(userVO, UserDTO.class) : null;
    }

    @Override
    public void delete(String userid) {
        userMapper.disableUser(userid);
    }
}
