package kr.co.withmall.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.withmall.dto.CartDto;
import kr.co.withmall.service.CartService;
import lombok.RequiredArgsConstructor;

@RequestMapping(value = "/cart")
@RequiredArgsConstructor
@Controller
public class CartController {
  
  private CartService cartService;
  private CartDto cartDto;
  //수정 private MemberDto memberDto;
  
  @GetMapping("/list.do")
  public String list(HttpServletRequest request, Model model) {
  //매퍼에서 목록 resultmap 만들고 오겠음  
   return "cart/list";
  }
  
  
  
}
