package kr.co.withmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.withmall.service.MainService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class MvcController {

  private final MainService mainService;
  
  @GetMapping(value={"/", "/main.do"})
  public String main(Model model) {
    model.addAttribute("productList", mainService.getProductTotalList());
    model.addAttribute("productTop10List", mainService.getProductHitTop10List());
    return "layout/main";
  }
  
}
