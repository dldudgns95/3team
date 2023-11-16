package kr.co.withmall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.withmall.dto.BoardAskDto;
import kr.co.withmall.dto.CpDto;
import kr.co.withmall.dto.CpIssueDto;
import kr.co.withmall.dto.ProductDto;
import kr.co.withmall.dto.ProductImageDto;

@Mapper
public interface MainMapper {
  public List<ProductDto> getProductList();
  public List<ProductImageDto> getProductTotalList();
  public List<ProductImageDto> getProductTotalListByCategory(Map<String, Object> map);
  public List<ProductImageDto> getZzimestProductTotalListByCategory(Map<String, Object> map);
  public List<ProductImageDto> getProductListByQuery(Map<String, Object> map);
  public List<ProductImageDto> getZzimestProductListByQuery(Map<String, Object> map);
  public List<ProductImageDto> getProductHitTop10List();
  public List<CpDto> getHasCouponList(int num);
  public List<CpDto> getDontHaveCouponList(int num);
  public int addMemberCoupon(CpIssueDto cpIssue);
  public List<ProductImageDto> getZzimProductList(int num);
  public List<CpDto> getUnusedCouponList(int num);
  public int deleteEndCoupon();
  public List<BoardAskDto> getQnaList();
  public BoardAskDto getQnaDetail(int askNum);
  public int addBoardAsk(Map<String, Object> map);
}
