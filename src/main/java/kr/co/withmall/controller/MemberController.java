package kr.co.withmall.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.withmall.dto.MemberDto;
import kr.co.withmall.service.MemberService;
import lombok.RequiredArgsConstructor;

@RequestMapping(value="/member")
@RequiredArgsConstructor
@Controller
public class MemberController {
	private final MemberService memberService;

	@GetMapping("/login.form")
	public String loginForm(HttpServletRequest request, Model model) throws Exception{
		   String referer = request.getHeader("referer");
		    model.addAttribute("referer", referer == null ? request.getContextPath() + "/main.do" : referer);
		    model.addAttribute("naverLoginURL", memberService.getNaverLoginURL(request));
		    return "member/login";
		  }
	
	 @GetMapping("/naver/getAccessToken.do")
	  public String getAccessToken(HttpServletRequest request) throws Exception {
	    // 네이버로그인-2
	    String accessToken = memberService.getNaverLoginAccessToken(request);
	    return "redirect:/member/naver/getProfile.do?accessToken=" + accessToken;
	  }
	 
	 @GetMapping("/naver/getProfile.do")
	 public String getProfile(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
	    // 네이버로그인-3
	    MemberDto naverProfile = memberService.getNaverProfile(request.getParameter("accessToken"));
	    // 네이버로그인 후속 작업(처음 시도 : 간편가입, 이미 가입 : 로그인)
	    MemberDto member = memberService.getMember(naverProfile.getEmail());
	    if(member == null) {
	      // 네이버 간편가입 페이지로 이동
	      model.addAttribute("naverProfile", naverProfile);
	      return "member/naver_join";
	    } else {
	      // naverProfile로 로그인 처리하기
	      memberService.naverLogin(request, response, naverProfile);
	      return "redirect:/main.do";
	    }
	 }
	  
	  @PostMapping("/naver/join.do")
	  public void naverJoin(HttpServletRequest request, HttpServletResponse response) {
	    memberService.naverJoin(request, response);
	  }	  
	 
	
	@PostMapping("/login.do")
	public void login(HttpServletRequest request, HttpServletResponse response) throws Exception{
		memberService.login(request, response);
	}
	
	@GetMapping("/agree.form")
	public String agreeForm() {
		return "member/agree";
	}
	
	@GetMapping("/join.form")
	  public String joinForm(@RequestParam(value="service", required=false, defaultValue="off") String service
	                       , @RequestParam(value="event", required=false, defaultValue="off") String event
	                       , Model model) {
	    String rtn = null;
	    if(service.equals("off")) {
	      rtn = "redirect:/main.do";
	    } else {
	      model.addAttribute("event", event);  
	      rtn = "member/join";
	    }
	    return rtn;
	  }

	@PostMapping("/join.do")
	public void join(HttpServletRequest request, HttpServletResponse response) {
		memberService.join(request, response);
		
	}
	 
	@GetMapping(value="/checkEmail.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Map<String, Object>> checkEmail(@RequestParam String email) {
	  return memberService.checkEmail(email);
	}
	  
	@GetMapping(value="/sendCode.do", produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Map<String, Object>> sendCode(@RequestParam String email) {
      return memberService.sendCode(email);
	  }
	  
	
	@GetMapping("/logout.do")
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		memberService.logout(request, response);
	}
	@GetMapping("/mypage.do")
	public String mypage( ) {
		return "member/mypage";
	}
	
	@GetMapping("/mypageedit.form")
	public String mypageedit() {
		return "member/mypageedit";
	}
	
	@GetMapping("/memberoutform.do")
	public String memberoutform() {
		return "member/memberoutform";
	}
	
	@GetMapping("/orderlist.do")
	public String orderlist() {
		return "member/orderlist";
	}
	@GetMapping("/qnalist.do")
	public String qnalist() {
		return "member/qnalist";
	}
	@GetMapping("/cart.do")
	public String cart() {
		return "member/cart";
	}
	@GetMapping("/zimlist.do")
	public String zimlist() {
		return "member/zimlist";
	}
}
