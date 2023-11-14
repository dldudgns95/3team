package kr.co.withmall.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import kr.co.withmall.dto.SupportDto;

public interface SupportService {
	// 목록보기
	  public void loadSupportList(HttpServletRequest request, Model model);
	// 상세보기
	public SupportDto getSupport(int annNum);
	  
	
}