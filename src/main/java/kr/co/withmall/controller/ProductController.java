package kr.co.withmall.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
  
  @ResponseBody
  @PostMapping(value="/addZzim.do", produces="application/json")
  public Map<String, Object> addZzim(@RequestBody HashMap<String, Object> map) { 
    int addResult = productService.addZzim(map);
    return Map.of("addResult", addResult);
  }
  
  @ResponseBody
  @GetMapping(value="/zzimPrdt.do", produces="application/json")
  public Map<String, Object> getZzim(HttpServletRequest request) {
    Map<String, Object> map = Map.of("num", Integer.parseInt(request.getParameter("num")), "prdtNum", Integer.parseInt(request.getParameter("prdtNum")));
    return Map.of("zzimDto",productService.getZzimPrdt(map));
  }
}
  

