package kr.co.withmall.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.withmall.dto.InactiveMemberDto;
import kr.co.withmall.dto.LeaveMemberDto;
import kr.co.withmall.dto.MemberDto;

@Mapper
public interface MemberMapper {
	public MemberDto getMember(Map<String, Object> map);
	public int insertMember(MemberDto Member);
	public int insertNaverMember(MemberDto member);
	public LeaveMemberDto getLeaveMember(Map<String, Object> map);
	public InactiveMemberDto getInactiveMember(Map<String, Object> map);
	public int insertLeaveMember(MemberDto member);
	public int deleteMember(MemberDto member);
}
