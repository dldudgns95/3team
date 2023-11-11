package kr.co.withmall.service;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.withmall.dao.MemberMapper;
import kr.co.withmall.dto.MemberDto;
import kr.co.withmall.util.MySecurityUtils;
import lombok.RequiredArgsConstructor;


@Transactional
@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
	
	private final MemberMapper memberMapper;
	private final MySecurityUtils mySecurityUtils;
	
	
	@Override
	  public void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    
	    String email = request.getParameter("email");
	    String pw = mySecurityUtils.getSHA256(request.getParameter("pw"));
	    
	    Map<String, Object> map = Map.of("email", email
	                                   , "pw", pw);

	    HttpSession session = request.getSession();
	    
	    
	    // 휴면 계정인지 확인하기
	    
	    // 정상적인 로그인 처리하기
	    MemberDto member = memberMapper.getMember(map);
	    
	    if(member != null) {
	      request.getSession().setAttribute("member", member);
	      response.sendRedirect(request.getParameter("referer"));
	      
	    } else {
	      response.setContentType("text/html; charset=UTF-8");
	      PrintWriter out = response.getWriter();
	      out.println("<script>");
	      out.println("alert('일치하는 회원 정보가 없습니다.')");
	      out.println("location.href='" + request.getContextPath() + "/main.do'");
	      out.println("</script>");
	      out.flush();
	      out.close();
	    }
	    
	  }

	  @Override
	  public MemberDto getMember(String email) {
			return memberMapper.getMember(Map.of("email", email));
		}
		
		
}
