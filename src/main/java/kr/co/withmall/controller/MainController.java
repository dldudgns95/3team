package kr.co.withmall.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
  
  @ResponseBody
  @GetMapping(value="/couponList.do", produces="application/json")
  public Map<String, Object> getCouponList(@RequestParam(value="num") int num) {
    return mainService.getCouponList(num);
  }
  
  @ResponseBody
  @PostMapping(value="/addMemberCoupon.do", produces="application/json")
  public Map<String, Object> addMemberCoupon(HttpServletRequest request) {
    return mainService.addMemberCoupon(request);
  }
  
  
  
  
  
}
