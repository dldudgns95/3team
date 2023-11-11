package kr.co.withmall.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.withmall.dto.ProductCategoryDto;
import kr.co.withmall.dto.ProductDto;

@RequestMapping(value="/product")
@Controller
public class ProductController {
  private ProductCategoryDto categoryDto;
  private ProductDto productDto;
  
  @GetMapping("/detail.do")
  public String detail(HttpServletRequest request) {
    return "product/detail";
  }
  
}
