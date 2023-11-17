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
      <img src="${contextPath}/${productImage.imagePath}/${productImage.filesystemName}">  
    </div>
    
    <!-- 제품정보 출력 -->
    <div class="prdt_info" style="float: left; width: 50%; height:600px; border-bottom: 1px solid gray;">
      <p class="title_box">Product Info</p>
      <p>${product.prdtName}</p>            
      <p>${product.prdtInfo}</p>            
      <p>상품조회수 : ${product.prdtHit} 회</p>            
      <p>판매가 : ${product.prdtRealPrice} 원</p> 
      
      <!-- 사용 가능한 쿠폰리스트 출력하는 div -->
      <div id="coupon_list">
        <select id="member_couponList"></select>
      </div>
      
      <!-- 수량 설정 -->    
      <div class="button_quantity" style="padding-bottom: 10px;">
        수량 : 
        <button type="button" class="minus_btn btn btn-outline-dark">-</button>
        <input type="text" class="quantity_input" id="qty" value="1" size="2" readonly> 개      
        <button type="button" class="plus_btn btn btn-outline-dark">+</button>
        현재 재고 : ${product.prdtStock} 개
      </div>
      
      
      <!-- 쿠폰 적용가 출력 -->
      <div>
      <p id="p_couponPrice">쿠폰 적용가 :</p>
      </div>
      <hr>
      
      <!-- 장바구니,찜하기,구매하기로 이동하는 버튼 -->
      <div>
        <p id="total_price">총 결제가격 :</p>
        <input type="hidden" name="prdtNum" value="${product.prdtNum}">    
        <form id="frm_zzim">
          <button type="button" id="btn_zzim" class="btn btn-outline-secondary"><i class="fa-regular fa-star"></i></button>
          <button type="button" id="btn_cart" class="btn btn-light">장바구니</button>
          <button type="button" id="btn_order" class="btn btn-primary">구매하기</button>
        </form>
        </div>  
      </div>
    </div>
  </div>
  </div> 

    <hr>
    <div>제품상세이미지</div>
    
   </div> 

  <script>
  // 버튼을 클릭하면 수량,쿠폰 적용가 변경(재고이상 수량 불가능) 
  let quantity = $('.quantity_input').val();
  let price = ${product.prdtRealPrice};
  
  $('.plus_btn').on('click', function(ev){
    if(quantity >= ${product.prdtStock}){
      alert('최대 구매수량을 초과했습니다.');
      ev.preventDefault();
      return;      
    } else {
    $('.quantity_input').val(++quantity);
    let total = price * $('#qty').val();
   $('#p_couponPrice').append(total);
    const value = $("select[id=member_couponList]").val();
    let str = '';
    let qty = $('#qty').val();
    str += ('${product.prdtRealPrice}' * qty) - value;
    $('#p_couponPrice').text('쿠폰 적용가 : ');
    $('#p_couponPrice').append(str);
    $('#total_price').text('총 구매가 : ');
    $('#total_price').append(str);
    }
  });
  
  //버튼을 클릭하면 수량,쿠폰적용가 변경(1개 이하는 불가능)
  $('.minus_btn').on('click', function(){
    if(quantity > 1) {
    $('.quantity_input').val(--quantity);
    const value = $("select[id=member_couponList]").val();
    let qty = $('#qty').val();
    let str = '';
    str += ('${product.prdtRealPrice}' * qty) - value;    
    $('#p_couponPrice').text('쿠폰 적용가 : ');
    $('#p_couponPrice').append(str);
    $('#total_price').text('총 구매가 : ');
    $('#total_price').append(str);
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
      prdtQty : ''                       // 제품수량
  }
  
  // 장바구니 추가
  $('#btn_cart').on('click', function(e){
    form.prdtQty = $('.quantity_input').val();
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

  // 상세 페이지로 들어갈 때 멤버의 쿠폰리스트 가져오기
   $.ajax({
          type: 'get',
          url: '${contextPath}/main/unusedCouponList.do',
          data: 'num=${sessionScope.member.num}',
          dataType: 'json',
          success: (resData) => {
            const select = document.getElementById('member_couponList');
            // #pets에 select 아이디 입력
            $('#coupon_select option').remove();
            $(select).append("<option>----적용가능쿠폰----</option>")
            $.each(resData.productList, (i, c) => {
              $(select).append("<option value='"+ c.cpPrice+"'>" + c.cpName + '  ' +  c.cpInfo + "</option>")             
            })
          } 
        })
   
        
   // 찜하기(기본은 비어있는 별)  
   $('#btn_zzim').on('click', () => {
     if(!$('#btn_zzim').hasClass('zzimClass')){
     $.ajax({
       type: 'post',
       url: '${contextPath}/product/addZzim.do',
       contentType: 'application/json',
       data: JSON.stringify ({
         num: ${sessionScope.member.num},
         prdtNum: ${product.prdtNum}         
       }),
       dataType: 'json',
       success: (resData) => {
         if(resData.addResult === 1){
           document.getElementById('btn_zzim').innerHTML = '<i class="fa-solid fa-star"></i>';
           document.getElementById('btn_zzim').attr('disable', 'true');
         }
       }
       
     })
     } 
 })       
 
  // 찜하기 되어있는 상품은 까만별로 표시 (한번 클릭하면 버튼 비활성화)
  const fnCheckZzim = () => {
  $.ajax({
       type: 'get',
       url: '${contextPath}/product/zzimPrdt.do',
       data: "num=${sessionScope.member.num}&prdtNum=${product.prdtNum}",         
       dataType: 'json',
       success: (resData) => {
         if(resData.lenght !== 0)
           document.getElementById('btn_zzim').innerHTML = '<i class="fa-solid fa-star"></i>';
           $('#btn_zzim').attr('disabled', 'disabled');
       }
       
     })
  }
  
  // 쿠폰 적용가, 총 결제가 계산
  $("select[id=member_couponList]").change(function(){
    const value = $("select[id=member_couponList]").val();
    let qty = $('#qty').val();
    let str = '';
    str += ('${product.prdtRealPrice}' * qty) - value;
    $('#p_couponPrice').text('쿠폰 적용가 : ');
    $('#p_couponPrice').append(str);
    $('#total_price').text('총 구매가 : ');
    $('#total_price').append(str);
  })

  
  
  fnCheckZzim();

  </script>



<%@ include file="../layout/footer.jsp" %>