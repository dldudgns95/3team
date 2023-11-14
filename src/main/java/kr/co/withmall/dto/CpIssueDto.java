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
  private MemberDto memberDto;    // private int num;
  private CpDto cpDto;            // private int cpNum;
}
