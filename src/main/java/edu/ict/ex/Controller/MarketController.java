package edu.ict.ex.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.ict.ex.Service.MarketService;
import edu.ict.ex.VO.infomarketVO;

@Controller
@RequestMapping("/market")
public class MarketController {

    @Autowired
    private MarketService marketService;

    // 시장첫화면-빈화면(조건 입력후 조회)
    @GetMapping("/market")
    public String list0(Model model) {
        return "market/list"; 
    }
    // 시장첫화면-빈화면(조건 입력후 조회) - 관리자용
    @GetMapping("/mngmarket")
    public String mnglist(Model model) {
        return "market/mng_list"; 
    }

    @GetMapping("/searchlist")
    public String searchList(@RequestParam(value = "area_code", required = false, defaultValue = "0") Integer area_code,@RequestParam(value = "mrk_open_type", required = false, defaultValue = "0") Integer mrk_open_type,@RequestParam(value = "market_name", required = false, defaultValue = "") String market_name, Model model) {
    //public String searchList(infomarketVO vo, Model model) {
    //List<infomarketVO> searchResults = marketService.searchMarketList(vo.getArea_code(),vo.getMrk_open_type(),vo.getMarket_name());
    //   List<infomarketVO> searchResults = marketService.searchMarketList(area_code,mrk_open_type,market_name);
    	int st_area_code = 0;
    	int end_area_code = 0;
    	int st_mrk_open_type = 0;
    	int end_mrk_open_type = 0;
    	String sr_market_name;
    	if (area_code > 0 && area_code < 99) {
    		st_area_code = area_code;
    		end_area_code = area_code;
    	} else if (area_code == 99) {
    		st_area_code = 0;
    		end_area_code = 99;
    	} 
    	else {
    		st_area_code = 0;
    		end_area_code = 99;
    		
    	}
    	if (mrk_open_type > 0 && mrk_open_type < 9) {
    		st_mrk_open_type = mrk_open_type;
    		end_mrk_open_type = mrk_open_type;
    	} else if (mrk_open_type == 9) {
    		st_mrk_open_type = 0;
    		end_mrk_open_type = 9;
    	} else {
    		st_mrk_open_type = 0;
    		end_mrk_open_type = 9;
    	}
    	
    	
    	// 시장명이 입력되면 시장명으로만 조회 
    	if (market_name == null || market_name.equals(""))
    		sr_market_name = "시장이름미입력";
    	else {
       		sr_market_name = market_name;
    		st_area_code = 0;
    		end_area_code = 0;
    		st_mrk_open_type = 0;
    		end_mrk_open_type = 0;
    	}	
		System.out.println(">>>searchMarketList ===> [" + st_area_code + "]  [" + end_area_code + "]  [" + st_mrk_open_type+ "]  [" + end_mrk_open_type + "]  [" +sr_market_name + "]");
    	
    	List<infomarketVO> searchResults = marketService.searchMarketList(st_area_code, end_area_code,  st_mrk_open_type, end_mrk_open_type, sr_market_name);
        model.addAttribute("marketList", searchResults);
        return "market/list"; // 검색 결과를 리스트 페이지에 반환
    }

