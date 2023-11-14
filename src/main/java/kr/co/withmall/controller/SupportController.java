package kr.co.withmall.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



import kr.co.withmall.dto.SupportDto;
import kr.co.withmall.service.SupportService;
import lombok.RequiredArgsConstructor;



@RequiredArgsConstructor
@Controller
@RequestMapping(value="/support")  // support로 시작하는 주소
public class SupportController {

  private final SupportService supportService;
	
  @GetMapping("/list.do") // 매개변수 컨트롤러가 서비스에게 넘겨줄걸 선언
  public String list(HttpServletRequest request, Model model) {  //HttpServletRequest request 는 form이나 contextpath
    supportService.loadSupportList(request, model); // 서비스에게 자기가 선언한거 주기만 한다
	 return "support/list";
    }
  
  //상세 보기
 /*@GetMapping("/detail.do")
 public String detail(@RequestParam(value="annNum", required=false, defaultValue="0") int annNum		 
                    , Model model) {
    // annNo정보 가져오기 
   SupportDto support = supportService.getSupport(annNum);
   model.addAttribute("support", support);
   return "support/detail";
 }
 */ 
}