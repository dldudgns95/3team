package kr.co.withmall.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class CpDto {
  private int cpNum;
  private String cpName;
  private String cpInfo;
  private int cpPrice;
  private int cpMin;
  private Date startAt;
  private Date endAt;
}
