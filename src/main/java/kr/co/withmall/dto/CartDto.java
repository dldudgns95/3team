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
  private int cartNo;
  private int prdtNum;
  private int num;
  private int prdtQty;
}
