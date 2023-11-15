package kr.co.withmall.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.withmall.dao.MainMapper;
import kr.co.withmall.service.MainService;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
public class RemoveCouponBatch {

  private final MainMapper mainMapper;
  
  @Scheduled(cron = "0 0 0 * * ?")
  public void execute() {
    mainMapper.deleteEndCoupon();
  }
  
}
