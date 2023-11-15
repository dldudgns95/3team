package kr.co.withmall.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.withmall.dto.ProductDto;
import kr.co.withmall.dto.ProductImageDto;
import kr.co.withmall.dto.ZzimDto;

@Mapper
public interface ProductMapper {
  public ProductDto getProduct(int prdtNum);
  public ProductImageDto getProductImage(int prdtNum);
  public int updateHit(int prdtNum);
  public int insertZzim(Map<String, Object> map);
  public ZzimDto getZzimPrdt(Map<String, Object> map);
}
