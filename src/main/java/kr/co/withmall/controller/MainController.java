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
  public String getProductListByCategory(HttpServletRequest request, Model model) {
    model.addAttribute("categoryName", request.getParameter("categoryName"));
    model.addAttribute("productList", mainService.getProductTotalListByCategory(request));
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
  
  @GetMapping(value="/zzimList.do")
  public String getZzimProductList(@RequestParam(value="num") int num, Model model) {
    model.addAttribute("productList", mainService.getZzimProductList(num));
    return "main/zzim";
  }
  
  @ResponseBody
  @GetMapping(value="/unusedCouponList.do", produces="application/json")
  public Map<String, Object> addMemberCoupon(@RequestParam("num") int num) {
    return mainService.getUnusedCouponList(num);
  }
  
  @GetMapping("/search.do")
  public String getProductListByQuery(HttpServletRequest request, Model model) {
    model.addAttribute("column", request.getParameter("column"));
    model.addAttribute("query", request.getParameter("query"));
    model.addAttribute("productList", mainService.getProductListByQuery(request));
    return "main/searchList";
  }
  
  
  
  
  
}
