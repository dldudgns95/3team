package kr.co.withmall.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.withmall.dto.CartDto;
import kr.co.withmall.dto.CpDto;
import kr.co.withmall.dto.ProductImageDto;

public interface CartService {

  
  public int addCart(CartDto cartDto) throws Exception; // 카트 추가
  public void deleteCart(int cartNum) throws Exception; // 카트 삭제
  public int modifyCount(CartDto cartDto) throws Exception; // 카트 수량 수정
//  public Map<String,List> cartList(CartDto cartDto) throws Exception; // 카트 정보
  public List<CartDto> getCartList(int num) throws Exception;
  public ProductImageDto getCartImage(int prdtNum);
  public List<CartDto> getCartCp(int num);
  
}
