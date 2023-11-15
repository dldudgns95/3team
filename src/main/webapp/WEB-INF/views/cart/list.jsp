<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<c:set var="cartList"  value="${cartMap.cartList}"  />
<c:set var="prdtList"  value="${cartMap.prdtList}"  />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="장바구니" name="title"/>
</jsp:include>

<style>
  
</style>

<!-- 장바구니 시작 -->   
<div class="cart cart-title"><h2>${member.name}님의 장바구니</h2></div>

<!-- 장바구니 상단 (전체선택, 선택삭제) -->
<div class="cart cart-top">
<div>
  <span class="all-check-div">
    <label class="cart-checkbox">
      <input type="checkbox" class="all-check input_size_20" checked="checked"><span class="all_chcek_span">전체선택 (<span class="totalKind_span"></span>) </span>
    </label>
  </span>
  </div>
  <div>
    <input class="btn btn-primary" type="button" value="선택삭제" onclick="location.href='${contextPath}/cart/delete.do'">
  </div>
</div>

<!-- 장바구니 목록 -->
<div><a href="${contextPath}/cart/list/num/${member.num}">장바구니 </a></div>

<c:if test="${empty cartInfo}">
    <div class="cart cart-noPrdt">
      장바구니에 담은 상품이 없습니다.
    </div>
</c:if>    
<c:if test="${!empty cartInfo}">

<table class="cart-table">
  <tbody>
   <c:forEach items="${cartInfo}" var="ci">
   
    <tr>
      <td class="cart-prdt prdt-check">
        <input type="checkbox" class="individual_checkbox size-20" checked="checked">
        <input type="hidden" class="individual_prdtRealPrice_input" value="${ci.productDto.prdtRealPrice}">
        <input type="hidden" class="individual_prdtQty_input" value="${ci.prdtQty}">
        <input type="hidden" class="individual_totalPrice_input" value="${ci.productDto.prdtRealPrice * ci.prdtQty}">
        <input type="hidden" class="individual_prdtNum_input" value="${ci.prdtNum}">
      </td>
      <td class="cart-prdt prdt-image">
        <div class="image_wrap" data-prdtNum="${ci.imageList[0].productDto}" data-path="${ci.imageList[0].imagePath}" data-filename="${ci.imageList[0].filesystemName}">
          <img src="${productImage.imagePath}/${productImage.filesystemName}">  
        </div>
      </td>
      <td class="cart-prdt prdt-title">${ci.productDto.prdtTitle}</td>
      <td class="cart-prdt prdt-price">
        <del>원가가 : <fmt:formatNumber value="${ci.productDto.prdtRealPrice}" pattern="#,### 원" /></del><br>
        판매가 : <span class="red_color"><fmt:formatNumber value="${ci.productDto.prdtRealPrice}" pattern="#,### 원" /></span><br>
      </td>
      <td class="prdt-mod">
        <div class="table_text_align_center quantity_div">
          <button class="qty_btn minus_btn"><i id="qtyMinus" class="fa-solid fa-square-minus"></i></button>
          <input type="text" value="${ci.prdtQty}" class="quantity_input">  
          <button class="qty_btn plus_btn"><i id="qtyPlus" class="fa-solid fa-square-plus"></i></button>
        </div>
        <a class="btn btn-light qty_modify_btn" data-cartnum="${ci.cartNum}">수정</a>
      </td>
      <td class="prdy-del">
      <button class="btn btn-primary delete_btn" data-cartnum="${ci.cartNum}">삭제</button>
      <input class="btn btn-primary delete_btn" type="button" data-cartnum="${ci.cartNum}" value="삭제" />
      </td>
      
    </tr>
    </c:forEach>
  </tbody>
</table>

<!-- 수량 조정 form -->
<form action="${contextPath}/cart/modify.do" method="post" class="qty_modify_form">
  <input type="hidden" name="cartNum" class="modify-cartNum">
  <input type="hidden" name="prdtQty" class="modify-prdtQty">
  <input type="hidden" name="num" value="${member.num}">
</form> 
<!-- 삭제 form -->
<form action="${contextPath}/cart/delete.do" method="post" class="qty_delete_form">
  <input type="hidden" name="cartNum" class="delete_cartNum">
  <input type="hidden" name="num" value="${member.num}">
</form>  
<!-- 주문 form -->
<form action="${contextPath}/order/{num}" method="get" class="order_form">
  <input type="hidden" name="orders[0].prdtNum" value="${ci.prdtNum}">
  <input type="hidden" name="orders[0].prdtQty" value="">
</form>

<!-- 하단 플로팅 바 (총주문액 계산, 주문버튼) -->
<div class="cart-floating">
  <div class="order-area">
    <span>총주문액 <span class="totalPrice_span"></span> 원 - 쿠폰 <span class="coupon_span"></span> 원 = <span class="finalTotalPrice_span"></span>원 </span>
    <input type="submit" value="주문하기" class="btn btn-light">
  </div>
</div>

</c:if>

<div class="cart-bottom bottom-space">  </div>

