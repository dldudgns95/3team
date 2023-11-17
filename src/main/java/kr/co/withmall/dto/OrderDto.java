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
  
  private int orderNum; //주문번호
  private int num; //주문 회원
  private int orderTotalPrice; // 주문 가격
  private int orderStatus; // 주문 상태
  private Date orderDate; // 주문 날짜
  private String orderNotice; // 주문 전달사항
  private String receiverName; // 받는 이 이름
  private String receiverPhone; // 받는 이 연락처
  private String ordererName; // 주문자 이름
  private String ordererPhone; // 주문자 연락처
  private String deleveryMethod; // 배송방법
  private String payMethod; // 결제방법
  private String cartName; // 카드 이름
  private String cardPay; // 카드 할부
  
  /* 주문 상품 */
  private List<OrderDetailDto> orders;
  
  /* DB테이블 존재 하지 않는 데이터 */
  
  /* 판매가(모든 상품 비용) */
  private int orderSalePrice;
  
  /* 쿠폰 */
  private int orderCoupon;
  private int useCoupon;
  
  /* 최종 판매 비용 */
  private int orderFinalSalePrice;
  
  public int calculateOrderTotalPrice() {
    orderSalePrice = 0;
    orderCoupon = 0;

    /* 상품 비용 & 적립포인트 계산 */
    for (OrderDetailDto order : orders) {
      orderSalePrice += order.getTotalPrice();
      orderCoupon += order.getTotalCoupon();
    }

    /* 최종 비용(상품 비용 + 배송비 - 사용 포인트) 계산 */
    orderFinalSalePrice = orderSalePrice - useCoupon;
    
    /* 총 주문 가격 반환 */
    return orderTotalPrice = orderFinalSalePrice;
  }
  }
