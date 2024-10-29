package edu.ict.ex.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import edu.ict.ex.VO.UserTourVO;

@Mapper
public interface UserTourMapper {
    List<UserTourVO> getUserTourList();
    int getTotalCount();
    UserTourVO getUserTourDetail(String tour_Code);
    List<UserTourVO> searchUserTour(String keyword);
}
