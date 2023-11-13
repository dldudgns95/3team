package kr.co.withmall.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class ProductCategoryDto {
  private int categoryNum;       // 카테고리번호
  private String categoryName;   // 카테고리이름
}
