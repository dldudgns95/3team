package kr.co.withmall.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class OrderPageDetailDto {

	/* 뷰로부터 전달받을 값 */
    private int prdtNum;
    
    private int prdtQty;
    
	/* DB로부터 꺼내올 값 */
    private String prdtTitle;
    private int prdtRealPrice;

    
	/* 만들어 낼 값 */
    private int salePrice;
    private int totalPrice;
    private int coupon;
    private int totalCoupon;
    
    
    public void initSaleTotal() {
      this.salePrice = this.prdtRealPrice - this.coupon;
      this.totalPrice = this.salePrice*this.prdtQty;
      this.coupon = 10000;
      this.totalCoupon =this.coupon * this.prdtQty;
      
    }
    

}
