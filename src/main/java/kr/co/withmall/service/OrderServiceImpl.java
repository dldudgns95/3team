package kr.co.withmall.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.withmall.dao.OrderMapper;
import kr.co.withmall.dto.OrderPageDetailDto;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class OrderServiceImpl implements OrderService {

  @Autowired
  private OrderMapper orderMapper;
  
  @Override
  public List<OrderPageDetailDto> getPrdtInfo(List<OrderPageDetailDto> orders) {
    List<OrderPageDetailDto> result = new ArrayList<OrderPageDetailDto>();    
    
    for(OrderPageDetailDto opd : orders) {
      
      OrderPageDetailDto prdtInfo = orderMapper.getPrdtInfo(opd.getPrdtNum());     

      prdtInfo.setPrdtQty(opd.getPrdtQty()); 
      
      prdtInfo.initSaleTotal();    
      
      result.add(prdtInfo);      
    }   
    
    return result;
  }
}
