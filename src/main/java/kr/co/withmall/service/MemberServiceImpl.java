package kr.co.withmall.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.withmall.dao.MemberMapper;
import kr.co.withmall.dto.MemberDto;
import lombok.RequiredArgsConstructor;

@Transactional
@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
	private final MemberMapper memberMapper;
	
	private final String client_id = "K3HBLQteMesDkdnTQl7_";
	private final String client_secret = "590mYEK6XK";

	@Override
	public void login(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
	}

	@Override
	public String getNaverLoginURL(HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public String getNaverLoginAccessToken(HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@
	Override
	public MemberDto getNaverProfile(String accessToken) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public MemberDto getMember(String email) {
		// TODO Auto-generated method stub
		return null;
	}
}
