package kr.co.withmall.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
  public String detail(@RequestParam(value="prdtNum", required=false, defaultValue="0") int prdtNum
                      , Model model) {
    ProductDto product = productService.getProduct(prdtNum);
    ProductImageDto productImage = productService.getProductImage(prdtNum); 
    model.addAttribute("product", product);
    model.addAttribute("productImage", productImage);
    productService.increseHit(prdtNum);
    return "product/detail";
  }
  
  @PostMapping(value="/couponList.do", produces="application/json")
  public Map<String, Object> getCouponList(@RequestParam(value="num") int num){
    return productService.getCouponList(num);
  }
  
}
