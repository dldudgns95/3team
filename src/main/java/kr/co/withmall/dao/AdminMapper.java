package kr.co.withmall.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.co.withmall.dto.PrdtImageDto;
import kr.co.withmall.dto.ProductDto;

@Mapper
public interface AdminMapper {
  
  public int insertPrdt(ProductDto prdt);
  public int insertPrdtImage(PrdtImageDto prdtImage);

}
