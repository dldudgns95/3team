<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="제품상세페이지" name="title"/>
</jsp:include>
  <div>
    <h4>${product.prdtTitle}</h4>   
    <hr>
  <div>
  <div> 
    <div>
    <!-- 제품이미지 출력 -->
    <div class="prdt_image" style="float: left; width: 50%; padding-left:50px;">
      <img src="${productImage.imagePath}/${productImage.filesystemName}">  
    </div>
    <!-- 제품정보 출력 -->
    <div class="prdt_info" style="float: left; width: 50%; height:600px; border-bottom: 1px solid gray;">
      <p class="title_box">Product Info</p>
      <p>${product.prdtName}</p>            
      <p>${product.prdtInfo}</p>            
      <p>상품조회수 : ${product.prdtHit} 회</p>            
      <p>판매가 : ${product.prdtRealPrice} 원</p>     
      <!-- <button type="button" name="btn_coupon" class="btn btn-light">쿠폰받기</button>  -->
      <div class="button_quantity" style="padding-bottom: 10px;">
        수량 : 
        <button type="button" class="minus_btn">-</button>
        <input type="text" class="quantity_input" id="qty" value="1" size="2" readonly> 개      
        <button type="button" class="plus_btn">+</button>
        현재 재고 : ${product.prdtStock} 개
      </div>
      <p>쿠폰적용가 : 35900 원   <!-- 판매가에서 할인계산 후 금액 -->  </p> 

      <hr>
      <!-- 장바구니,찜하기,구매하기로 이동하는 버튼 -->
      <div>
        총 결제금액: ${product.prdtRealPrice} 원
        <input type="hidden" name="prdtNum" value="${product.prdtNum}">    
        <i class="fa-regular fa-star"></i>    <!-- 찜하기 된 제품은 색깔있는 별 <i class="fa-solid fa-star"></i> -->
        <button type="button" id="btn_cart" class="btn btn-light">장바구니</button>
        <button type="button" id="btn_order" class="btn btn-primary">구매하기</button>
        </div>  
      </div>
    </div>
  </div>
  </div> 
 
    <hr>
    <div>상세보기</div>
    
   </div> 

  <script>
  
  // 버튼을 클릭하면 수량 변경(1개 이하는 불가능)
  let quantity = $('.quantity_input').val();
  $('.plus_btn').on('click', function(){
    $('.quantity_input').val(++quantity);
  });
  $('.minus_btn').on('click', function(){
    if(quantity > 1) {
    $('.quantity_input').val(--quantity);
    } else {
      alert('최소 수량은 1개입니다.');
      return;
    }
  });
  
  
  // 장바구니 버튼을 누르면 멤버번호,제품번호,수량 데이터 전송
  // 전송할 데이터
  const form = {
      num : '${sessionScope.member.num}',  // 멤버번호
      prdtNum : '${product.prdtNum}',      // 제품번호
      prdtCount : ''                       // 제품수량
  }
  
  // 장바구니 추가
  $('#btn_cart').on('click', function(e){
    form.prdtCount = $('.quantity_input').val();
    $.ajax({
      type: 'post',
      url: '${contextPath}/cart/add.do',
      data: form,
      success: function(result){
        if(result == '0'){
          alert('장바구니에 추가를 하지 못했습니다.');
          console.log(result);
        } else if(result == '1') {
          alert('장바구니에 추가되었습니다.');
          console.log(result);
        } else if(result == '2'){
          alert('장바구니에 같은 제품이 있습니다.');
          console.log(result);
        } else if(result == '5') {
          alert('로그인이 필요합니다.');
          console.log(result);
        }
      }
    })
  });
  
  
  </script>



<%@ include file="../layout/footer.jsp" %>