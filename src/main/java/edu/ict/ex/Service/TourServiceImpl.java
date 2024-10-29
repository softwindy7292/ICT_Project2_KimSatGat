package edu.ict.ex.Service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.ict.ex.Mapper.TourMapper;
import edu.ict.ex.VO.TourVO;

@Service
public class TourServiceImpl implements TourService {
    
    @Autowired
    private TourMapper tourMapper;

    @Override
    public List<TourVO> getTourList() {
        return tourMapper.getTourList(); // 전체 게시물 목록 조회
    }
    
    @Override
    public List<TourVO> searchTour(String keyword) {
        return tourMapper.searchTour(keyword); // Mapper 메서드 호출 검색기능
    }

  
    @Override
    public TourVO getTourDetail(String tour_code) {  
        return tourMapper.getTourDetail(tour_code); //게시물 업데이트
    }

    @Override
    public void updateTour(TourVO tour) { 
        tourMapper.updateTour(tour); //게시물 업데이트
    }

    @Override
    public void createTour(TourVO tour) {
        tourMapper.createTour(tour); // 게시물 등록
    }

    @Override
    public void deleteTour(String tour_code) {
        tourMapper.deleteTour(tour_code); // 게시물 삭제
    }

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getSearchTotalCount(String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}
}
