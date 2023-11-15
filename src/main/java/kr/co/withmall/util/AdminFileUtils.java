package kr.co.withmall.util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import org.springframework.stereotype.Component;

@Component  // MyFileUtil 객체로 만들어  불러다 쓰기 @autowired
public class AdminFileUtils {
    
  // 블로그 작성 시 사용된 이미지가 저장될 경로 반환하기
  public String getBlogImagePath() {   
    LocalDate today = LocalDate.now();  // 오늘
    return "/blog/" + DateTimeFormatter.ofPattern("yyyy/MM/dd").format(today);
  }
  
  //  블로그 이미지가 저장된 어제 경로를 반환
  public String getBlogImagePathInYesterday() {
    LocalDate date = LocalDate.now();
    date = date.minusDays(1); // 1일 전
    return "/blog/" + DateTimeFormatter.ofPattern("yyyy/MM/dd").format(date);

  }
  
  // 업로드 게시판 작성시 첨부한 파일이 저장될 경로 반환하기
  public String getUploadPath() {   
    LocalDate today = LocalDate.now();  // 오늘
    return "/upload/" + DateTimeFormatter.ofPattern("yyyy/MM/dd").format(today);
  }
  
  // 임시 파일이 저장될 경로 반환하기 (zip파일)
  public String getTempPath() {
    return "/temp";
  }
  
  // 파일이 저장될 이름 반환하기 
  public String getFilesystemName(String originalFilename) {
    
   
    /* UUID.확장자 (랜덤값) */
    
    String extName = null;
    if(originalFilename.endsWith("tar.gz")) {  // 확장자의 마침표가 포함되는 예외 경우를 처리한다. gz는 리눅스 압축파일 확장자 - 구글링 하면 더나옴 else if 로 연결
      extName = "tar.gz";
    } else {                                      // [.] 또는 \. (자바에서는 \\. ) 마침표 하나 덜렁 쓰면 안됨
      String[] arr = originalFilename.split("\\.");   // regex 정규식 마침표는 모든 문자라는 메타문자 성격, 우리는 진짜 마침표라고 지정해줘야함
      extName = arr[arr.length - 1];              // 배열 시작은 0, 마지막은 길이-1
    }

    return UUID.randomUUID().toString().replace("-", "") + "." + extName;
    
  }
  
  // 임시 파일 이름 반환하기 (확장자는 제외하고 이름만 반환) - 타임스탬프 사용하여 
  public String getTempFilename() {
    return System.currentTimeMillis() + "";
  }
  
  
  
  
  
  
}
