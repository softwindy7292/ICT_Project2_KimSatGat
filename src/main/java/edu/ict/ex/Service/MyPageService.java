package edu.ict.ex.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ict.ex.Mapper.BoardMapper;
import edu.ict.ex.Mapper.UserMapper;
import edu.ict.ex.VO.membersVO;
import edu.ict.ex.VO.myPageVO;

@Service
public class MyPageService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private BoardMapper boardMapper;
	
	public myPageVO getMyPage(String id) {
		myPageVO myPage = new myPageVO();
		
		myPage.setMembers(userMapper.findByName(id));
		myPage.setReviewboardM(boardMapper.selectMyReviewM(id));
		myPage.setReviewboardT(boardMapper.selectMyReviewT(id));
		
		return myPage;
	}
	
	public void updateMember(membersVO member) {
		userMapper.updateMember(member);
	}
	
}
