package edu.ict.ex.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import edu.ict.ex.VO.infomarketVO;



@Mapper
public interface MarketMapper {

    // 검색 메서드 추가
    List<infomarketVO> searchMarketList(@Param("st_area_code") Integer st_area_code,@Param("end_area_code") Integer end_area_code,@Param("st_mrk_open_type")  Integer st_mrk_open_type,@Param("end_mrk_open_type") Integer end_mrk_open_type,@Param("market_name") String market_name);
	
	
	// 모든 게시물 목록을 가져옵니다.
    List<infomarketVO> getMarketList();
    
    // 검색 메서드 추가
    List<infomarketVO> searchMarket(String keyword);

    // 전체 게시물 수를 가져옵니다.
    int getTotalCount();

    // 특정 게시물의 지도 세부 정보를 가져옵니다.
    infomarketVO getMarketMap(String market_code);

    // 특정 게시물의 세부 정보를 가져옵니다.
    infomarketVO getMarketDetail(String market_code);

    // 게시물 정보를 업데이트합니다.
    void updateMarket(infomarketVO market);

    // 새 게시물을 생성합니다.
    void createMarket(infomarketVO market);

    // 특정 게시물을 삭제합니다.
    void deleteMarket(String market_code);

	
}
