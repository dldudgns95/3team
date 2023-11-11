package kr.co.withmall.service;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.withmall.dao.AdminMapper;
import kr.co.withmall.dto.PrdtImageDto;
import kr.co.withmall.dto.ProductDto;
import kr.co.withmall.util.MyFileUtils;
import kr.co.withmall.util.MyPageUtils;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AdminServiceImpl implements AdminService {
  
  private final AdminMapper adminMapper;
  private final MyFileUtils myFileUtils;
  private final MyPageUtils myPageUtils;
  
  @Override
  public Map<String, Object> imageUpload(MultipartHttpServletRequest multipartRequest) {

    // 이미지가 저장될 경로
    String imagePath = myFileUtils.getPrdtImagePath();
    File dir = new File(imagePath);
    if(!dir.exists()) {
      dir.mkdirs();
    }
    
    // 이미지 파일
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
    
    // CKEditor로 저장된 이미지의 경로를 JSON 형식으로 변환
   
    
    return Map.of("upload", true
                , "url", multipartRequest.getContextPath() + imagePath + "/" + filesystemName);
  }
 
  
  @Override
  public int addAdmin(HttpServletRequest request) {
    int prdtNum = Integer.parseInt(request.getParameter("prdtNum"));
    String prdtName = request.getParameter("prdtName");
    String prdtTitle = request.getParameter("prdtTitle");
    String prdtInfo = request.getParameter("prdtInfo");
    int prdtRealPrice = Integer.parseInt(request.getParameter("prdtRealPrice"));
    int prdtStock = Integer.parseInt(request.getParameter("prdtStock"));
    int categoryNum = Integer.parseInt(request.getParameter("categoryNum"));
    
    ProductDto prdt = ProductDto.builder()
                             .prdtNum(prdtNum)
                             .prdtName(prdtName)
                             .prdtTitle(prdtTitle)
                             .prdtInfo(prdtInfo)
                             .prdtRealPrice(prdtRealPrice)
                             .prdtStock(prdtStock)
                             .categoryNum(categoryNum)
                              // .categoryDto(ProductCategoryDto.builder()
                               //    .categoryNum(categoryNum)
                                //   .build())
                             .build();
    
    
    int addResult = adminMapper.insertPrdt(prdt);
    
    
    Document document = Jsoup.parse(prdtInfo);
    Elements elements =  document.getElementsByTag("img");
    
    if(elements != null) {
      for(Element element : elements) {
        String src = element.attr("src");
        String filesystemName = src.substring(src.lastIndexOf("/") + 1); 
        PrdtImageDto prtdImage = PrdtImageDto.builder()
                                    .prdtNum(prdt.getPrdtNum())
                                    .imagePath(myFileUtils.getPrdtImagePath())
                                    .filesystemName(filesystemName)
                                    .build();
       adminMapper.insertPrdtImage(prtdImage);
      }
    }
    return addResult;
  

 }

}