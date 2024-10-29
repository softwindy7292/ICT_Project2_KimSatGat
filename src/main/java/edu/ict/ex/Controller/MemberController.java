package edu.ict.ex.Controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.ict.ex.Service.MemberService;
import edu.ict.ex.VO.membersVO;
import edu.ict.ex.VO.noticeboardVO;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/members")
@RequiredArgsConstructor
public class MemberController {

	private final MemberService memberService;

	@GetMapping("/list")
	public ResponseEntity<List<membersVO>> getAllMember() {
		List<membersVO> vos = memberService.getAllMember();
		return ResponseEntity.status(HttpStatus.OK).body(vos);
	}

	@GetMapping("/{id}")
	public ResponseEntity<membersVO> getNotice(@PathVariable("id") String id) {
		membersVO vo = memberService.getMember(id);
		return ResponseEntity.status(HttpStatus.OK).body(vo);
	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<noticeboardVO> deleteNotice(@PathVariable("id") String id) {
		memberService.deleteMember(id);
		return ResponseEntity.status(HttpStatus.OK).build();
	}

}
