package edu.ict.ex.Service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.ict.ex.Mapper.UserMapper;
import edu.ict.ex.VO.membersVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class JoinService {

    private final UserMapper userMapper;

    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    public membersVO joinProcess(membersVO membersVO) {
        String id = membersVO.getId();

        String isExist = userMapper.existsByAccount(id);

        if (isExist != null) {
            return null;
        }

        membersVO userEntity = membersVO.builder()
                .id(membersVO.getId())
                .passwd(bCryptPasswordEncoder.encode(membersVO.getPasswd()))
                .name(membersVO.getName())
                .birthday(membersVO.getBirthday())
                .telno(membersVO.getTelno())
                .email(membersVO.getEmail())
                .manager_role("0")
                .build();

        userMapper.save(userEntity);

        return userEntity;
    }
}
