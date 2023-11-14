package kr.co.withmall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ejb.access.LocalStatelessSessionProxyFactoryBean;

import kr.co.withmall.dto.CpDto;
import kr.co.withmall.dto.CpIssueDto;
import kr.co.withmall.dto.ProductDto;
import kr.co.withmall.dto.ProductImageDto;
import kr.co.withmall.dto.ZzimDto;

@Mapper
public interface MainMapper {
  public List<ProductDto> getProductList();
  public List<ProductImageDto> getProductTotalList();
  public List<ProductImageDto> getProductTotalListByCategory(String categoryName);
  public List<ProductImageDto> getProductHitTop10List();
  public List<CpDto> getHasCouponList(int num);
  public List<CpDto> getDontHaveCouponList(int num);
  public int addMemberCoupon(CpIssueDto cpIssue);
  public List<ZzimDto> getZzimProductList(int num);
}
