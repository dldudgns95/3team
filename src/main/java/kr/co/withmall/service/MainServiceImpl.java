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
  public List<ProductImageDto> getProductTotalListByCategory(String categoryName) {
    return mainMapper.getProductTotalListByCategory(categoryName);
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
                                   .cp(CpDto.builder().cpNum(cpNum).build())
                                   .member(MemberDto.builder().num(num).build())
                                   .build();
    int addResult = mainMapper.addMemberCoupon(cpIssue);
    return Map.of("addResult", addResult);
  }
  
}
