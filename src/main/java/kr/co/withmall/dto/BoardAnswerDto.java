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
public class BoardAnswerDto {
  private int answerNum;
  private int answerContent;
  private Date answerDate;
  private MemberDto memberDto;     // private int num;
  private BoardAskDto boardAskDto; // private int askNum;
}
