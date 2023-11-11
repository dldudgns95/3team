package kr.co.withmall.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface AdminService {

   public int addAdmin(HttpServletRequest request);
   public Map<String, Object> imageUpload(MultipartHttpServletRequest httpServletRequest);
}
