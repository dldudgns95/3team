package kr.co.withmall.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.co.withmall.dto.ProductDto;
import kr.co.withmall.dto.ProductImageDto;

public interface MainService {
  public List<ProductDto> getProductList();
  public List<ProductImageDto> getProductTotalList();
  public List<ProductImageDto> getProductTotalListByCategory(String categoryName);
  public List<ProductImageDto> getProductHitTop10List();
  public Map<String, Object> getCouponList(int num);
  public Map<String, Object> addMemberCoupon(HttpServletRequest request);
}
