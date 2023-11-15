package kr.co.withmall.dto;

<<<<<<< HEAD
import java.util.Date;
=======
import java.sql.Date;
import java.util.List;
>>>>>>> main

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class OrderDto {
<<<<<<< HEAD
=======
  
>>>>>>> main
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
<<<<<<< HEAD
  private String deliveryMethod;
  private String payMethod;
  private String cardName;
  private String cardPay;
=======
  private String deleveryMethod;
  private String payMethod;
  private String cartName;
  private String cardPay;
  
  private List<OrderDetailDto> orders;

  
>>>>>>> main
}
