package com.ssg.martgowmsfullstack.service;

import com.ssg.martgowmsfullstack.domain.UserVO;
import com.ssg.martgowmsfullstack.dto.UserDTO;
import com.ssg.martgowmsfullstack.mapper.UserMapper;
import com.ssg.martgowmsfullstack.util.Encrypt;
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
            return false;
        }

        if (!"활성화".equals(dbUser.getStatus())) {
            return false;
        }

        String hashed = Encrypt.getEncrypt(password, dbUser.getSalt());

        return hashed.equals(dbUser.getPassword());
    }



    @Override
    public void register(UserDTO userDTO) {
        // 1. Salt 생성
        String salt = Encrypt.getSalt();

        // 2. 비밀번호 암호화
        String hashedPw = Encrypt.getEncrypt(userDTO.getPassword(), salt);

        // 3. 암호화된 비밀번호와 salt 설정
        userDTO.setSalt(salt);
        userDTO.setPassword(hashedPw);

        // 4. DTO → VO 변환 후 DB 저장
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
                .password(userVO.getPassword())
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

    @Override
    public void updateUserInfo(UserDTO user) {
        UserVO userVO = modelMapper.map(user, UserVO.class);
        userMapper.updateUserInfo(userVO);
    }
}
