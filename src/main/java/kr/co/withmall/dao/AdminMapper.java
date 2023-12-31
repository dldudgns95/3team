package kr.co.withmall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.withmall.dto.CpDto;
import kr.co.withmall.dto.MemberDto;
import kr.co.withmall.dto.OrderDto;
import kr.co.withmall.dto.ProductDto;
import kr.co.withmall.dto.ProductImageDto;

@Mapper
public interface AdminMapper {
  
  // 제품 삽입
  public int insertProduct(ProductDto prdt);

  // 제품 이미지
  public int insertPrdtImage(ProductImageDto prdtImage);
  
  // 임시 이미지 삭제
  public List<ProductImageDto> getPrdtImageInYesterday();
  
  // 제품목록 가져오기
  public int getPrdtCount();  
  public List<ProductDto> getPrdtList(Map<String, Object> map);
  
  //제품 번호
  public ProductDto getPrdt(int prdtNum);
  // 제품 수정
  public int updatePrdt(ProductDto prdt);
  
  //
  public List<ProductImageDto> getPrdtImageList(int prdtNum);
  public int deletePrdtImage(String filesystemName);
  public int deletePrdtImageList(int prdtNum);
  
  // 제품 삭제
  public int deletePrdt(int prdtNum);
  
  //제품 검색
  public int getSearchPrdtCount(Map<String, Object> map);
  public List<ProductDto> getSearchPrdtList(Map<String, Object> map);
  
  ///////////////////////////////////////////////////
  
  // 회원목록 가져오기
  public int getMemCount();
  public List<MemberDto> getMemList(Map<String, Object> map );
  
//  // 특정 회원 별 매출액
//  //public Map<String, Object> getSalesUser(Map<String, Object> map);
  
  
  // 회원 검색
  public int getSearchCount(Map<String, Object> map);
  public List<MemberDto> getSearchList(Map<String, Object> map);
  
  // 회원 삭제
  public int deleteUser(int num);
  
  
  // 쿠폰 삽입
  public int insertCp(CpDto cp);
  
  // 쿠폰 수정
  public int modifyCp(CpDto cp);
  
  // 쿠폰 목록
  public int getCpCount();
  public List<CpDto> getCpList(Map<String, Object> map);
  

  // 주문목록
  public int getOrderCount();
  public List<OrderDto> getOderList(Map<String, Object> map);
  

  // 쿠폰 정보 가져오기
  public CpDto getCp(int cpNum);

 // 쿠폰 삭제
  public int deleteCp(int cpNum);
  
  
  //
  public int selectPrdtNum();



}

