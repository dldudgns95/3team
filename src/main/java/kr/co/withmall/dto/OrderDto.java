package kr.co.withmall.dto;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class OrderDto {
  
  private int orderNum;
  private int num;
  private int orderTotalPrice;
  private int orderStatus;
  private Date orderDate;
  private String orderNotice;
  private String receiverName;
  private String receiverPhone;
  private String ordererName;
  private String ordererPhone;
  private String deleveryMethod;
  private String payMethod;
  private String cartName;
  private String cardPay;
  
  private List<OrderDetailDto> orders;

  
}