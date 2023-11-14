package kr.co.withmall.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface SupportService {
	  public void loadSupportList(HttpServletRequest request, Model model);
}
