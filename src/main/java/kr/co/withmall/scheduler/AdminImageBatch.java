package kr.co.withmall.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.withmall.service.AdminService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
public class AdminImageBatch {

  private final AdminService adminService;
  
  @Scheduled(cron= "0 0 0 * * ?")
 public void excute() {
    adminService.prdtImageBatch();
  }
}
