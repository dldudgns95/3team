package kr.co.withmall.controller;

import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.withmall.dto.CartDto;
import kr.co.withmall.dto.MemberDto;
import kr.co.withmall.service.CartService;
import lombok.RequiredArgsConstructor;

@RequestMapping(value = "/cart")
@RequiredArgsConstructor
@Controller
public class CartController {
  
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
  public String addCart(CartDto cartDto, HttpServletRequest request, RedirectAttributes redirectAttributes)  throws Exception{
    HttpSession session = request.getSession();
    //수정 로그인체크 할까말까 
    //수정 이거 왜 String으롭 반환했더라? 안해도 되는거면 바꾸고 result없이 블로그컨트롤러같은것처럼 리턴에 바로적고 싶다 
    
    int result = cartService.addCart(cartDto);
    return result+"";
    }
  

  @GetMapping(value="list/{num}", produces=MediaType.APPLICATION_JSON_VALUE)
  public String cartInfo(@PathVariable("num") int num, Model model) throws Exception {
    model.addAttribute("cartInfo", cartService.getCartList(num));
    return "cart/list";
  }
  
}
  
  
  

