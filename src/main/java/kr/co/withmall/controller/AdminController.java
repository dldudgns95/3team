package kr.co.withmall.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")

@Controller
public class AdminController {
  
  @GetMapping("/admin.do")
  public String admin() {
    return "admin/admin";
  }
  
  // 상품등록이동
  @GetMapping("/prdtList.do")
  public String prdtList() {
    return "admin/prdt/prdtList";
  }
  // 상품작성페이지이동
  @GetMapping("/prdtWrite.form")
  public String prdtWrite() {
    return "admin/prdt/prdtWrite";
  }

  
  
  
  // 회원관리이동
  @GetMapping("/userList.do")
  public String user() {
    return "admin/user/user";
  }
  
  // 매출확인이동
  @GetMapping("/sales.do")
  public String sales() {
    return "admin/sales/sales";
  }
  
  // 고객센터
  @GetMapping("/cstm.do")
  public String cstm() {
    return "admin/cstm/cstm";
  }
  
  // 주문관리이동
  @GetMapping("/order.do")
  public String order() {
    return "admin/order/order";
  }
  


  
 
}
