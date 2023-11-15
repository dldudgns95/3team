package kr.co.withmall.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.withmall.dto.SupportDto;

public interface SupportService {
	// 목록보기
	  public void loadSupportList(HttpServletRequest request, Model model);
	// 상세보기
	public SupportDto getSupport(int annNum);
	// 작성 디비로 추가하기 	public int addSupport(MultipartHttpServletRequest multipartRequest) throws Exception;
	
}


