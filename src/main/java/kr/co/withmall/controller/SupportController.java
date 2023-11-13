package kr.co.withmall.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.withmall.service.SupportService;
import lombok.RequiredArgsConstructor;



@RequiredArgsConstructor
@Controller
@RequestMapping(value="/support")  // support로 시작하는 주소
public class SupportController {

  private final SupportService supportService;
	
  @GetMapping("/support.do") // 매개변수 컨트롤러가 서비스에게 넘겨줄걸 선언
  public String list(HttpServletRequest request, Model model) {  //HttpServletRequest request 는 form이나 contextpath
    supportService.loadSupportList(request, model); // 서비스에게 자기가 선언한거 주기만 한다
	 return "support/list";
    }
  
}