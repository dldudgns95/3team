package kr.co.withmall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;

import kr.co.withmall.dto.CartDto;
import kr.co.withmall.dto.ProductDto;

@Mapper
public interface CartMapper {
  /* 카트 목록 */
  public List<CartDto> getCartList(CartDto cartDto) throws DataAccessException;
  public List<CartDto> getCart(int num) throws DataAccessException;
  /* 카트 추가*/
  public int insertCart(CartDto cartDto) throws DataAccessException;
  /* 카트 삭제 */
  public void deleteCart(int cartNum) throws DataAccessException;
  /* 제품 수량 수정 */
  public void modiftQty(CartDto cartDto) throws DataAccessException;
  /* 카트 확인 */ 
  public int getPrdtCount(CartDto cartDto) throws DataAccessException;
  /* 제품 확인 */
  public List<ProductDto> getPrdtList(CartDto cartDto) throws DataAccessException; 
  
  

}
