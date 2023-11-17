package kr.co.withmall.dao;

import org.apache.ibatis.annotations.Mapper;


import kr.co.withmall.dto.OrderDetailDto;
import kr.co.withmall.dto.OrderDto;
import kr.co.withmall.dto.OrderPageDetailDto;

@Mapper
public interface OrderMapper {
  public void insertOrder(OrderDto orderDto) throws Exception;
  public void insertOrderDetail(OrderDetailDto orderDetailDto) throws Exception;
  
  /* 주문 상품 정보 */  
  public OrderPageDetailDto getPrdtInfo(int prdtNum); 

}
