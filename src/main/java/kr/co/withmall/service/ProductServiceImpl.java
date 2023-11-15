package kr.co.withmall.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.withmall.dao.MainMapper;
import kr.co.withmall.dao.ProductMapper;
import kr.co.withmall.dto.CpDto;
import kr.co.withmall.dto.ProductDto;
import kr.co.withmall.dto.ProductImageDto;
import kr.co.withmall.dto.ZzimDto;
import lombok.RequiredArgsConstructor;

@Transactional
@RequiredArgsConstructor
@Service
public class ProductServiceImpl implements ProductService {


  private final ProductMapper productMapper;
  private final MainMapper mainMapper;
  
  @Transactional(readOnly=true)
  @Override
  public ProductDto getProduct(int prdtNum) {    
    return productMapper.getProduct(prdtNum);
  }
  
  @Override
  public ProductImageDto getProductImage(int prdtNum) {
    return productMapper.getProductImage(prdtNum);
  }
  
  @Override
  public int increseHit(int prdtNum) {
    return productMapper.updateHit(prdtNum);
  }
  
  @Override
  public List<CpDto> getCouponList(int num) {
    System.out.println("couponlist: " + mainMapper.getUnusedCouponList(num));
    return mainMapper.getUnusedCouponList(num);
  }
  
  @Override
  public int addZzim(Map<String, Object> map) {
    return productMapper.insertZzim(map);
  }

  @Override
  public ZzimDto getZzimPrdt(Map<String, Object> map) {
    return productMapper.getZzimPrdt(map);
  }
}
