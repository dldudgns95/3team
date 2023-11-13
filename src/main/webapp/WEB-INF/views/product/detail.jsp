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
      <p>쿠폰적용가 : 35900 원   <!-- 판매가에서 할인계산 후 금액 -->
      <button type="button" name="btn_coupon" class="btn btn-light">쿠폰받기</button>
      </p> 
      <div class="button_quantity">
        수량 : 
        <button class="minus_btn">-</button>
        <input type="text" name="qty" id="qty" value="1" size="2" readonly> 개      
        <button class="plus_btn">+</button>
      </div>

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
    
    <div>제품상세</div>
    <div>제품상세</div>
    <div>제품상세</div>
    <div>제품상세</div>
    <div>제품상세</div>
    <div>제품상세</div>
    <div>제품상세</div>
    <div>제품상세</div>
    <div>제품상세</div>
    <div>제품상세</div>
    <div>제품상세</div>
    <div>제품상세</div>
    <div>제품상세</div>
    <div>제품상세</div>
    <div>제품상세</div>
    <div>제품상세</div>
    <div>제품상세</div>
    
    
   </div> 




<%@ include file="../layout/footer.jsp" %>