package kr.co.withmall.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.withmall.dto.ProductDto;

@Mapper
public interface ProductMapper {
  public ProductDto getProduct(int prdtNum);
}
