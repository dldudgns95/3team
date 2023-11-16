package kr.co.withmall.service;

import java.io.File;
import java.nio.file.Path;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.withmall.dao.AdminMapper;
import kr.co.withmall.dto.CpDto;
import kr.co.withmall.dto.MemberDto;
import kr.co.withmall.dto.OrderDto;
import kr.co.withmall.dto.ProductCategoryDto;
import kr.co.withmall.dto.ProductDto;
import kr.co.withmall.dto.ProductImageDto;
import kr.co.withmall.util.MyFileUtils;
import kr.co.withmall.util.MyPageUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Transactional
@RequiredArgsConstructor
@Service
public class AdminServiceImpl implements AdminService {
  
  private final AdminMapper adminMapper;
  private final MyFileUtils myFileUtils;
  private final MyPageUtils myPageUtils;
  
  // 이미지 저장
  @Override
  public Map<String, Object> imageUpload(MultipartHttpServletRequest multipartRequest) {

    // 이미지가 저장될 경로
    String imagePath = myFileUtils.getPrdtImagePath();
    File dir = new File(imagePath);
    if(!dir.exists()) {
      dir.mkdirs();
    }
    
    // 이미지 파일 (CKEditor는 이미지를 upload라는 이름으로 보냄)
    MultipartFile upload = multipartRequest.getFile("upload");
    
    // 이미지가 저장될 이름
    String originalFilename = upload.getOriginalFilename();
    String filesystemName = myFileUtils.getFilesystemName(originalFilename);
    
    // 이미지 File 객체
    File file = new File(dir, filesystemName);
    
    // 저장
    try {
      upload.transferTo(file);
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    // CKEditor로 저장된 이미지의 경로를 JSON 형식으로 반환해야 함
    return Map.of("uploaded", true
                , "url", multipartRequest.getContextPath() + imagePath + "/" + filesystemName);
    
  }
  
  // 제품 삽입
  @Override
  public int addPrdt(HttpServletRequest request) {

    int categoryNum = Integer.parseInt(request.getParameter("categoryNum"));
   // int prdtNum = Integer.parseInt(request.getParameter("prdtNum"));
    String prdtName = request.getParameter("prdtName");
    String prdtTitle = request.getParameter("prdtTitle");
    int prdtRealPrice = Integer.parseInt(request.getParameter("prdtRealPrice"));
    int prdtStock = Integer.parseInt(request.getParameter("prdtStock"));
    String prdtInfo = request.getParameter("prdtInfo");
    
    ProductDto prdt = ProductDto.builder()
                      //   .prdtNum(prdtNum)
                         .prdtName(prdtName)
                         .prdtTitle(prdtTitle)
                         .prdtRealPrice(prdtRealPrice)
                         .prdtStock(prdtStock)
                         .prdtInfo(prdtInfo)
                         .categoryDto(ProductCategoryDto.builder()
                                            .categoryNum(categoryNum)
                                            .build())
                         .build();
    int addResult = adminMapper.insertProduct(prdt);
    
    for(String editorImage : getPrdtImageList(prdtInfo)) {
     ProductImageDto prdtImage = ProductImageDto.builder()
                                       // prdtNum 시퀀스..
                                       .imagePath(myFileUtils.getPrdtImagePath())
                                       .filesystemName(editorImage)
                                       .build();
         adminMapper.insertPrdtImage(prdtImage);
    }
    
    return addResult;
                   
                         
  }
  
  // 잘못저장된 이미지 지우기
  @Transactional(readOnly=true)
  @Override
  public void prdtImageBatch() {
    // 1. 어제 작성된 블로그의 이미지 목록 (DB)
    List<ProductImageDto> prdtImageList = adminMapper.getPrdtImageInYesterday();
    
    // 2. List<BlogImageDto> -> List<Path> (Path는 경로+파일명으로 구성)
    List<Path> prdtImagePathList = prdtImageList.stream()
                                                .map(prdtImageDto -> new File(prdtImageDto.getImagePath(), prdtImageDto.getFilesystemName()).toPath())
                                                .collect(Collectors.toList());
    
    // 3. 어제 저장된 블로그 이미지 목록 (디렉토리)
    File dir = new File(myFileUtils.getPrdtImagePathInYesterday());
    
    // 4. 삭제할 File 객체들
    File[] targets = dir.listFiles(file -> !prdtImagePathList.contains(file.toPath()));

    // 5. 삭제
    if(targets != null && targets.length != 0) {
      for(File target : targets) {
        target.delete();
      }
    }
  }  
  
  // 이미지 목록 반환
  @Override
  public List<String> getPrdtImageList(String prdtInfo) {
    
    List<String> editorImageList = new ArrayList<>();

    Document document = Jsoup.parse(prdtInfo);
    Elements elements =  document.getElementsByTag("img");
    
    if(elements != null) {
      for(Element element : elements) {
        String src = element.attr("src");
        String filesystemName = src.substring(src.lastIndexOf("/") + 1);
        editorImageList.add(filesystemName);
      }
    }
    
    return editorImageList;
    
  }
  
  
  
  // 제품 목록
  @Override
  public void loadPrdtList(HttpServletRequest request, Model model) {
    
    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));    
    int page = Integer.parseInt(opt.orElse("1"));
    int total = adminMapper.getPrdtCount();
    int display = 5;
    
