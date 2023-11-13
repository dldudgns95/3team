package kr.co.withmall.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.withmall.service.MainService;
import lombok.RequiredArgsConstructor;

@RequestMapping("/main")
@RequiredArgsConstructor
@Controller
public class MainController {

  private final MainService mainService;
  
  @GetMapping("/list.do")
  public String getProductListByCategory(@RequestParam("categoryName") String categoryName, Model model) {
    model.addAttribute("categoryName", categoryName);
    model.addAttribute("productList", mainService.getProductTotalListByCategory(categoryName));
    return "main/categoryList";
  }
  
}
