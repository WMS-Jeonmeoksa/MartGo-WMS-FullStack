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
    public boolean login(String userid, String password) {
        UserVO dbUser = userMapper.findByUserid(userid);

        if (dbUser == null) {
            System.out.println("아이디 없음");
            return false;
        }

        if (!"활성화".equals(dbUser.getStatus())) {
            System.out.println("비활성 상태");
            return false;
        }

        boolean match = dbUser.getPassword().equals(password);
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

        if (userVO == null) return null;

        // 수동으로 DTO 구성 (password는 제외)
        return UserDTO.builder()
                .userid(userVO.getUserid())
                .username(userVO.getUsername())
                .email(userVO.getEmail())
                .phone(userVO.getPhone())
                .address(userVO.getAddress())
                .adminid(userVO.getAdminid())
                .status(userVO.getStatus())
                .role(userVO.getRole())
                .build();
    }

    @Override
    public void delete(String userid) {
        userMapper.disableUser(userid);
    }
}
