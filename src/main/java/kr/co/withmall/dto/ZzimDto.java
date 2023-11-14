package kr.co.withmall.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class ZzimDto {
  private int zzim_num;
  private MemberDto memberDto;
  private ProductDto productDto;
}
