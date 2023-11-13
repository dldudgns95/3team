package kr.co.withmall.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class CartDto {
  // cart
  private int cartNum; //장바구니 번호
  private int num; //회원 번호
  private int prdtNum; //제품 번호
  private int prdtQty; //제품 수량
  
  // product
  private String prdtTitle;                 // 제품타이틀
  private int prdtRealPrice;                // 제품원가
  private int prdtStock;                    // 제품재고
  
  
}
