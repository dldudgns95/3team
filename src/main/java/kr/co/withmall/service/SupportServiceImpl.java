package kr.co.withmall.service;


import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;



import kr.co.withmall.dao.SupportMapper;
import kr.co.withmall.dto.SupportDto;
import kr.co.withmall.util.MyPageUtils;
import lombok.RequiredArgsConstructor;

@Transactional
@RequiredArgsConstructor
@Service
public class SupportServiceImpl implements SupportService {

  private final SupportMapper supportMapper;
  private final MyPageUtils myPageUtils;
  
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
	/*@Override
	  public SupportDto getSupport(int annNo) {
	    return supportMapper.getSupport(annNum);
	  }
	*/
	
	
	
	
	
	
	
	
	
	  
}