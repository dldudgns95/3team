package kr.co.withmall.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.withmall.dto.MemberDto;

@Mapper
public interface MemberMapper {
	public MemberDto getMember(Map<String, Object> map);
	public int insertMember(MemberDto Member);	
}
