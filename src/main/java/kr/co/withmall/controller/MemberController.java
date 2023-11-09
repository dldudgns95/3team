package kr.co.withmall.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.withmall.service.MemberService;
import lombok.RequiredArgsConstructor;

@RequestMapping(value="/member")
@RequiredArgsConstructor
@Controller
public class MemberController {
	private final MemberService memberService;
	
	@GetMapping("/login.form")
	public String loginForm(HttpServletRequest request, Model model) throws Exception {
		String referer = request.getHeader("referer");
		model.addAttribute("referer", referer == null ?request.getContextPath() + "/main.do" : referer);
		model.addAttribute("naverLoginURL", memberService.getNaverLoginURL(request));
		return "member/login";
		
	}
}
