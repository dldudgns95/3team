package kr.co.withmall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.withmall.dto.OrderDto;
import lombok.RequiredArgsConstructor;

@RequestMapping(value = "/order")
@RequiredArgsConstructor
@Controller
public class OrderController {
  
  @GetMapping(value="/order/{num}")
  public void orderList(@PathVariable("num") String num,OrderDto orderDto, Model model) throws Exception {
    System.out.println("num : "+num);
    System.out.println("order : "+orderDto.getOrders());
  }
}