    // 관리자용
    @GetMapping("/mngsearchlist") 
    public String mngsearchList(@RequestParam(value = "area_code", required = false, defaultValue = "0") Integer area_code,@RequestParam(value = "mrk_open_type", required = false, defaultValue = "0") Integer mrk_open_type,@RequestParam(value = "market_name", required = false, defaultValue = "") String market_name, Model model) {
    //public String mngsearchList(infomarketVO vo, Model model) {
    	//System.out.println(">>>>> MarketController >>> searchList() .. area_code: " + area_code + " - " + mrk_open_type + " - " +  market_name);
        //List<infomarketVO> searchResults = marketService.searchMarketList(vo.getArea_code(),vo.getMrk_open_type(),vo.getMarket_name());
        //model.addAttribute("marketList", searchResults);
		System.out.println(">>>searchMarketList ===> START ");
    	
    	int st_area_code = 0;
    	int end_area_code = 0;
    	int st_mrk_open_type = 0;
    	int end_mrk_open_type = 0;
    	String sr_market_name;
    	if (area_code > 0 && area_code < 99) {
    		st_area_code = area_code;
    		end_area_code = area_code;
    	} else if (area_code == 99) {
    		st_area_code = 0;
    		end_area_code = 99;
    	} 
    	else {
    		st_area_code = 0;
    		end_area_code = 99;
    		
    	}
    	if (mrk_open_type > 0 && mrk_open_type < 9) {
    		st_mrk_open_type = mrk_open_type;
    		end_mrk_open_type = mrk_open_type;
    	} else if (mrk_open_type == 9) {
    		st_mrk_open_type = 0;
    		end_mrk_open_type = 9;
    	} else {
    		st_mrk_open_type = 0;
    		end_mrk_open_type = 9;
    	}
    	
    	// 시장명이 입력되면 시장명으로만 조회 
    	if (market_name == null || market_name.equals(""))
    		sr_market_name = "시장이름미입력";
    	else {
       		sr_market_name = market_name;
    		st_area_code = 0;
    		end_area_code = 0;
    		st_mrk_open_type = 0;
    		end_mrk_open_type = 0;
    	}	
		System.out.println(">>>searchMarketList ===> [" + st_area_code + "]  [" + end_area_code + "]  [" + st_mrk_open_type+ "]  [" + end_mrk_open_type + "]  [" +sr_market_name + "]");
    	
    	List<infomarketVO> searchResults = marketService.searchMarketList(st_area_code, end_area_code,  st_mrk_open_type, end_mrk_open_type, sr_market_name);
        model.addAttribute("marketList", searchResults);
    	
        return "market/mng_list"; // 검색 결과를 리스트 페이지에 반환
    }

    // 게시물 목록
    @GetMapping("/list")
    public String list(Model model) {
        List<infomarketVO> marketList = marketService.getMarketList();
        System.out.println(marketList);
        model.addAttribute("marketList", marketList);
        return "market/list"; 
    }

    // 시장지도보기
    @GetMapping("/marketmap")
    public String getMarketMap(@RequestParam("market_code") String marketCode, Model model) {
    	infomarketVO market = marketService.getMarketDetail(marketCode);
        model.addAttribute("market", market);
        return "market/marketmap"; 
    }
    
    // 시장정보 상세조회
    @GetMapping("/detail")
    public String getMarketDetail(@RequestParam("market_code") String marketCode, Model model) {
    	infomarketVO market = marketService.getMarketDetail(marketCode);
        model.addAttribute("market", market);
        return "market/detail"; 
    }
    // 시장정보 상세조회[관리자용]
    @GetMapping("/mngdetail")
    public String getMngMarketDetail(@RequestParam("market_code") String marketCode, Model model) {
    	infomarketVO market = marketService.getMarketDetail(marketCode);
        model.addAttribute("market", market);
        return "market/mng_detail"; 
    }
    
    @GetMapping("/search")
    public String search(@RequestParam("keyword") String keyword, Model model) {
        List<infomarketVO> searchResults = marketService.searchMarket(keyword);
        model.addAttribute("marketList", searchResults);
        return "market/list"; // 검색 결과를 리스트 페이지에 반환
    }

    // 게시물 수정 화면
    @GetMapping("/edit")
    public String editMarketForm(@RequestParam("market_code") String marketCode, Model model) {
    	infomarketVO market = marketService.getMarketDetail(marketCode);
        model.addAttribute("market", market);
        return "market/edit"; // edit.jsp로 이동
    }

    // 게시물 수정 처리
    @PostMapping("/update")
    public String updateMarket(@ModelAttribute infomarketVO market, Model model) {
        marketService.updateMarket(market);

        model.addAttribute("market", market);
        return "market/mng_detail"; 
    }

    
    // 게시물 추가 폼
    @GetMapping("/create")
    public String createMarketForm(Model model) {
        model.addAttribute("market", new infomarketVO());
        return "market/create"; 
    }

    // 게시물 추가 처리
    @PostMapping("/add")
    public String createMarket(@ModelAttribute infomarketVO market) {
        marketService.createMarket(market);
        return "market/mng_list"; 
    }

    // 시장정보 삭제 화면
    @GetMapping("/delchk")
    public String delchkMarketForm(@RequestParam("market_code") String marketCode, Model model) {
    	infomarketVO market = marketService.getMarketDetail(marketCode);
        model.addAttribute("market", market);
        return "market/delete"; // edit.jsp로 이동
    }
    
    // 게시물 삭제[관리자용]
    @PostMapping("/delete")
    public String deleteMarket(@RequestParam("market_code") String marketCode) {
        marketService.deleteMarket(marketCode);
        return "market/mng_list"; 
    }
}
