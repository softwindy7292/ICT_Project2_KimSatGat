package edu.ict.ex.Service;

import java.util.NoSuchElementException;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import edu.ict.ex.Mapper.UserMapper;
import edu.ict.ex.VO.CustomUserDetails;
import edu.ict.ex.VO.membersVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {
	
    private final UserMapper userMapper;

    public membersVO findNameByAccount(String id){

        return userMapper.findByName(id);
    }

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
    	
    	System.out.println("userid: + " + id);
    	membersVO userData = userMapper.findByAccount(id);

        if (userData != null){
            return new CustomUserDetails(userData);
        }else {
        	throw new NoSuchElementException("유저를 찾을 수 없습니다.");
        }
        
    }
}
