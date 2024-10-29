package edu.ict.ex.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.ict.ex.VO.TourVO;

@Mapper
public interface TourMapper {
    // 모든 투어 목록을 가져옵니다.
    List<TourVO> getTourList();
    
    // 키워드로 검색된 투어 목록을 가져옵니다.
    List<TourVO> searchTour(String keyword); // 검색 메서드 추가

    // 전체 투어 수를 가져옵니다.
    int getTotalCount();

    // 특정 투어의 세부 정보를 가져옵니다.
    TourVO getTourDetail(String tour_code);

    // 투어 정보를 업데이트합니다.
    void updateTour(TourVO tour);

    // 새 투어를 생성합니다.
    void createTour(TourVO tour);

    // 특정 투어를 삭제합니다.
    void deleteTour(String tour_code);
}
