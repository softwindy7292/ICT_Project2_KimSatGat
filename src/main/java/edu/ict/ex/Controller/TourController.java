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

import edu.ict.ex.Service.TourService;
import edu.ict.ex.VO.TourVO;


@Controller
@RequestMapping ("/tour")
public class TourController {

    @Autowired
    private TourService tourService;  // 서비스 이름 수정

    // 투어 목록 표시
    @GetMapping("/list")
    public String list(Model model) {
        List<TourVO> tourList = tourService.getTourList();  // 메서드 이름 수정
        model.addAttribute("tourList", tourList);
        return "tour/list";    
    }
    
    // 키워드로 투어 검색
    @GetMapping("/search")
    public String search(@RequestParam("keyword") String keyword, Model model) {
		System.out.println(">>>TourController ===> search ");
        List<TourVO> searchResults = tourService.searchTour(keyword);  // 메서드 이름 수정
        model.addAttribute("tourList", searchResults);
        return "tour/list"; // 투어 목록 페이지로 돌아감
    }

    // 특정 투어의 상세 정보를 조회
    @GetMapping("/detail")
    public String getTourDetail(@RequestParam("tour_code") String tourCode, Model model) {
        TourVO tour = tourService.getTourDetail(tourCode);  // 메서드 이름 수정
        model.addAttribute("tour", tour);
        return "tour/detail";  // 투어 상세 페이지로 이동
    }


    // 게시물 수정 화면
    @GetMapping("/edit")
    public String editTourForm(@RequestParam("tour_code") String tourCode, Model model) {
        TourVO tour = tourService.getTourDetail(tourCode);
        model.addAttribute("tour", tour);
        return "tour/edit"; // edit.jsp로 이동
    }

    // 게시물 수정 처리
    @PostMapping("/update")
    public String updateTour(@ModelAttribute TourVO tour) {
        tourService.updateTour(tour);
        return "redirect:/tour/list"; // 수정 후 목록으로 리다이렉트
    }

    // 게시물 추가 폼
    @GetMapping("/create")
    public String createTourForm(Model model) {
        model.addAttribute("tour", new TourVO());
        return "tour/create"; 
    }

    // 게시물 추가 처리
    @PostMapping("/create")
    public String createTour(@ModelAttribute TourVO tour) {
        tourService.createTour(tour);
        return "redirect:/tour/list"; 
    }

    // 게시물 삭제
    @PostMapping("/delete")
    public String deleteTour(@RequestParam("tour_code") String tourCode) {
        tourService.deleteTour(tourCode);
        return "redirect:/tour/list"; 
    }
}
