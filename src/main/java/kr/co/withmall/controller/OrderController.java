package kr.co.withmall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.withmall.dto.OrderDto;
import kr.co.withmall.dto.OrderPageDto;
import kr.co.withmall.service.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping(value = "/order")
@RequiredArgsConstructor
@Controller
@Slf4j
public class OrderController {
  
  @Autowired
  public OrderService orderService;
  
  @GetMapping(value="/list/num/{num}")
  public String orderList(@PathVariable("num") int num,OrderPageDto orderPageDto, Model model) throws Exception {
    
    model.addAttribute("orderList", orderService.getPrdtInfo(orderPageDto.getOrders()));
    //model.addAttribute("memberInfo", memberService.getMemberInfo(memberId));
    
    return "order/list";
  }
}
