package kr.co.withmall.service;

import java.util.List;

import kr.co.withmall.dto.OrderDetailDto;
import kr.co.withmall.dto.OrderDto;
import kr.co.withmall.dto.OrderPageDetailDto;

public interface OrderService {

  /* 주문 정보 */
  public List<OrderPageDetailDto> getPrdtInfo(List<OrderPageDetailDto> orders);
  
}
