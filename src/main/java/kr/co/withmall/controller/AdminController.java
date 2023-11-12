package kr.co.withmall.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.withmall.service.AdminService;
import lombok.RequiredArgsConstructor;

@RequestMapping("/admin")
@RequiredArgsConstructor
@Controller
public class AdminController {
  
  private final AdminService adminService;
  
  @GetMapping("/admin.do")
  public String admin() {
    return "admin/admin";
  }
  
  @GetMapping("/prdtList.do")
  public String loadPrdtList(HttpServletRequest request, Model model) {
      adminService.loadPrdtList(request, model);
      return "admin/prdt/prdtList";
  }

  
  // 상품작성페이지이동
  @GetMapping("/prdtWrite.form")
  public String prdtWrite() {
    return "admin/prdt/prdtWrite";
  }
  
//  // 제품 목록 이동
//  @GetMapping("/loadrdtList.do")
//  public  String loadPrdtList(HttpServletRequest request, Model model) {
//    return "admin/prdt/prdtList";
//  }
  
  
  // 이미지 경로..
  @PostMapping(value ="/imageUpload.do", produces = "application/json")
  @ResponseBody
  public Map<String, Object> imageUpload(MultipartHttpServletRequest multipartRequest){
    return adminService.imageUpload(multipartRequest);
  }
//  
//  // 작성 결과 저장...
//  @PostMapping("/addPrdt.do")
//  public String addPrdt(HttpServletRequest request, RedirectAttributes redirectAttributes) {
//    int addResult = adminService.addAdmin(request);
//    redirectAttributes.addFlashAttribute("addResult", addResult);
//    return "redirect:/admin/prdt/prdtList.do";
//  }
  
    
  
  
  // 회원관리이동
  @GetMapping("/userList.do")
  public String user(HttpServletRequest request, Model model) {
    adminService.loadMemList(request, model);
    return "admin/user/user";
  }
//  // 회원상세페이지
//  @GetMapping("/userDetail.do")
//  public String userDetail(@RequestParam(value = "num", required = false, defaultValue = "0") int num, Model model) {
//    MemberDto mem = adminService.getMem(num);
//    model.addAttribute("mem", mem );
//    return "admin/user/userDetail";
//  }
  
  
  // 회원 검색
  @GetMapping("/search.do")
  public String search(HttpServletRequest request, Model model) {
    adminService.loadSearchList(request, model);
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
