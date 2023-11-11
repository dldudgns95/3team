package kr.co.withmall.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.withmall.service.MemberService;
import lombok.RequiredArgsConstructor;

@RequestMapping(value="/member")
@RequiredArgsConstructor
@Controller
public class MemberController {
	private final MemberService memberservice;

	@GetMapping("/login.form")
	public String loginForm(HttpServletRequest request, Model model) throws Exception{
		   String referer = request.getHeader("referer");
		    model.addAttribute("referer", referer == null ? request.getContextPath() + "/main.do" : referer);
		    return "member/login";
		  }
	
	@PostMapping("/login.do")
	public void login(HttpServletRequest request, HttpServletResponse response) throws Exception{
		memberservice.login(request, response);
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
	      rtn = "main/join";
	    }
	    return rtn;
	  }
	
	
}
