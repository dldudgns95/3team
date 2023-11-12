<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="장바구니" name="title"/>
</jsp:include>

<style>
  
</style>


<!-- 장바구니 시작 -->
<div class="cart cart-title"><h2>${sessionScope.member.name}님의 장바구니</h2></div>

<!-- 장바구니 상단 (전체선택, 선택삭제) -->
<div class="cart cart-top">
<div>
  <span class="all-check">
    <label class="cart_checkbox">
      <input type="checkbox" name="check_all" id="check_all">전체선택 <span id=checkCnt>개</span>
    </label>
  </span>
  </div>
  <div>
  <button>선택삭제</button>
  </div>
</div>

<!-- 장바구니 목록 -->
<div><a href="/cart/list/${member.num}">장바구니</a></div>
<c:if test="${empty list}">
    <div class="cart">
      장바구니에 담은 상품이 없습니다.
    </div>
</c:if>    
<form id="cart cart-order" action="${contextPath}/order/list.do" method="post">
  <table class="cart-content">
    <!-- 장바구니 아이템 반복 출력 -->
  	<c:forEach var="cart" items="${prdtList}">
  	<tr>
  		<td class="cart-image">
  			<img src="${pageContext.request.contextPath}/upload/${cart.product.product_photo1}" width="80">
  		</td>
  		<td>
  			<a href="${pageContext.request.contextPath}/product/productDetail.do?product_num=${cart.product_num}">${cart.product.product_title}</a>
  		</td>
  		<td>
  		  <div class="quantity">
  			<button type="button" onclick="fnCalCount('m', this);" class="button qpm m">-</button>						
  			<input type="text" name="order_quantity" id="result"
  			  min="1" max="${cart.product.product_stock} 
  			  autocomplete="off" readonly="readonly"
  			  value="${cart.cart_quantity}" style="text-align:center">
  			<button type="button" onclick="fnCalCount('p', this);" class="button qpm p">+</button>
  		  </div>
  		  <input type="button" value="변경"  
  			 class="cart-modify button" 
  			 data-cartnum="${cart.mem_cart_num}"
  			 data-itemnum="${cart.product_num}"
  		   >
  		</td>
  		<td>
		  <c:if test="${cart.product.product_price!=cart.product.product_price_sales}">
		  <label class="before-price"><fmt:formatNumber value="${cart.product.product_price*cart.cart_quantity}"/>원</label><br>
		  </c:if>
		  <b><fmt:formatNumber value="${cart.product.product_price_sales*cart.cart_quantity}"/>원</b>
  		</td>
  		<td class="buttontd">
  		  <input type="button" value="삭제" class="cart-del button" data-cartnum="${cart.mem_cart_num}">
  		</td>
  	</tr>
  	</c:forEach>
  </table>



<div class="cart del">
<div>바구니</div>
<div>바구니</div>
<div>바구니</div>
<div>바구니</div>
<div>바구니</div>
<hr>
<div>바구니</div>
<div>바구니</div>
<div>바구니</div>
<div>바구니</div>
<div>바구니</div>
<hr>
<div>바구니</div>
<div>바구니</div>
<div>바구니</div>
<div>바구니</div>
<div>바구니</div>
<hr>
<div>바구니</div>
<div>바구니</div>
<div>바구니</div>
<div>바구니</div>
<div>바구니</div>
<hr>
<div>바구니</div>
<div>바구니</div>
<div>바구니</div>
<div>바구니</div>
<div>바구니</div>
<hr>
<div>마지막 바구니</div>
</div>

<!-- 하단 플로팅 바 (총주문액 계산, 주문버튼) -->
<div class="cart-floating">
  <div class="order-area">
    <span>총주문액 ${sessionScope.member.num} 원 - 할인금액 ${sessionScope.member.num} 원 = </span>
    <input type="submit" value="주문하기" class="button">
  </div>
</div>
</form>

<%@ include file="../layout/footer.jsp"%>