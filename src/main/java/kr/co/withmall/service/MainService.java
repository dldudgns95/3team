package kr.co.withmall.service;

import java.util.List;

import kr.co.withmall.dto.ProductDto;
import kr.co.withmall.dto.ProductImageDto;

public interface MainService {
  public List<ProductDto> getProductList();
  public List<ProductImageDto> getProductTotalList();
}
