package edu.ict.ex.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.ict.ex.Service.UserTourService;
import edu.ict.ex.VO.UserTourVO;

@Controller
@RequestMapping("/usertour")
public class UserTourController {

    @Autowired
    private UserTourService userTourService;

    // 목록
    @GetMapping("/userlist")
    public String list(Model model) {
        List<UserTourVO> userTourList = userTourService.getUserTourList(); // 투어 목록
        model.addAttribute("usertourList", userTourList);
        return "usertour/userlist"; 
    }

    // 게시물 상세
    @GetMapping("/userdetail")
    public String getTourDetail(@RequestParam("tour_code") String tourCode, Model model) {
        UserTourVO tour = userTourService.getUserTourDetail(tourCode); 
        model.addAttribute("usertour", tour);
        return "usertour/userdetail"; 
    }

    // 검색 기능
    @GetMapping("/usersearch")
    public String search(@RequestParam("keyword") String keyword, Model model) {
        List<UserTourVO> searchResults = userTourService.searchUserTour(keyword);
        model.addAttribute("usertourList", searchResults);
        return "usertour/userlist"; // 검색 결과를 사용자 목록 JSP로 반환
    }
}
