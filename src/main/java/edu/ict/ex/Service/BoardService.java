package edu.ict.ex.Service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.ict.ex.Mapper.BoardMapper;
import edu.ict.ex.VO.noticeboardVO;
import edu.ict.ex.VO.reviewboardVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {

	private final BoardMapper boardMapper;

	@Transactional
	public List<noticeboardVO> getAllNotice() {
		return boardMapper.selectAllNotice();
	}

	@Transactional
	public noticeboardVO getNotice(Long id) {
		return boardMapper.selectNotice(id);
	}

	@Transactional
	public void createNotice(noticeboardVO notice) {
		boardMapper.insertNotice(notice);
	}

	@Transactional
	public void updateNotice(noticeboardVO notice) {
		boardMapper.updateNotice(notice);
	}

	@Transactional
	public void deleteNotice(Long id) {
		boardMapper.deleteNotice(id);
	}

	// 위는 공지사항 게시판 아래는 리뷰게시판
	
	@Transactional
	public List<reviewboardVO> getAllReview(String code) {
		return boardMapper.selectAllReview(code);
	}

	@Transactional
	public reviewboardVO getReview(Long id) {
		return boardMapper.selectReview(id);
	}

	@Transactional
	public void createReview(reviewboardVO review) {
		boardMapper.insertReview(review);
	}

	@Transactional
	public void updateReview(reviewboardVO review) {
		boardMapper.updateReview(review);
	}

	@Transactional
	public void deleteReview(Long id) {
		boardMapper.deleteReview(id);
	}
	
}
