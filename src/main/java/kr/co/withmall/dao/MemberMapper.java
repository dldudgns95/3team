package kr.co.withmall.dao;

import kr.co.withmall.dto.MemberDto;

public interface MemberMapper {
	public int insertMember(MemberDto member);
	public int insertNaverMember(MemberDto member);
	
}
