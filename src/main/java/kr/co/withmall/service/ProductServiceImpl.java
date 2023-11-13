package kr.co.withmall.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.withmall.dao.ProductMapper;
import kr.co.withmall.dto.ProductDto;
import lombok.RequiredArgsConstructor;

@Transactional
@RequiredArgsConstructor
@Service
public class ProductServiceImpl implements ProductService {

  private final ProductMapper productMapper;
  
  @Transactional(readOnly=true)
  @Override
  public ProductDto getProduct(int prdtNum) {    
    return productMapper.getProduct(prdtNum);
  }
}
