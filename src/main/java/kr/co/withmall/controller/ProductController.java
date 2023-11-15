package kr.co.withmall.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.withmall.dto.CpDto;
import kr.co.withmall.dto.MemberDto;
import kr.co.withmall.dto.ProductDto;
import kr.co.withmall.dto.ProductImageDto;
import kr.co.withmall.service.ProductService;
import lombok.RequiredArgsConstructor;

@RequestMapping(value="/product")
@RequiredArgsConstructor
@Controller
public class ProductController {
  
  private final ProductService productService;
  
  @GetMapping("/detail.do")
  public String detail(@RequestParam(value="prdtNum") int prdtNum
                      , Model model) {
    ProductDto product = productService.getProduct(prdtNum);
    ProductImageDto productImage = productService.getProductImage(prdtNum); 
    
    model.addAttribute("product", product);
    model.addAttribute("productImage", productImage);   
    productService.increseHit(prdtNum);
    return "product/detail";
  }
  
}
  

