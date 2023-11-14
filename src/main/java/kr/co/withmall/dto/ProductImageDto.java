package kr.co.withmall.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class ProductImageDto {

  private String imagePath;
  private String filesystemName;
  private ProductDto productDto;   //  private int prdtNum;

}
