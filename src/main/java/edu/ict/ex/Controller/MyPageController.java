package edu.ict.ex.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import edu.ict.ex.Service.MyPageService;
import edu.ict.ex.VO.CustomUserDetails;
import edu.ict.ex.VO.membersVO;
import edu.ict.ex.VO.myPageVO;

@RestController
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@GetMapping("/mypage")
	public myPageVO mypage(){
		
		Authentication authenticated = SecurityContextHolder.getContext().getAuthentication();
		
		authenticated.getCredentials();
		
		CustomUserDetails details = (CustomUserDetails) authenticated.getPrincipal();
		
		if ( authenticated == null ) {
			return null;
		}
		
		return myPageService.getMyPage(authenticated.getName());
	}
	
	@PutMapping("/mypage/update")
	public ResponseEntity<membersVO> updateMember(@RequestBody membersVO vo) {
		myPageService.updateMember(vo);
		return ResponseEntity.status(HttpStatus.OK).build();
	}
	
}
