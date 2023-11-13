package kr.co.withmall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.withmall.dto.ProductDto;
import kr.co.withmall.dto.ProductImageDto;

@Mapper
public interface MainMapper {
  public List<ProductDto> getProductList();
  public List<ProductImageDto> getProductTotalList();
}
