package edu.ict.ex.Service;

import java.util.List;

import edu.ict.ex.VO.UserTourVO;

public interface UserTourService {
    // 모든 게시물 목록을 가져옵니다.
    List<UserTourVO> getUserTourList();
    //검색
    List<UserTourVO> searchUserTour(String keyword);
       
    // 전체 페이지 수를 계산합니다.
    int getTotalPages(int pageSize);

    // 특정 게시물의 세부 정보를 가져옵니다.
    UserTourVO getUserTourDetail(String tour_code);
}