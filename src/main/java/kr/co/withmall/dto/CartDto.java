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
  private int cartNo; //장바구니 번호
  private int num; //회원 번호
  private int prdtNum; //제품 번호
  private int prdtQty; //제품 수량
}
