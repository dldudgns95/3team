package kr.co.withmall.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.withmall.dto.CartDto;

public interface CartService {

  
  public int addCart(CartDto cartDto) throws Exception; // 카트 추가
  public void deleteCart(int cartNum) throws Exception; // 카트 삭제
  public Map<String,List> cartList(CartDto cartDto) throws Exception; // 카트 정보
  public List<CartDto> getCartList(int num) throws Exception;
  
}
