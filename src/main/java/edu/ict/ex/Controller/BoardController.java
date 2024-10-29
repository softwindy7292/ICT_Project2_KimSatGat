package edu.ict.ex.Controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.ict.ex.Service.BoardService;
import edu.ict.ex.VO.noticeboardVO;
import edu.ict.ex.VO.reviewboardVO;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {

	private final BoardService boardService;

	@GetMapping("/notice")
	public ResponseEntity<List<noticeboardVO>> getAllNotice() {
		List<noticeboardVO> vos = boardService.getAllNotice();
		return ResponseEntity.status(HttpStatus.OK).body(vos);
	}

	@GetMapping("/notice/{notice_id}")
	public ResponseEntity<noticeboardVO> getNotice(@PathVariable("notice_id") Long id) {
		noticeboardVO vo = boardService.getNotice(id);
		return ResponseEntity.status(HttpStatus.OK).body(vo);
	}

	@PostMapping("/notice/create")
	public ResponseEntity<String> createNotice(@RequestBody noticeboardVO vo) {
		boardService.createNotice(vo);
		System.out.println(vo);
	    return ResponseEntity.ok("SUCCESS");
	}

	@PutMapping("/notice/update")
	public ResponseEntity<String> updateNotice(@RequestBody noticeboardVO vo) {
	    boardService.updateNotice(vo);
	    System.out.println(vo);
	    return ResponseEntity.ok("SUCCESS"); // "SUCCESS" 문자열 반환
	}

	@DeleteMapping("/notice/delete/{notice_id}")
	public ResponseEntity<noticeboardVO> deleteNotice(@PathVariable("notice_id") Long id) {
		boardService.deleteNotice(id);
		return ResponseEntity.status(HttpStatus.OK).build();
	}

	// 위는 공지사항 게시판 아래는 리뷰게시판
	
	@GetMapping("/review/{market_tour_code}")
	public ResponseEntity<List<reviewboardVO>> getAllReview(@PathVariable("market_tour_code") String code) {
		List<reviewboardVO> vos = boardService.getAllReview(code);
		return ResponseEntity.status(HttpStatus.OK).body(vos);
	}

	@GetMapping("/review/myPage/{review_id}")
	public ResponseEntity<reviewboardVO> getReview(@PathVariable("review_id") Long id) {
		reviewboardVO vo = boardService.getReview(id);
		return ResponseEntity.status(HttpStatus.OK).body(vo);
	}

	@PostMapping("/review/create")
	public ResponseEntity<reviewboardVO> createReview(@RequestBody reviewboardVO vo) {
		boardService.createReview(vo);
		return ResponseEntity.status(HttpStatus.OK).build();
	}

	@PutMapping("/review/update")
	public ResponseEntity<reviewboardVO> updateReview(@RequestBody reviewboardVO vo) {
		boardService.updateReview(vo);
		return ResponseEntity.status(HttpStatus.OK).build();
	}

	@DeleteMapping("/review/delete/{review_id}")
	public ResponseEntity<reviewboardVO> deleteReview(@PathVariable("review_id") Long id) {
		boardService.deleteReview(id);
		return ResponseEntity.status(HttpStatus.OK).build();
	}


}
