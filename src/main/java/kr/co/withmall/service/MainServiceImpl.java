package kr.co.withmall.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.withmall.dao.MainMapper;
import kr.co.withmall.dto.BoardAskDto;
import kr.co.withmall.dto.CpDto;
import kr.co.withmall.dto.CpIssueDto;
import kr.co.withmall.dto.MemberDto;
import kr.co.withmall.dto.ProductDto;
import kr.co.withmall.dto.ProductImageDto;
import kr.co.withmall.util.MyFileUtils;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MainServiceImpl implements MainService {
  
  private final MainMapper mainMapper;
  private final MyFileUtils myFileUtils;
  
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
    List<ProductImageDto> list;
    if(orderBy.equals("zzim")) { // 정렬기준이 찜이면
      list = mainMapper.getZzimestProductTotalListByCategory(map);
    } else { // 찜이 아니면 
      list = mainMapper.getProductTotalListByCategory(map);
    }
    return list;
  }
  
  @Override
  public void getProductListByQuery(HttpServletRequest request, Model model) {
    String column = request.getParameter("column");
    String query = request.getParameter("query");
    String orderBy = (request.getParameter("orderBy") == null) ? "new" : request.getParameter("orderBy");
    Map<String, Object> map = Map.of("column", column, "query", query, "orderBy", orderBy);
    List<ProductImageDto> list;
    if(orderBy.equals("zzim")) { // 정렬기준이 찜이면
      list = mainMapper.getZzimestProductListByQuery(map);
    } else { // 찜이 아니면 
      list = mainMapper.getProductListByQuery(map);
    }
    if(!list.isEmpty()) {
      model.addAttribute("productList", list);
    } else {
      list = mainMapper.getProductHitTop10List();
      model.addAttribute("productTop10List", list);
    }
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
  
  @Override
  public List<BoardAskDto> getQnaList() {
    System.out.println("qnaList: " + mainMapper.getQnaList());
    return mainMapper.getQnaList();
  }
  
  @Override
  public BoardAskDto getQnaDetail(int askNum) {
    return mainMapper.getQnaDetail(askNum);
  }
  
  @Override
  public int addBoardAsk(MultipartHttpServletRequest multipartRequest) throws Exception {
    
    String askTitle = multipartRequest.getParameter("askTitle");
    String askContent = multipartRequest.getParameter("askContent");
    String askFile = null;
    int num = Integer.parseInt(multipartRequest.getParameter("num"));
    
    MultipartFile file = multipartRequest.getFile("askFile");
    if(file != null && !file.isEmpty()) {
      String Path = myFileUtils.getQnaFilePath();
      File dir = new File(Path);
      if(!dir.exists()) {
        dir.mkdirs();
      }
      File uploadFile = new File(dir, file.getOriginalFilename());
      file.transferTo(uploadFile);
      askFile =  Path + "/" + file.getOriginalFilename();
    }
    Map<String, Object> map = Map.of("askTitle", askTitle, "askContent", askContent, "askFile", askFile, "num", num);
    int addResult = mainMapper.addBoardAsk(map);
    return addResult;
  }
  
}
