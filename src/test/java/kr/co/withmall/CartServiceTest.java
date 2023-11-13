package kr.co.withmall;

import javax.servlet.http.HttpServletRequest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.withmall.dto.CartDto;
import kr.co.withmall.service.CartService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml")
public class CartServiceTest {

  @Autowired
  private CartService cartService;
  
  //addCart 테스트
  // @Test
  public void addCartTest() throws Exception {

//    final HttpServletRequest request = null;
    
    int num = 3;
    int prdtNum = 2;
    
    CartDto cartDto = new CartDto();
    cartDto.setNum(num);
    cartDto.setPrdtNum(prdtNum);

    
    cartService.addCart(cartDto);    
  }
  
   //deleteCart 테스트
   @Test
   public void deleteCartTest() throws Exception{
     int num = 7;
     cartService.deleteCart(num);
   }
   
   //modifyCart 테스트 (아직 안함)
   @Test
   public void modifyCartTest() throws Exception{
     int num = 7;
     cartService.deleteCart(num);
   }
   
}
