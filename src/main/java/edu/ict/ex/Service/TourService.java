package edu.ict.ex.Service;

import java.util.List;

import edu.ict.ex.VO.TourVO;

public interface TourService {
    List<TourVO> getTourList();
    int getTotalCount();
    List<TourVO> searchTour(String keyword);
    int getSearchTotalCount(String keyword);
    TourVO getTourDetail(String tour_Code);
    void createTour(TourVO tour);
    void updateTour(TourVO tour);
    void deleteTour(String tour_Code);
	
}
