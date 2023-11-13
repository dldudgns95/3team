package kr.co.withmall.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
  
//  @GetMapping("/prdtList.do")
//  public String loadPrdtList(HttpServletRequest request, Model model) {
//      adminService.loadPrdtList(request, model);
//      return "admin/prdt/prdtList";
//  }

  
  // 상품작성페이지이동
  @GetMapping("/prdtWrite.form")
  public String prdtWrite() {
    return "admin/prdt/prdtWrite";
  }
  
//  
//  // 이미지 경로.. 저장안됨
//  @PostMapping(value ="/imageUpload.do", produces = "application/json")
//  @ResponseBody
//  public Map<String, Object> imageUpload(MultipartHttpServletRequest multipartRequest){
//    return adminService.imageUpload(multipartRequest);
//  }
//  
//  // 작성 결과 저장
//  @PostMapping("/addPrdt.do")
//  public String addPrdt(HttpServletRequest request, RedirectAttributes redirectAttributes) {
//    int addResult = adminService.addPrdt(request);
//    redirectAttributes.addFlashAttribute("addResult", addResult);
//    return "redirect:/admin/prdtList.do";
//  }
//  
////  // 값 못가져오고 있음... ㅠ
////  @GetMapping("/prdtEdit.form")
////  public String edit(@RequestParam("prdtNum") int prdtNum, Model model) {
////    System.out.println(prdtNum);
////    //ProductDto prdt = adminService.getPrdt(prdtNum);
////    return "admin/prdt/prdtEdit";
////  }
//
////  // 값 못가져오고 있음... ㅠ
////  @PostMapping("/prdtEdit.form")
////  public String edit(@ModelAttribute("prdt") ProductDto prdt) {
////    return "admin/prdt/prdtEdit";
////  }
// 
// // 수정 
//  @PostMapping("/modifyPrdt.do")
//  public String modifyPrdt(HttpServletRequest request, RedirectAttributes redirectAttributes) {
//    int modifyResult = adminService.modifyPrdt(request);
//    redirectAttributes.addFlashAttribute("modifyResult", modifyResult);
//    System.out.println("modifyPrdt.do - modifyResult: " + modifyResult);
//
//    return "redirect:/admin/prdtList.do";
//  }
  
  
//  // 회원관리이동
//  @GetMapping("/userList.do")
//  public String user(HttpServletRequest request, Model model) {
//    adminService.loadMemList(request, model);
//    return "admin/user/user";
//  }
////  // 회원상세페이지
////  @GetMapping("/userDetail.do")
////  public String userDetail(@RequestParam(value = "num", required = false, defaultValue = "0") int num, Model model) {
////    MemberDto mem = adminService.getMem(num);
////    model.addAttribute("mem", mem );
////    return "admin/user/userDetail";
////  }
//  
//  @GetMapping("/prdtDetail.do")
//  public String prdtDetail(HttpServletRequest request, Model model) {
//    return "admin/prdt/prdtDetail";
//  }
//  
//  // 회원 검색
//  @GetMapping("/search.do")
//  public String search(HttpServletRequest request, Model model) {
//    adminService.loadSearchList(request, model);
//    return "admin/user/user";
//  }
//
  
  
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
