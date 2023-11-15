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
public class OrderDetailDto {

  /* view에서 전달받는 값 */
  private int prdtNum;
  private int prdtQty;
  
  /* DB에서 꺼내올 값 */
  private String prdtName;
  private int orderPrice;
  
  /* 계산값 */
  private int orderTotalPrice;
  
}
