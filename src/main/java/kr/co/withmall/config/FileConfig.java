package kr.co.withmall.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@Configuration
public class FileConfig {
  
  // 스프링이 가져다 쓸 수 있게 bean 만들어 둠
  // 인터페이스 기준으로 타입찾기 
    @Bean
    public MultipartResolver multipartResolver() {
      CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
      commonsMultipartResolver.setDefaultEncoding("UTF-8");
      commonsMultipartResolver.setMaxUploadSize(1024 * 1024 * 100);       // 전체 첨부 파일의 크기 최대 100MB   바이트 : 1kb 
      commonsMultipartResolver.setMaxUploadSizePerFile(1024 * 1024 * 10); // 개별 첨부 파일의 최대 크기 10MB
      return commonsMultipartResolver;
    }
}
