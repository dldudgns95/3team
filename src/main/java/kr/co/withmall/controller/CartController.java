package kr.co.withmall.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import kr.co.withmall.dto.CartDto;
import kr.co.withmall.dto.MemberDto;
import kr.co.withmall.service.CartService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RequestMapping(value = "/cart")
@RequiredArgsConstructor
@Controller
@Slf4j
public class CartController {
  private static final Logger logger = LoggerFactory.getLogger(CartController.class);

  @Autowired
  private CartService cartService;
  private CartDto cartDto;
  private MemberDto memberDto;
  
  @GetMapping(value="/list.do")
  public String cartList(HttpSession session, Model model) throws Exception {
//    //세션에서 회원 정보 가져오기
//    MemberDto memberDto = (MemberDto) session.getAttribute("member");
//    
//    // 로그인되지 않은 사용자 로그인 페이지로 리다이렉트
//    if (memberDto == null) {
//      return "redirect:/member/login.form";
//    }
//    // 장바구니 목록 가져오기 위해 장바구니 서비스 호출에 사용될 회원번호(num) 설정
//    int num = memberDto.getNum();
//    cartDto.setNum(num);
//    // 장바구니 목록 가져오기
//    Map<String, List> cartMap = cartService.cartList(cartDto);
//    // 세션에 장바구니 목록 저장 (상품 주문 시 사용하기 위해서)
//    session.setAttribute("cartMap", cartMap);
//    // 모델에 장바구니 목록 추가
//    model.addAttribute("cartMap", cartMap);
//    // 리턴
    return "cart/list";
  }
 
  
  @ResponseBody
  @PostMapping(value="/add.do", produces=MediaType.APPLICATION_JSON_VALUE)
  public String addCart(CartDto cartDto, HttpServletRequest request)  throws Exception{
    HttpSession session = request.getSession();
    //수정 로그인체크 할까말까 
    MemberDto mvo = (MemberDto)session.getAttribute("member");
    if(mvo == null) {
      return "5";
    }
    System.out.println(mvo);
    //수정 이거 왜 String으롭 반환했더라? 안해도 되는거면 바꾸고 result없이 블로그컨트롤러같은것처럼 리턴에 바로적고 싶다 
    
    int result = cartService.addCart(cartDto);
    return result+"";
    }
  
  @PostMapping(value = "/modify.do", produces = "application/json;charset=UTF-8")
  @ResponseBody
  public ResponseEntity<String> modifyCart(@RequestBody CartDto cartDto) throws Exception {
      cartService.modifyCount(cartDto);
      return ResponseEntity.ok("{\"result\": \"Success\"}");
  }
  
  @PostMapping(value="/delete.do")
  public String deleteCart(CartDto cartDto) throws Exception {
    cartService.deleteCart(cartDto.getCartNum());
    return "redirect:/cart/list/num/" + cartDto.getNum();
  }

  @GetMapping(value="/list/num/{num}", produces=MediaType.APPLICATION_JSON_VALUE)
  public String cartInfo(@PathVariable("num") int num, HttpServletRequest request, HttpSession session, Model model) {
    try {
      // 디버깅 정보 로깅
      logger.debug("cartInfo method called with num: {}", num);
      
      // cartService.getCartList(num) 메소드를 호출하여 어떤 결과가 나오는지 확인
      List<CartDto> cartInfo = cartService.getCartList(num);
  
      // 디버깅 정보 로깅
      logger.debug("cartList: {}", cartInfo);
  
      // 세션에 cartInfo 추가
      request.getSession().setAttribute("cartInfo", cartInfo);
      session.setAttribute("cartInfo", cartInfo);
      
      // 모델에 cartInfo 추가
      model.addAttribute("cartInfo", cartInfo);
  
      // JSP 페이지 반환
      return "cart/list";
      } catch (Exception e) {
      e.printStackTrace();
      }
    return null;
  }
  
}
  
  
  

