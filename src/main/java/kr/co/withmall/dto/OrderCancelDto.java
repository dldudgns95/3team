package kr.co.withmall.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class OrderCancelDto {

	private String num; //회원번호
	
	private String orderNum; //주문번호
	
	private String keyword;
	
	private int amount;
	
	private int pageNum;

	
}
