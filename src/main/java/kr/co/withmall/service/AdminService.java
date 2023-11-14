package kr.co.withmall.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.withmall.dto.ProductDto;

public interface AdminService {

   //public int addAdmin(HttpServletRequest request);
   //public Map<String, Object> imageUpload(MultipartHttpServletRequest httpServletRequest);
  

  
  //이미지 저장...
  public Map<String, Object> imageUpload(MultipartHttpServletRequest multipartRequest);

  // 제품 목록
  public void loadPrdtList(HttpServletRequest request, Model model);  
  
  //제품 삽입 저장
  public int addPrdt(HttpServletRequest request);
 
  // 제품 번호로...
  public ProductDto getPrdt(int prdtNum); 
  
  // 제품 수정
  public int modifyPrdt(HttpServletRequest request);
  
  // 제품 삭제
  public int deletePrdt(int prdtNum);
  
  
  // 회원 목록
  public void loadMemList(HttpServletRequest request, Model model);
  public void loadSearchList(HttpServletRequest request, Model model);

//  // 회원 별 매출액
//  //public void getSalesUser(HttpServletRequest request, Model model);

}
