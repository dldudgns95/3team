package kr.co.withmall.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.withmall.dto.CpDto;
import kr.co.withmall.dto.ProductDto;
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
  
  // 제품 목록 가져오기
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
  
  // 작성 결과 저장
  @PostMapping("/addPrdt.do")
  public String addPrdt(HttpServletRequest request, RedirectAttributes redirectAttributes) {
    int addResult = adminService.addPrdt(request);
    redirectAttributes.addFlashAttribute("addResult", addResult);
    return "redirect:/admin/prdtList.do";
  }
  
  // 이미지 경로
  @PostMapping(value ="/imageUpload.do", produces = "application/json")
  @ResponseBody
  public Map<String, Object> imageUpload(MultipartHttpServletRequest multipartRequest){
    return adminService.imageUpload(multipartRequest);
  }
  
  
  // 편집
  @GetMapping("/prdtEdit.form")
  public String edit(@RequestParam("prdtNum") int prdtNum, Model model) {
    //System.out.println(prdtNum);
    ProductDto prdt = adminService.getPrdt(prdtNum);
    model.addAttribute("prdt", prdt);
    return "admin/prdt/prdtEdit";
  }

 
 // 수정
  @PostMapping("/modifyPrdt.do")
  public String modifyPrdt(HttpServletRequest request, RedirectAttributes redirectAttributes) {
    int modifyResult = adminService.modifyPrdt(request);
    redirectAttributes.addFlashAttribute("modifyResult", modifyResult);
    return "redirect:/admin/prdtList.do";
  }
  
  // 제품 삭제
  @GetMapping("/remove.do")
  public String remove(@RequestParam(value = "prdtNum" , required = false, defaultValue = "0") int prdtNum
                      , RedirectAttributes redirectAttributes) {
    int removeResult = adminService.deletePrdt(prdtNum);
    redirectAttributes.addFlashAttribute("removeResult", removeResult);
    return "redirect:/admin/prdtList.do";
  }
  
  // 제품 검색
  @GetMapping("/searchPrdt.do")
  public String searchPrdt(HttpServletRequest request, Model model) {
    adminService.loadSearchPrdtList(request, model);
    return "admin/prdt/prdtList";
  }
  

  
  // 회원관리이동
  @GetMapping("/userList.do")
  public String user(HttpServletRequest request, Model model) {
    adminService.loadMemList(request, model);
    return "admin/user/user";
  }
  
////  // 회원상세페이지
////  @GetMapping("/userDetail.do")
////  public String userDetail(@RequestParam(value = "num", required = false, defaultValue = "0") int num, Model model) {
////    MemberDto mem = adminService.getMem(num);
////    model.addAttribute("mem", mem );
////    return "admin/user/userDetail";
////  }

  
  // 회원 검색
  @GetMapping("/search.do")
  public String search(HttpServletRequest request, Model model) {
    adminService.loadSearchList(request, model);
    return "admin/user/user";
  }

  // 회원 강제 삭제
  @PostMapping("/useRemove.do")
    public String useRemove(@RequestParam(value = "num") int num, RedirectAttributes redirectAttributes) {
      int removeResult = adminService.deleteUser(num);
      redirectAttributes.addFlashAttribute("removeResult", removeResult);
      return "redirect:/admin/userList.do";
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
  // 주문관리이동
  @GetMapping("/order.do")
  public String order() {
    return "admin/order/order";
  }
  
  // 쿠폰 목록 -> 등록
 
  @GetMapping("/cpList.do")
  public String loadCpList(HttpServletRequest request, Model model) {
      adminService.loadCpList(request, model);
      return "admin/coupon/coupon";
  }

  // 쿠폰 등록 페이지이동
  @GetMapping("/cpWrite.form")
  public String cpWrite() {
    return "/admin/coupon/couponWrite";
  }
  

  
  // 쿠폰 삽입
  @PostMapping("/addCp.do")
  public String addCp(HttpServletRequest request, RedirectAttributes redirectAttributes) {
    int addResult = adminService.insertCp(request);
    redirectAttributes.addFlashAttribute("addResult", addResult);
    return "redirect:/admin/cpList.do";
  }
  

  
  // 쿠폰 수정 페이지로 이동
  @GetMapping("/edtitCp.form")
  public String edtitCp(@RequestParam ("cpNum")  int cpNum, Model model) {
    CpDto cp = adminService.getCp(cpNum);
    model.addAttribute("cp", cp);
    return "/admin/coupon/couponEdit";
  }

  
  // 쿠폰 수정 modifyCp.do
  @PostMapping("/modifyCp.do")
  public String modifyCp(HttpServletRequest request, RedirectAttributes redirectAttributes) {
    int modifyCpResult = adminService.modifyCp(request);
    redirectAttributes.addFlashAttribute("modifyCpResult", modifyCpResult);
    return "redirect:/admin/cpList.do";
  }
  
  

  // 쿠폰 삭제
  @PostMapping("/cpRemove.do")
  public String cpRemove(@RequestParam(value = "cpNum") int cpNum, RedirectAttributes redirectAttributes) {
    int removeResult = adminService.deleteCp(cpNum);
    redirectAttributes.addFlashAttribute("removeResult", removeResult);
    return "redirect:/admin/cpList.do";
  }
  

 // 주문 목록 보여주기
  @GetMapping("/orderList.do")
  public String orderList(HttpServletRequest request, Model model) {
    adminService.loadOrderList(request, model);
    return "admin/adminOrder/adminOrder";
  }


 // 제품 카테고리 등록
 
  
 
}
