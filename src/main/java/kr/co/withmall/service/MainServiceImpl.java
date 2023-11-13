package kr.co.withmall.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.withmall.dao.MainMapper;
import kr.co.withmall.dto.ProductDto;
import kr.co.withmall.dto.ProductImageDto;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MainServiceImpl implements MainService {
  
  private final MainMapper mainMapper;
  
  @Override
  public List<ProductDto> getProductList() {
    return mainMapper.getProductList();
  }
  
  @Override
  public List<ProductImageDto> getProductTotalList() {
    return mainMapper.getProductTotalList();
  }
  
}
