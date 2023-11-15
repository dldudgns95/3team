package kr.co.withmall.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import kr.co.withmall.dao.MainMapper;
import kr.co.withmall.dto.CpDto;
import kr.co.withmall.dto.CpIssueDto;
import kr.co.withmall.dto.MemberDto;
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
  
  @Override
  public List<ProductImageDto> getProductTotalListByCategory(HttpServletRequest request) {
    String orderBy = (request.getParameter("orderBy") == null) ? "new" : request.getParameter("orderBy");
    Map<String, Object> map = Map.of("categoryName", request.getParameter("categoryName"), "orderBy", orderBy);
    return mainMapper.getProductTotalListByCategory(map);
  }
  
  @Override
  public List<ProductImageDto> getProductHitTop10List() {
    return mainMapper.getProductHitTop10List();
  }
  
  @Override
  public Map<String, Object> getCouponList(int num) {
    List<CpDto> hasCouponList = mainMapper.getHasCouponList(num);
    System.out.println(hasCouponList);
    List<CpDto> dontHaveCouponList = mainMapper.getDontHaveCouponList(num);
    return Map.of("hasCouponList", hasCouponList, "dontHaveCouponList", dontHaveCouponList);
  }
  
  @Override
  public Map<String, Object> addMemberCoupon(HttpServletRequest request) {
    int cpNum = Integer.parseInt(request.getParameter("cpNum"));
    int num = Integer.parseInt(request.getParameter("num"));
    CpIssueDto cpIssue = CpIssueDto.builder()
                                   .cpDto(CpDto.builder().cpNum(cpNum).build())
                                   .memberDto(MemberDto.builder().num(num).build())
                                   .build();
    int addResult = mainMapper.addMemberCoupon(cpIssue);
    return Map.of("addResult", addResult);
  }
  
  @Override
  public List<ProductImageDto> getZzimProductList(int num) {
    return mainMapper.getZzimProductList(num);
  }
  
  @Override
  public Map<String, Object> getUnusedCouponList(int num) {
    List<CpDto> productList = mainMapper.getUnusedCouponList(num);
    return Map.of("productList", productList);
  }
  
}
