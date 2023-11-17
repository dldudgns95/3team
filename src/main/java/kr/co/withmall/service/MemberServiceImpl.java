package kr.co.withmall.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.withmall.dao.MemberMapper;
import kr.co.withmall.dto.MemberDto;
import kr.co.withmall.util.MyJavaMailUtils;
import kr.co.withmall.util.MySecurityUtils;
import lombok.RequiredArgsConstructor;


@Transactional
@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
	
	private final MemberMapper memberMapper;
	private final MySecurityUtils mySecurityUtils;
	private final MyJavaMailUtils myJavaMailUtils;
	
	private final String client_id = "K3HBLQteMesDkdnTQl7_";
	private final String client_secret = "590mYEK6XK";	
	
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
		
	  @Override
	  public void logout(HttpServletRequest request, HttpServletResponse response) {
	  
	    HttpSession session = request.getSession();
		    
		session.invalidate();
		    
		try {
		   response.sendRedirect(request.getContextPath() + "/main.do");
	    } catch (Exception e) {
		   e.printStackTrace();
		}
		    			
		}
	  @Override
	  public String getNaverLoginURL(HttpServletRequest request) throws Exception {
	    
	    // 네이버로그인-1
	    // 네이버 로그인 연동 URL 생성하기를 위해 redirect_uri(URLEncoder), state(SecureRandom) 값의 전달이 필요하다.
	    // redirect_uri : 네이버로그인-2를 처리할 서버 경로를 작성한다.
	    // redirect_uri 값은 네이버 로그인 Callback URL에도 동일하게 등록해야 한다.
	    
	    String apiURL = "https://nid.naver.com/oauth2.0/authorize";
	    String response_type = "code";
	    String redirect_uri = URLEncoder.encode("http://localhost:8080" + request.getContextPath() + "/member/naver/getAccessToken.do", "UTF-8");
	    String state = new BigInteger(130, new SecureRandom()).toString();
	  
	    StringBuilder sb = new StringBuilder();
	    sb.append(apiURL);
	    sb.append("?response_type=").append(response_type);
	    sb.append("&client_id=").append(client_id);
	    sb.append("&redirect_uri=").append(redirect_uri);
	    sb.append("&state=").append(state);
	    
	    return sb.toString();
	    
	  }
	  
	  @Override
	  public String getNaverLoginAccessToken(HttpServletRequest request) throws Exception {
	    
	    // 네이버로그인-2
	    // 접근 토큰 발급 요청
	    // 네이버로그인-2를 수행하기 위해서는 네이버로그인-1의 응답 결과인 code와 state가 필요하다.
	    
	    // 네이버로그인-1의 응답 결과(access_token을 얻기 위해 요청 파라미터로 사용해야 함)
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    
	    String apiURL = "https://nid.naver.com/oauth2.0/token";
	    String grant_type = "authorization_code";  // access_token 발급 받을 때 사용하는 값(갱신이나 삭제시에는 다른 값을 사용함)
	    
	    StringBuilder sb = new StringBuilder();
	    sb.append(apiURL);
	    sb.append("?grant_type=").append(grant_type);
	    sb.append("&client_id=").append(client_id);
	    sb.append("&client_secret=").append(client_secret);
	    sb.append("&code=").append(code);
	    sb.append("&state=").append(state);
	    
	    // 요청
	    URL url = new URL(sb.toString());
	    HttpURLConnection con = (HttpURLConnection)url.openConnection();
	    con.setRequestMethod("GET");  // 반드시 대문자로 작성
	    
	    // 응답
	    BufferedReader reader = null;
	    int responseCode = con.getResponseCode();
	    if(responseCode == 200) {
	      reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
	    } else {
	      reader = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	    }
	    
	    String line = null;
	    StringBuilder responseBody = new StringBuilder();
	    while ((line = reader.readLine()) != null) {
	      responseBody.append(line);
	    }
	    
	    JSONObject obj = new JSONObject(responseBody.toString());
	    return obj.getString("access_token");
	    
	  }
	  
	  @Override
	  public MemberDto getNaverProfile(String accessToken) throws Exception {
	    
	    // 네이버 로그인-3
	    // 접근 토큰을 전달한 뒤 사용자의 프로필 정보(이름, 이메일, 성별, 휴대전화번호) 받아오기
	    // 요청 헤더에 Authorization: Bearer accessToken 정보를 저장하고 요청함
	    
	    // 요청
	    String apiURL = "https://openapi.naver.com/v1/nid/me";
	    URL url = new URL(apiURL);
	    HttpURLConnection con = (HttpURLConnection)url.openConnection();
	    con.setRequestMethod("GET");
	    con.setRequestProperty("Authorization", "Bearer " + accessToken);
	    
	    // 응답
	    BufferedReader reader = null;
	    int responseCode = con.getResponseCode();
	    if(responseCode == 200) {
	      reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
	    } else {
	      reader = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	    }
	    
	    String line = null;
	    StringBuilder responseBody = new StringBuilder();
	    while ((line = reader.readLine()) != null) {
	      responseBody.append(line);
	    }
	    
	    JSONObject obj = new JSONObject(responseBody.toString());
	    JSONObject response = obj.getJSONObject("response");
	    MemberDto member = MemberDto.builder()
	                    .email(response.getString("email"))
	                    .name(response.getString("name"))
	                    .gender(response.getString("gender"))
	                    .mobile(response.getString("mobile"))
	                    .build();
	    
	    return member;
	    
	  }
	  
	  
	  @Override
	  public void naverJoin(HttpServletRequest request, HttpServletResponse response) {
	    
	    String email = request.getParameter("email");
	    String name = request.getParameter("name");
	    String gender = request.getParameter("gender");
	    String mobile = request.getParameter("mobile");
	    String event = request.getParameter("event");
	    
	    MemberDto member = MemberDto.builder()
	                    .email(email)
	                    .name(name)
	                    .gender(gender)
	                    .mobile(mobile.replace("-", ""))
	                    .agree(event != null ? 1 : 0)
	                    .build();
	    
	    int naverJoinResult = memberMapper.insertNaverMember(member);
	    
	    try {
	      
	      response.setContentType("text/html; charset=UTF-8");
	      PrintWriter out = response.getWriter();
	      out.println("<script>");
	      if(naverJoinResult == 1) {
	        request.getSession().setAttribute("member", memberMapper.getMember(Map.of("email", email)));
	        out.println("alert('네이버 간편가입이 완료되었습니다.')");
	      } else {
	        out.println("alert('네이버 간편가입이 실패했습니다.')");
	      }
	      out.println("location.href='" + request.getContextPath() + "/main.do'");
	      out.println("</script>");
	      out.flush();
	      out.close();
	      
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    
	  }

	  @Override
	  public void naverLogin(HttpServletRequest request, HttpServletResponse response, MemberDto naverProfile) throws Exception {
	    
	    String email = naverProfile.getEmail();
	    MemberDto member = memberMapper.getMember(Map.of("email", email));
	    
	    if(member != null) {
	      request.getSession().setAttribute("member", member);
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
   	  public void join(HttpServletRequest request, HttpServletResponse response) {
		  
		    String name = mySecurityUtils.preventXSS(request.getParameter("name"));
		    String pw = mySecurityUtils.getSHA256(request.getParameter("pw"));
		    String mobile = request.getParameter("mobile");
		    String email = request.getParameter("email");
		    String postcode = request.getParameter("postcode");
		    String roadaddress = request.getParameter("roadaddress");
		    String jibunaddress = request.getParameter("jibunaddress");
		    String detailaddress = mySecurityUtils.preventXSS(request.getParameter("detailaddress"));	    
		    String gender = request.getParameter("gender");
		    String event = request.getParameter("event");
		   
		    MemberDto member = MemberDto.builder()
		    				.name(name)
		                    .pw(pw)
		                    .mobile(mobile)
		                    .email(email)
		                    .postcode(postcode)
		                    .roadaddress(roadaddress)
		                    .jibunaddress(jibunaddress)
		                    .detailaddress(detailaddress)
		                    .gender(gender)
		                    .agree(event.equals("on") ? 1 : 0)
		                    .build();
		    
		    int joinResult = memberMapper.insertMember(member);
		    
		    try {
		      
		      response.setContentType("text/html; charset=UTF-8");
		      PrintWriter out = response.getWriter();
		      out.println("<script>");
		      if(joinResult == 1) {
		        request.getSession().setAttribute("member", memberMapper.getMember(Map.of("email", email)));
		        out.println("alert('회원 가입되었습니다.')");
		        out.println("location.href='" + request.getContextPath() + "/main.do'");
		      } else {
		        out.println("alert('회원 가입이 실패했습니다.')");
		        out.println("history.go(-2)");
		      }
		      out.println("</script>");
		      out.flush();
		      out.close();
		      
		    } catch (Exception e) {
		      e.printStackTrace();
		    }
	}
	  
	  @Transactional(readOnly=true)
	  @Override
	  public ResponseEntity<Map<String, Object>> checkEmail(String email) {
	    
	    Map<String, Object> map = Map.of("email", email);
	    
	    boolean enableEmail = memberMapper.getMember(map) == null
	                       && memberMapper.getLeaveMember(map) == null
	                       && memberMapper.getInactiveMember(map) == null;
	    
	    return new ResponseEntity<>(Map.of("enableEmail", enableEmail), HttpStatus.OK);
	    
	  }
	  
	  @Override
	  public ResponseEntity<Map<String, Object>> sendCode(String email) {
	    
	    // RandomString 생성(6자리, 문자 사용, 숫자 사용)
	    String code = mySecurityUtils.getRandomString(6, true, true);
	    
	    // 메일 전송
	    myJavaMailUtils.sendJavaMail(email
	                               , "withmall 인증 코드"
	                               , "<div>인증코드는 <strong>" + code + "</strong>입니다.</div>");
	    
	    return new ResponseEntity<>(Map.of("code", code), HttpStatus.OK);
	    
	  }
	  @Override
	  	public void memberout(HttpServletRequest request, HttpServletResponse response) {

		    Optional<String> opt = Optional.ofNullable(request.getParameter("num"));
		    int num = Integer.parseInt(opt.orElse("0"));
		  
		    System.out.println(num);
		    
		    MemberDto member = memberMapper.getMember(Map.of("num", num));
		    
		    if(member == null) {
		      try {
		        response.setContentType("text/html; charset=UTF-8");
		        PrintWriter out = response.getWriter();
		        out.println("<script>");
		        out.println("alert('회원 탈퇴를 수행할 수 없습니다.')");
		        out.println("location.href='" + request.getContextPath() + "/main.do'");
		        out.println("</script>");
		        out.flush();
		        out.close();
		      } catch (Exception e) {
		        e.printStackTrace();
		      }
		    }
		    
		    int insertLeaveMemberResult = memberMapper.insertLeaveMember(member);
		    int deleteMemberResult = memberMapper.deleteMember(member);
		    
		   try {
		      
		      response.setContentType("text/html; charset=UTF-8");
		      PrintWriter out = response.getWriter();
		      out.println("<script>");
		      if(insertLeaveMemberResult == 1 && deleteMemberResult == 1) {
		        HttpSession session = request.getSession();
		        session.invalidate();
		        out.println("alert('회원 탈퇴되었습니다. 그 동안 이용해 주셔서 감사합니다.')");
		        out.println("location.href='" + request.getContextPath() + "/main.do'");
		      } else {
		        out.println("alert('회원 탈퇴되지 않았습니다.')");
		        out.println("history.back()");
		      }
		      out.println("</script>");
		      out.flush();
		      out.close();
		      
		    } catch (Exception e) {
		      e.printStackTrace();
		    }
		    
		  }
	  
	  @Override
	  	public ResponseEntity<Map<String, Object>> modify(HttpServletRequest request) {
		  
		    // 요청 파라미터에서 사용자 정보 추출
		    String name = mySecurityUtils.preventXSS(request.getParameter("name"));
		    String gender = request.getParameter("gender");
		    String mobile = request.getParameter("mobile");
		    String postcode = request.getParameter("postcode");
		    String roadaddress = request.getParameter("roadaddress");
		    String jibunaddress = request.getParameter("jibunaddress");
		    String detailaddress = mySecurityUtils.preventXSS(request.getParameter("detailaddress"));
		    String event = request.getParameter("event");
		    int agree = event.equals("on") ? 1 : 0; //이벤트 동의 여부가 on이면 1 아니면 0
		    int num = Integer.parseInt(request.getParameter("num"));
		    
		    MemberDto member = MemberDto.builder()
		        .name(name)
		        .gender(gender)
		        .mobile(mobile)
		        .postcode(postcode)
		        .roadaddress(roadaddress)
		        .jibunaddress(jibunaddress)
		        .detailaddress(detailaddress)
		        .agree(agree)
		        .num(num)
		        .build();
		    
		    //userMapper의 updateUser 사용, 위에 생성한 UserDto로 update 하고 그 결과를 modifyResult에 저장
		    int modifyResult = memberMapper.updateMember(member);
		    
		    //modifyResult가 1이면 정보를 업데이트함
		    if(modifyResult == 1) {
		      HttpSession session = request.getSession();
		      MemberDto sessionMember = (MemberDto)session.getAttribute("member");
		      sessionMember.setName(name);
		      sessionMember.setGender(gender);
		      sessionMember.setMobile(mobile);
		      sessionMember.setPostcode(postcode);
		      sessionMember.setRoadaddress(roadaddress);
		      sessionMember.setJibunaddress(jibunaddress);
		      sessionMember.setDetailaddress(detailaddress);
		      sessionMember.setAgree(agree);
		    }
		    //modifyResult"와 해당 값을 HttpStatus.OK 상태 코드와 함께 응답합니다. 클라이언트는 이 응답을 받고 "modifyResult" 키를 통해 결과를 확인할 수 있습니다.
		    return new ResponseEntity<>(Map.of("modifyResult", modifyResult), HttpStatus.OK);
		    
	}
		  @Override
		public void modifyPw(HttpServletRequest request, HttpServletResponse response) {
			  String pw = mySecurityUtils.getSHA256(request.getParameter("pw"));
			    int num = Integer.parseInt(request.getParameter("num"));
			    
			    MemberDto  member = MemberDto.builder()
			                    .pw(pw)
			                    .num(num)
			                    .build();
			    
			    int modifyPwResult = memberMapper.updateMemberPw(member);
			    
			    try {
			      
			      response.setContentType("text/html; charset=UTF-8");
			      PrintWriter out = response.getWriter();
			      out.println("<script>");
			      if(modifyPwResult == 1) {
			        HttpSession session = request.getSession();
			        MemberDto sessionUser = (MemberDto)session.getAttribute("member");
			        sessionUser.setPw(pw);
			        out.println("alert('비밀번호가 수정되었습니다.')");
			        out.println("location.href='" + request.getContextPath() + "/main.do'");
			      } else {
			        out.println("alert('비밀번호가 수정되지 않았습니다.')");
			        out.println("history.back()");
			      }
			      out.println("</script>");
			      out.flush();
			      out.close();
			      
			    } catch (Exception e) {
			      e.printStackTrace();
			    }
			    
		}
		
		@Transactional(readOnly=true)
		@Override
		public ResponseEntity<Map<String, Object>> checkPwEmail(String email) {
		    
		  Map<String, Object> map = Map.of("email", email);
		    
		  boolean pwEmail = memberMapper.getMember(map) != null;
		  System.out.println(pwEmail);
		  return new ResponseEntity<>(Map.of("pwEmail", pwEmail), HttpStatus.OK);
		    
		}		  

		@Override
		public void sendPw(String email){	 
			  	String newpw = mySecurityUtils.getRandomString(10, true, true);

			    // 메일 전송
			    myJavaMailUtils.sendJavaMail(email
			                               , "withmall 임시비밀번호"
			                               , "<div>withmall 임시비밀번호는 <strong>" + newpw + "</strong>입니다.</div>");  
			    newpw = mySecurityUtils.getSHA256(newpw);
			    memberMapper.updatepw(Map.of("email", email,"pw", newpw));

		}

	}
	  
