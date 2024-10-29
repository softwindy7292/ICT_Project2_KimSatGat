package edu.ict.ex.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ict.ex.Mapper.UserTourMapper;
import edu.ict.ex.VO.UserTourVO;

@Service
public class UserTourServiceImpl implements UserTourService {
    
    @Autowired
    private UserTourMapper usertourMapper;

    // 전체 게시물 목록 조회
    @Override
    public List<UserTourVO> getUserTourList() {
        return usertourMapper.getUserTourList(); 
    }
    
    // 키워드로 검색된 사용자 투어 목록 조회
    @Override
    public List<UserTourVO> searchUserTour(String keyword) {
        return usertourMapper.searchUserTour(keyword);
    }
    
    // 특정 사용자 투어 세부 정보 조회
    @Override
    public UserTourVO getUserTourDetail(String tour_code) {
        return usertourMapper.getUserTourDetail(tour_code);
    }

    // 전체 페이지 수 계산
    @Override
    public int getTotalPages(int pageSize) {
        // 전체 투어 개수 구하기
        int totalCount = usertourMapper.getTotalCount();
        
        // 페이지 수 계산 (올림 처리)
        return (int) Math.ceil((double) totalCount / pageSize);
    }
}
