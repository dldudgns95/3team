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
public class MemberDto {
	private int num;
	private String name;
	private String pw;
	private String mobile;
	private String email;
	private String postcode;
	private String jibunaddress;
	private String roadaddress;
	private String detailaddress;
	private String birth;
	private String gender;
	private Date mdate;
	private int auth;
	private int status;
	private int agree;
	private Date regDate;
	private OrderDto orderDto;
	
}
