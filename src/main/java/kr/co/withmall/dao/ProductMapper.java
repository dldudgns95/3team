package kr.co.withmall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.withmall.dto.CpDto;
import kr.co.withmall.dto.ProductDto;
import kr.co.withmall.dto.ProductImageDto;

@Mapper
public interface ProductMapper {
  public ProductDto getProduct(int prdtNum);
  public ProductImageDto getProductImage(int prdtNum);
  public int updateHit(int prdtNum);
  public List<CpDto> getCouponList(int num);
}