    myPageUtils.setPaging(page, total, display);
    
    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
                                   , "end", myPageUtils.getEnd());
    
    List<ProductDto> prdtList = adminMapper.getPrdtList(map);
    
    
    model.addAttribute("prdtList", prdtList);
    model.addAttribute("paging", myPageUtils.getMvcPaging(request.getContextPath()+ "/admin/prdtList.do"));
    model.addAttribute("beginNo", total - (page - 1) * display);
    
  

    
  }
  
  // 제품 수정
  @Override
  public int modifyPrdt(HttpServletRequest request) {
    
    int prdtNum = Integer.parseInt(request.getParameter("prdtNum"));
    String prdtName = request.getParameter("prdtName");
    String prdtTitle = request.getParameter("prdtTitle");
    int prdtRealPrice = Integer.parseInt(request.getParameter("prdtRealPrice"));
    String prdtInfo = request.getParameter("prdtInfo");
    
    ProductDto prdt = ProductDto.builder()
                           .prdtNum(prdtNum)
                           .prdtName(prdtName)
                           .prdtTitle(prdtTitle)
                           .prdtRealPrice(prdtRealPrice)
                           .prdtInfo(prdtInfo)
                           .build();
    
    int modifyResult = adminMapper.updatePrdt(prdt);
    
    return modifyResult;
  }
  
  // 제품 정보....
  @Override
  public ProductDto getPrdt(int prdtNum) {
    return adminMapper.getPrdt(prdtNum);
  }
  
  @Override
  public int deletePrdt(int prdtNum) {
    return adminMapper.deletePrdt(prdtNum);
  }
  
