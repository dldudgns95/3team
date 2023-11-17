package kr.co.withmall.controller;





import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



import kr.co.withmall.dto.SupportDto;
import kr.co.withmall.service.SupportService;
import lombok.RequiredArgsConstructor;



@RequiredArgsConstructor
@Controller
@RequestMapping(value="/support")  // support로 시작하는 주소
public class SupportController {

  private final SupportService supportService;
	// 목록보기
  @GetMapping("/list.do") // 매개변수 컨트롤러가 서비스에게 넘겨줄걸 선언
  public String list(HttpServletRequest request, Model model) {  //HttpServletRequest request 는 form이나 contextpath
    supportService.loadSupportList(request, model); // 서비스에게 자기가 선언한거 주기만 한다
	 return "support/list";
    }
  
  //상세 보기
 @GetMapping("/detail.do")
 public String detail(@RequestParam(value="annNum", required=false, defaultValue="0") int annNum		 
                    , Model model) {
    // annNum정보 가져오기 
   SupportDto support = supportService.getSupport(annNum);
   model.addAttribute("support", support);
   return "support/detail";
 }
  // 공지사항 작성페이지로 이동
	 @GetMapping("/write.form")
	 public String write() {
	   return "support/write";
 }
	 // 자주 묻는 질문 게시판
	 @GetMapping("/faqList.do")
	 public String faqList() {
		 return "support/faq/list";
	 }
	 // 문의사항 게시판
	 @GetMapping("/askList.do")
	 public String askList() {
		 return "support/ask/list";
	 }
	 
	 
	 // 작성 결과 저장
	 @PostMapping("/add.do") 
	  public String addSupport(MultipartHttpServletRequest multipartRequest, RedirectAttributes redirectAttributes) throws Exception {
		int addResult = supportService.addSupport(multipartRequest);
	    redirectAttributes.addFlashAttribute("addResult", addResult);
	    return "redirect:/support/list.do";
	  }
	 
	// 편집  //post : 데이터전송 //get : 주소
	  @PostMapping("/edit.form")  // value에 어떤값을 쓰는거임 
	  public String edit(@RequestParam(value="annNum", required=false, defaultValue="0") int annNum
	               , Model model) {
	    model.addAttribute("support", supportService.getSupport(annNum));
	    return "support/edit";
	  }

	  
	  // 수정하기             
	  @PostMapping("/modify.do")
	  public String modify(SupportDto support, RedirectAttributes redirectAttributes) {
	    int modifyResult = supportService.modifySupport(support);
	    redirectAttributes.addFlashAttribute("modifyResult", modifyResult);
	    return "redirect:/support/detail.do?annNum=" + support.getAnnNum();
	  }
	  
	  // 삭제하기
	  @PostMapping("/remove.do")
	  public String remove(@RequestParam(value="annNum", required=false, defaultValue="0") int annNum
	                     , RedirectAttributes redirectAttributes) {
	    int removeResult = supportService.removeSupport(annNum);
	    redirectAttributes.addFlashAttribute("removeResult", removeResult);
	    return "redirect:/support/list.do";    
	  }
	  

}