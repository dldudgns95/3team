package kr.co.withmall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.withmall.dto.SupportDto;

@Mapper
public interface SupportMapper {
	public int getSupportCount();
	public List<SupportDto> getSupportList(Map<String, Object> map);
}
