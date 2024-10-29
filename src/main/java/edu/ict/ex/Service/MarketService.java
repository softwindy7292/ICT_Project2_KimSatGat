package edu.ict.ex.Service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.ict.ex.Mapper.MarketMapper;
import edu.ict.ex.VO.infomarketVO;
import lombok.RequiredArgsConstructor;



@Service
@RequiredArgsConstructor
public class MarketService{
    
    private final MarketMapper marketMapper;

    @Transactional
    public List<infomarketVO> searchMarketList(Integer st_area_code,Integer end_area_code,Integer st_mrk_open_type,Integer end_mrk_open_type,String sr_market_name) {
		System.out.println(">>>searchMarketList ===> [" + st_area_code + "]  [" + end_area_code + "]  [" + st_mrk_open_type+ "]  [" + end_mrk_open_type + "]  [" + sr_market_name + "]");
    	
        return marketMapper.searchMarketList( st_area_code, end_area_code,  st_mrk_open_type, end_mrk_open_type, sr_market_name); // Mapper 메서드 호출
    }
 
    @Transactional
    public List<infomarketVO> getMarketList() {
        return marketMapper.getMarketList(); // 전체 게시물 목록 조회
    }
    @Transactional
    public List<infomarketVO> searchMarket(String keyword) {
        return marketMapper.searchMarket(keyword); // Mapper 메서드 호출
    }
    @Transactional
    public int getTotalPages(int pageSize) {
        int totalCount = marketMapper.getTotalCount();
        return (int) Math.ceil((double) totalCount / pageSize);
    }
    
    public infomarketVO getMarketMap(String market_code) {
        return marketMapper.getMarketMap(market_code);
    }

    public infomarketVO getMarketDetail(String market_code) {
        return marketMapper.getMarketDetail(market_code);
    }

    public void updateMarket(infomarketVO market) {
        marketMapper.updateMarket(market);
    }

    public void createMarket(infomarketVO market) {
        marketMapper.createMarket(market); // 게시물 생성 메서드
    }

    public void deleteMarket(String market_code) {
        marketMapper.deleteMarket(market_code); // 게시물 삭제 메서드
    }
}

