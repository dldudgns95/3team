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
	private String cell;
	private String email;
	private String postcode;
	private String jibunaddress;
	private String detailaddress;
	private String birth;
	private int gender;
	private Date mdate;
	private int auth;
	private Date regDate;
	
}
