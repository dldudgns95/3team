package kr.co.withmall.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class PrdtImageDto {
  
  private int prdtNum;
  private String imagePath;
  private String filesystemName;

}
