package kr.co.withmall.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;

@RequestMapping(value = "/order")
@RequiredArgsConstructor
@Controller
public class OrderController {

  @ResponseBody
  @PostMapping(value="/list.do")
  public String orderList(HttpSession session, Model model) throws Exception {
    return "order/list";
  }
}
