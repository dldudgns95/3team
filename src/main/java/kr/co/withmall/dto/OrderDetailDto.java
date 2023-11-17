package kr.co.withmall.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class OrderDetailDto {

  /* 주문 번호 */
  private int orderNum;
  
  /* 상품 번호 */
    private int prdtNum;
    
  /* 주문 수량 */
    private int prdtQty;

  /* ORDER_DETAIL 기본키 */
    private int orderDetailNum;
    
  /* 상품 한 개 가격 */
    private int prdtRealPrice;
    
  /* DB테이블 존재 하지 않는 데이터 */
    
  /* 할인 적용된 가격 */
    private int salePrice;
    
  /* 총 가격(할인 적용된 가격 * 주문 수량) */
    private int totalPrice;
    
    /* 총 획득 포인트(상품 한개 구매 시 획득 포인트 * 수량) */
    private int totalCoupon;
    
  

  
}