<script>
  /* 체크여부에따른 종합 정보 변화 */
$(".individual_checkbox").on("change", function(){
  /* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
  setTotalInfo($(".prdt-check"));
});

/* 체크박스 전체 선택 */
$(".all-check").on("click", function(){
  /* 체크박스 체크/해제 */
  if($(".all-check").prop("checked")){
    $(".individual_checkbox").prop("checked", true);
  } else{
    $(".individual_checkbox").prop("checked", false);
  }
  
  /* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
  setTotalInfo($(".prdt-check"));  
});  

  // 체크박스 갯수 세기
  const fnCheckCount = () => {
    var checkedCount = $(".prdt-check input[type='checkbox']:checked").length;
    console.log("Checked Count: " + checkedCount);

    // 여기에 추가적인 작업을 수행하거나 식을 추가할 수 있습니다.
    // 예시: alert("현재 체크된 항목 개수는 " + checkedCount + "개입니다.");
    
    // 반환하고 싶은 값이 있다면 리턴
    // return checkedCount;
    }
  
  /* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo() {
  let totalPrice = 0; // 총 가격
  let totalKind = 0; // 총 종류
  let coupon = 10000;
  let finalTotalPrice = 0;

  $(".prdt-check").each(function (index, element) {

      if ($(element).find(".individual_checkbox").is(":checked") === true) { //체크여부
          // 총 가격
          totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
          // 쿠폰
<<<<<<< Updated upstream
                
=======
    
>>>>>>> Stashed changes
          // 총 종류
          totalKind += 1;
      }
  });

  /* 할인가격 결정 */
  if (totalPrice >= 55000) {
      finalTotalPrice = totalPrice - coupon;
  } else {
      coupon = 0;
      finalTotalPrice = totalPrice;
  }

  // 총 가격
  console.log("Total Price: " + totalPrice);

  $(".totalPrice_span").text(totalPrice.toLocaleString());
  
  // 쿠폰 
  $(".coupon_span").text(coupon);
  // 총 종류
  $(".totalKind_span").text(totalKind);
  // 최종 가격
  console.log("Final Total Price: " + finalTotalPrice);
  $(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
}

  
/* 수량버튼 */
$(".plus_btn").on("click", function(){
  let quantity = $(this).parent("div").find("input").val();
  $(this).parent("div").find("input").val(++quantity);
});
$(".minus_btn").on("click", function(){
  let quantity = $(this).parent("div").find("input").val();
  if(quantity > 1){
    $(this).parent("div").find("input").val(--quantity);    
  }
});


/* 수량 수정 버튼 */
$(".qty_modify_btn").on("click", function(){
  let cartNum = $(this).data("cartnum");
  let prdtQty = $(this).parent("td").find("input").val();

  if (prdtQty < 1) {
    alert("수량은 1 이상이어야 합니다.");
    return;
  }


  $.ajax({
	  type: "POST",
	  url: "/withmall/cart/modify.do",
	  contentType: "application/json;charset=UTF-8",
	  data: JSON.stringify({
	    cartNum: cartNum,
	    prdtQty: prdtQty
	  }),
	  success: function(response) {
	    console.log("수량 수정 성공", response.result);
	    alert("수량이 변경되었습니다");
	  },
	  error: function(error) {
	    console.error("수량 수정 실패", error);
	  }
	});
});

/* 장바구니 삭제 버튼 */
$(".delete_btn").on("click", function(e){
	
	
  e.preventDefault();
  // 현재 클릭된 버튼의 cartNum 값을 가져옴
  const cartNum = $(this).data("cartnum");

  // 삭제 여부를 사용자에게 확인하는 창 표시
  var confirmation = window.confirm("정말로 삭제하시겠습니까?");

  if (confirmation) {
    // 확인을 선택한 경우에만 삭제를 진행
    $(".delete_cartNum").val(cartNum);
    $(".qty_delete_form").submit();
  } else {
    // 취소한 경우 아무 동작 안함
    console.log('삭제가 취소되었습니다.');
  }
});
  

  // 하단 주문 플로팅바 스크롤바 최하단에서 사라지도록 조정
  const fnFloatHidden = () => {
    $(window).on('scroll', function () {
      var scrollPosition = $(window).scrollTop();
      var documentHeight = $(document).height(); // document의 높이를 직접 가져오도록 수정

      var viewportHeight = $(window).height();

      console.log("Scroll Position: " + scrollPosition);
      console.log("Document Height: " + documentHeight);
      console.log("Viewport Height: " + viewportHeight);

      var cartFloating = $('.cart-floating');

      if (scrollPosition + viewportHeight >= documentHeight - 1) {
        console.log('Reached Bottom!');
        cartFloating.addClass('hidden');
      } else {
        cartFloating.removeClass('hidden');
      }
    });
  };
  
  
$(document).ready(function() {
	  /* 종합 정보 섹션 정보 삽입 */
  setTotalInfo(); 	   
  fnCheckCount();
  fnFloatHidden();
  
 
  
});
</script>
<%@ include file="../layout/footer.jsp"%>