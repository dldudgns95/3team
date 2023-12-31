package kr.co.withmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.withmall.dao.CartMapper;
import kr.co.withmall.dao.ProductMapper;
import kr.co.withmall.dto.CartDto;
import kr.co.withmall.dto.CpDto;
import kr.co.withmall.dto.MemberDto;
import kr.co.withmall.dto.ProductImageDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;

@Service
@RequiredArgsConstructor
@Transactional
public class CartServiceImpl implements CartService {

  @Autowired
  private CartMapper cartMapper;
  private ProductMapper productMapper;
  private CartDto cartDto;
  private MemberDto memberDto;
  
  @Override
  public int addCart(CartDto cartDto) throws Exception {
    try {
      // 세션에서 회원 정보 가져오기
//      HttpSession session=request.getSession();
//      memberDto=(MemberDto)session.getAttribute("member"); // 세션 통해 "member"라는 이름의 속성을 가져와서 MemberDto 타입으로 캐스팅 후 memberDto 변수에 저장
//      // productDto=(ProductDto)session.getAttribute(""); //수정 (productDto 세션 나오면 productDto 세션으로 수정)
//      int num = memberDto.getNum();  // memberDto에서 getNum() 메서드를 호출하여 회원의 아이디(num)를 얻어와서 num 변수에 저장
//      int prdtNum = memberDto.getNum(); //수정 (productDto 세션 나오면 getPrdtNum으로 수정)
//      // 장바구니에 추가할 상품 정보 설정
//      cartDto.setNum(num);
//      cartDto.setPrdtNum(prdtNum); 
      
      //카트에 이미 등록된 제품인지 판별
      System.out.println(cartDto);
      int isExisted=cartMapper.getPrdtCount(cartDto);
      if(isExisted != 0){
        System.out.println("실패");
        return 2; // 중복 시 반환값 2
      } else {
        System.out.println("성공");
        return cartMapper.insertCart(cartDto); // 중복 아닐시 반환값 1 & DB 저장 
      }
    }catch (Exception e) {
      e.printStackTrace();
      System.out.println("에러");
      return 0; // 에러 발생 시 반환값 0
    }
  }
  
  @Override
  public void deleteCart(int cartNum) throws Exception {
    cartMapper.deleteCart(cartNum);    
  }
  
  @Override
  public List<CartDto> getCartList(int num) throws Exception {
    List<CartDto> cart = cartMapper.getCart(num);
    return cart;
  }
  
  @Override
  public int modifyCount(CartDto cartDto) throws Exception {
    // TODO Auto-generated method stub
    return cartMapper.modifyCount(cartDto);
  }
  
  @Override
  public ProductImageDto getProductImage(int prdtNum) {
    ProductImageDto productImageDto = cartMapper.getProductImage(prdtNum);
    return productImageDto;
  }
  
  @Override
  public List<CartDto> getCartCp(int num) { 
    System.out.println("여기" + cartMapper.getCp(num));  
    
    int totalPrice;
    
    List<CartDto> cartCp = cartMapper.getCp(num);
    
    for (CartDto cartDto : cartCp) {
      int cpMin = cartDto.getCpMin();
      
      if (1>cpMin) {
        
      }
  }
    
    return cartCp;
  }
  

  
}
