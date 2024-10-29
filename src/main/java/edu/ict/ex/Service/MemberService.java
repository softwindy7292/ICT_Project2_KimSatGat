package edu.ict.ex.Service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.ict.ex.Mapper.UserMapper;
import edu.ict.ex.VO.membersVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {

	private final UserMapper userMapper;

	@Transactional
	public List<membersVO> getAllMember() {
		return userMapper.selectAllMember();
	}

	@Transactional
	public membersVO getMember(String id) {
		return userMapper.selectMember(id);
	}

	@Transactional
	public void deleteMember(String id) {
		userMapper.deleteMember(id);
	}
	
}
