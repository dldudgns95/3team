package kr.co.withmall.dao;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartHttpServletRequest;



import kr.co.withmall.dto.SupportDto;

@Mapper
public interface SupportMapper {
	// 공지사항 갯수
	public int getSupportCount();
	// 공지사항 목록
	public List<SupportDto> getSupportList(Map<String, Object> map);
	// 상세보기
	 public SupportDto getSupport(int annNum);
	// 작성 디비로 추가하기
	 public int addSupport(SupportDto supportDto);
	 // 수정하기
	 public int updateSupport(SupportDto support);
	 //삭제하기
	 public int deleteSupport(int annNum);
}
