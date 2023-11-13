package kr.co.withmall.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class ProductDto {
  private int prdtNum;                      // 제품식별번호
  private String prdtName;                  // 제품명
  private String prdtTitle;                 // 제품타이틀
  private String prdtInfo;                  // 제품정보
  private int prdtRealPrice;                // 제품원가
  private int prdtStock;                    // 제품재고
  private int prdtHit;                      // 제품조회수
  private ProductCategoryDto categoryDto;   // private int categoryNum
}
