package edu.ict.ex.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.ict.ex.VO.membersVO;

@Mapper
public interface UserMapper {
	
	membersVO findByName(String id);

	membersVO findByAccount(String id);

	String existsByAccount(String id); // 중복 아이디 있는지 확인

	void save(membersVO member); // 계정 추가
	
	// 수정은 마이페이지에서
	
	void updateMember(membersVO member);
	
	// 아래는 유저관리
	
	List<membersVO> selectAllMember();
	
	membersVO selectMember(String id);
	
	void deleteMember(String id);

}