//  // 제품 삭제
//  @Override
//  public int deletePrdt(int prdtNum) {
//   
//    List<ProductImageDto> prdtImageList = adminMapper.getPrdtImageList(prdtNum);
//    for(ProductImageDto prdtImage : prdtImageList) {
//      File file = new File(prdtImage.getImagePath(), prdtImage.getFilesystemName());
//      if(file.exists()) {
//        file.delete();
//      }
//    }
//    
//    adminMapper.deletePrdtImageList(prdtNum);
//    
//    return adminMapper.deletePrdt(prdtNum);
//  }

  
  // 제품 검색
  @Override
  public void loadSearchPrdtList(HttpServletRequest request, Model model) {
    
    String column = request.getParameter("column");
    String searchText = request.getParameter("searchText");
    
    Map<String, Object> map = new HashMap<>();
    map.put("column", column);
    map.put("searchText", searchText);
    
    int total = adminMapper.getSearchPrdtCount(map);
    
    
    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    String strPage =  opt.orElse("1");
    int page = Integer.parseInt(strPage);
    
    int display = 5;
    
    myPageUtils.setPaging(page, total, display);

    map.put("begin", myPageUtils.getBegin());
    map.put("end", myPageUtils.getEnd());
    
    List<ProductDto> prdtList = adminMapper.getSearchPrdtList(map);
    
    model.addAttribute("prdtList", prdtList);
    model.addAttribute("paging", myPageUtils.getMvcPaging(request.getContextPath()+ "/amdin/searchPrdt.do", "column=" + column + "&searchText=" + searchText));
    model.addAttribute("beginNo", total - (page - 1) * display);
    
  }
  
  // 회원 목록---------------------------------------------------------------
  @Transactional(readOnly = true)
  @Override
  public void loadMemList(HttpServletRequest request, Model model) {

    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    int page = Integer.parseInt(opt.orElse("1"));
    
    int display = 3;
    
    int total = adminMapper.getMemCount();
    
    myPageUtils.setPaging(page, total, display);
    
    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
                                   , "end", myPageUtils.getEnd());
    
    List<MemberDto> memList = adminMapper.getMemList(map);
    
    model.addAttribute("memList", memList);
    model.addAttribute("paging", myPageUtils.getMvcPaging(request.getContextPath()+ "/admin/userList.do"));
    model.addAttribute("beginNo", total - (page - 1) * display);
    
  }
  // 회원 검색
  @Override
    public void loadSearchList(HttpServletRequest request, Model model) {
      
    String column = request.getParameter("column");
    String searchText = request.getParameter("searchText");
    
    Map<String, Object> map = new HashMap<>();
    map.put("column", column);
    map.put("searchText", searchText);
    
    int total = adminMapper.getSearchCount(map);
    
    
    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    String strPage =  opt.orElse("1");
    int page = Integer.parseInt(strPage);
    
    int display = 3;
    
    myPageUtils.setPaging(page, total, display);

    map.put("begin", myPageUtils.getBegin());
    map.put("end", myPageUtils.getEnd());
    
    List<MemberDto> memList = adminMapper.getSearchList(map);
    
    model.addAttribute("memList", memList);
    model.addAttribute("paging", myPageUtils.getMvcPaging(request.getContextPath()+ "/amdin/search.do", "column=" + column + "&searchText=" + searchText));
    model.addAttribute("beginNo", total - (page - 1) * display);
    
    }
  
  
  // 회원 삭제
  @Override
  public int deleteUser(int num) {
    return adminMapper.deleteUser(num);
  }
  
  // 쿠폰 삽입 쿠폰 이름, 쿠폰정보, 쿠폰가격, 최소주문가격, 시작일, 종료일 

  @Override
  public int insertCp(HttpServletRequest request) {
    
    
    String cpName = request.getParameter("cpName");
    String cpInfo = request.getParameter("cpInfo");
    int cpPrice = Integer.parseInt(request.getParameter("cpPrice"));
    int cpMin = Integer.parseInt(request.getParameter("cpMin"));
    String startAt = request.getParameter("startAt");
    String endAt = request.getParameter("endAt");
    
    CpDto cp = CpDto.builder()
                  .cpName(cpName)
                  .cpInfo(cpInfo)
                  .cpPrice(cpPrice)
                  .cpMin(cpMin)
                  .startAt(Date.valueOf(startAt))
                  .endAt(Date.valueOf(endAt))
                  .build();
    
    int addCpResult = adminMapper.insertCp(cp);
    
    return addCpResult;
    
  }
  
  
  // 쿠폰 수정
  @Override
  public int modifyCp(HttpServletRequest request) {
   
    int cpNum = Integer.parseInt(request.getParameter("cpNum"));
    String cpName = request.getParameter("cpName");
    String cpInfo = request.getParameter("cpInfo");
    int cpPrice = Integer.parseInt(request.getParameter("cpPrice"));
    int cpMin = Integer.parseInt(request.getParameter("cpMin"));
    String startAt = request.getParameter("startAt");
    String endAt = request.getParameter("endAt");
    
    CpDto cp = CpDto.builder()
                  .cpNum(cpNum)
                  .cpName(cpName)
                  .cpInfo(cpInfo)
                  .cpPrice(cpPrice)
                  .cpMin(cpMin)
                  .startAt(Date.valueOf(startAt))
                  .endAt(Date.valueOf(endAt))
                  .build();
    
    int modifyCpResult = adminMapper.modifyCp(cp);
    
    return modifyCpResult;
    
    
  }
  
  
  // 쿠폰 목록
  @Transactional(readOnly = true)
  @Override
    public void loadCpList(HttpServletRequest request, Model model) {
      Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
      int page = Integer.parseInt(opt.orElse("1"));
      
      int display = 5;
      
      int total = adminMapper.getCpCount();
      
      myPageUtils.setPaging(page, total, display);
      
      Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
                                      , "end", myPageUtils.getEnd());
      
      List<CpDto> cpList = adminMapper.getCpList(map);

      model.addAttribute("cpList", cpList);
      model.addAttribute("paging", myPageUtils.getMvcPaging(request.getContextPath() + "/admin/cpList.do"));
      model.addAttribute("beginNo", total - (page - 1) * display);


      
  }

  // 쿠폰 정보
  @Transactional(readOnly=true)
  @Override
  public CpDto getCp(int cpNum) {
    return adminMapper.getCp(cpNum);
  }
  

    // 쿠폰 삭제
  @Override
    public int deleteCp(int cpNum) {
     return adminMapper.deleteCp(cpNum);
    }
  
  // 주문 목록
  @Transactional(readOnly = true)
  @Override
    public void loadOrderList(HttpServletRequest request, Model model) {
      Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
      int page = Integer.parseInt(opt.orElse("1"));
      
      int display = 5;
      
      int total = adminMapper.getOrderCount();
      
      myPageUtils.setPaging(page, total, display);
      
      Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
                                      , "end", myPageUtils.getEnd());
      
      List<OrderDto> orderList = adminMapper.getOderList(map);

      model.addAttribute("orderList", orderList);
      model.addAttribute("paging", myPageUtils.getMvcPaging(request.getContextPath() + "/admin/orderList.do"));
      model.addAttribute("beginNo", total - (page - 1) * display);


      
  }

}