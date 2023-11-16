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
public class FaqDto {
    //번호
	private int faqNum;
	//제목
	private String faqTitle;
	//내용
	private String faqContent;
	//카테고리
	private int faqCategory;
	//작성일
	private Date faqDate;
}
