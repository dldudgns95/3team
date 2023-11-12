package kr.co.withmall.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.withmall.dto.MemberDto;

public interface MemberService {
	public void login(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public MemberDto getMember(String email);
	public void logout(HttpServletRequest request, HttpServletResponse response);
	
}
