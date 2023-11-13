package kr.co.withmall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.withmall.dto.MemberDto;
import kr.co.withmall.dto.ProductDto;
import kr.co.withmall.dto.ProductImageDto;

@Mapper
public interface AdminMapper {
  
  // 제품 삽입
  public int insertPrdt(ProductDto prdt);
  // 제품 사진 삽입
  public int insertPrdtImage(ProductImageDto prdtImage);
  
  // 제품 번호
  public List<ProductDto> prdtNum(ProductDto prdt);
  
  
  public ProductDto getPrdt(int prdtNum);
  
  
  // 제품목록 가져오기
  public int getPrdtCount();  
  public List<ProductDto> getPrdtList(Map<String, Object> map);
  
  // 제품 수정
  public int updatePrdt(ProductDto prdt);
  
  ///////////////////////////////////////////////////
  
  // 회원목록 가져오기
  public int getMemCount();
  public List<MemberDto> getMemList(Map<String, Object> map );
  
  // 특정 회원 별 매출액
  //public Map<String, Object> getSalesUser(Map<String, Object> map);
  
  
  // 회원 목록 검색
  public int getSearchCount(Map<String, Object> map);
  public List<MemberDto> getSearchList(Map<String, Object> map);
  
  
  //////////////////////////////////////////////////////////
  
  // 조회수 증가 
  public int updateHit(int prdtNum);
}
