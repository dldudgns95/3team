package kr.co.withmall.dto;

import java.util.Date;

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
  private String deliveryMethod;
  private String payMethod;
  private String cardName;
  private String cardPay;
}
