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
public class BoardAskDto {
  private int askNum;
  private String askTitle;
  private String askContent;
  private String askFile;
  private Date askDate;
  private int askState;
  private MemberDto memberDto; // private int num;
}
