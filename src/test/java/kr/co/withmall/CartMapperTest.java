package kr.co.withmall;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.withmall.dao.CartMapper;
import kr.co.withmall.dto.CartDto;
import kr.co.withmall.dto.CpDto;
import kr.co.withmall.dto.ProductDto;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml")
public class CartMapperTest {

  @Autowired
  private CartMapper cartMapper;
  
  //insertCart 테스트
  //@Test
  public void insertCartTest() {
    int num = 2;
    int prdtNum = 1;
    
    CartDto cartDto = new CartDto();
    cartDto.setPrdtNum(prdtNum);
    cartDto.setNum(num);
    cartDto.setPrdtQty(1);
    
    cartMapper.insertCart(cartDto);
  } 

  //deleteCart 테스트 
  //@Test
  public void deleteCartTest() {
    int cartNum=1;
    cartMapper.deleteCart(cartNum);    
  }
  
  //getPrdtCount  테스트
  //@Test
  public void getPrdtCountTest() {
    int prdtNum = 3;
    int num = 2;
    CartDto cartDto = new CartDto();
    cartDto.setPrdtNum(prdtNum);
    cartDto.setNum(num);
    
    int result = cartMapper.getPrdtCount(cartDto);
    System.out.println(result);
  }
  
  //getCartList 테스트
  //@Test
  public void getCartListTest() {
    int num = 1;
    CartDto cartDto = new CartDto();
    cartDto.setNum(num);
    
    List<CartDto> list = cartMapper.getCartList(cartDto);
    for(CartDto cart : list) {
      System.out.println(cart);
    }
  }
  
  //getPrdtList 테스트
  //@Test
  public void getPrdtListTest() {

    int num = 1;
    int prdtNum = 1;
    CartDto cartDto = new CartDto();
    cartDto.setNum(num);
    cartDto.setPrdtNum(prdtNum);
    
    List<ProductDto> list = cartMapper.getPrdtList(cartDto);
    for (ProductDto prdt : list) {
      System.out.println(prdt);
    }
  }
  
//getCp 테스트
@Test
public void getCpTest() {
    try {
        int num = 1;
        List<CartDto> list = cartMapper.getCp(num);

        if (list != null && !list.isEmpty()) {
            for (CartDto cartDto : list) {
                System.out.println(cartDto);
            }
        } else {
            System.out.println("No results found for num: " + num);
        }
    } catch (Exception e) {
        e.printStackTrace();
        fail("Exception occurred during getCpTest");
    }
}
  
  

}