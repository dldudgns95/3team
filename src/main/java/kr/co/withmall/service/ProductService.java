package kr.co.withmall.service;

import java.util.List;
import java.util.Map;

import kr.co.withmall.dto.CpDto;
import kr.co.withmall.dto.ProductDto;
import kr.co.withmall.dto.ProductImageDto;

public interface ProductService {
  public ProductDto getProduct(int prdtNum);
  public ProductImageDto getProductImage(int prdtNum);
  public int increseHit(int prdtNum);
  public List<CpDto> getCouponList(int num);
}
