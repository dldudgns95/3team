package kr.co.withmall.service;


import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.withmall.dao.SupportMapper;
import kr.co.withmall.dto.SupportDto;
import kr.co.withmall.util.MyFileUtils;
import kr.co.withmall.util.MyPageUtils;
import lombok.RequiredArgsConstructor;

@Transactional
@RequiredArgsConstructor
@Service
public class SupportServiceImpl implements SupportService {

  private final SupportMapper supportMapper;
  private final MyPageUtils myPageUtils;
  private final MyFileUtils myFileUtils;
  
  // 목록보기+ 페이징
	@Transactional(readOnly=true)
	// 여기서 서비스 구현
  	@Override
	public void loadSupportList(HttpServletRequest request, Model model) {
		// 보낼게 많아서 컨트롤러 말고 서비스에서 모델 처리		
  	   Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
  	    int page = Integer.parseInt(opt.orElse("1"));
  	    int total = supportMapper.getSupportCount();
  	    int display = 10;
  	    
  	    myPageUtils.setPaging(page, total, display);
  	    
  	    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
  	                                   , "end", myPageUtils.getEnd());
  	    
  	    List<SupportDto> supportList = supportMapper.getSupportList(map);
  	    
  	    model.addAttribute("supportList", supportList);
  	    model.addAttribute("paging", myPageUtils.getMvcPaging(request.getContextPath() + "/support/list.do"));
  	    model.addAttribute("beginNo", total - (page - 1) * display);
  	    
	}
	
	// 상세보기 
	@Override
	public SupportDto getSupport(int annNum) {
	    return supportMapper.getSupport(annNum);
	}
	
	// 작성 디비로 추가하기
	 public int addSupport(MultipartHttpServletRequest multipartRequest) throws Exception {
		 //디비에 저장한것만   
	    String annTitle = multipartRequest.getParameter("title");
	    String annContent = multipartRequest.getParameter("contents");
	    String annFile = "";
	    
	    MultipartFile multipartFile = multipartRequest.getFile("file");
	    if(multipartFile != null && !multipartFile.isEmpty()) {  //첨부가 잇으면
	        String path = myFileUtils.getSupportImagePath();   //저장할 경로
	        File dir = new File(path);  // 저장할 폴더 없으면 만들기
	        if(!dir.exists()) {
	          dir.mkdirs();
	        }
	        String originalFilename = multipartFile.getOriginalFilename();  // 첨부 파일의 원래 이름
	        String filesystemName = myFileUtils.getFilesystemName(originalFilename);  // 첨부 파일 저장되는 이름
	        File file = new File(dir, filesystemName);
	        multipartFile.transferTo(file);   // 첨부파일이 저장되는 곳
	        annFile = path + "/" + filesystemName;
	    }
	    
	    SupportDto supportDto = SupportDto.builder()  // 쿼리로 보낼 Dto 만들기
	    							.annTitle(annTitle)
	    							.annContent(annContent)
	    							.annFile(annFile)
	    							.build();
	    
	    int addResult = supportMapper.addSupport(supportDto);
	    return addResult;
	    
 	}
	
	
}