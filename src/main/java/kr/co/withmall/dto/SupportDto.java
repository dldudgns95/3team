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
public class SupportDto {
	//번호
	private int annNo;
	//제목
	private String annTitle;  
	//내용
	private String annContent;
	//첨부파일
	private String annFile;
	//등록일
	private Date annDate;
	
}

