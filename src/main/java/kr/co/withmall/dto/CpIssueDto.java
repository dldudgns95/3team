package kr.co.withmall.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class CpIssueDto {
  private int cpUse;
  private MemberDto member; // private int num;
  private CpDto cp;         // private int cpNum;
}
