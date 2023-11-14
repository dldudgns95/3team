package kr.co.withmall.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.withmall.dto.MemberDto;

public interface MemberService {
	public void login(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public MemberDto getMember(String email);
	public void logout(HttpServletRequest request, HttpServletResponse response);
	public String getNaverLoginURL(HttpServletRequest request) throws Exception;
	public String getNaverLoginAccessToken(HttpServletRequest request) throws Exception;
	public MemberDto getNaverProfile(String accessToken) throws Exception;
	public void naverJoin(HttpServletRequest request, HttpServletResponse response);
	public void naverLogin(HttpServletRequest request, HttpServletResponse response, MemberDto naverProfile) throws Exception;
	
	
}
