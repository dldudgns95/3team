<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="주문" name="title"/>
</jsp:include>

<style>
  
</style>

<div class="order_content_area">
	
	<div class="content_subject"><span>주문하기</span></div>

	<div class="content_main">
    	<!-- 회원 정보 -->
    	<div class="member_info_div">
    		<table class="table_text_align_center memberInfo_table">
    			<tbody>
    				<tr>
    					<th style="width: 25%;">주문자</th>
    					<td style="width: *">${member.name} | ${member.mobile}</td>
    				</tr>
    			</tbody>
    		</table>
    	</div>				
		
        <!-- 배송지 정보 -->
        <div class="addressInfo_div">
          <div class="addressInfo_button_div">
            <button class="address_btn address_btn_1" onclick="showAdress('1')">주소록</button>
            <button class="address_btn address_btn_2" onclick="showAdress('2')">직접 입력</button>
          </div>
          <div class="addressInfo_input_div_wrap">
            <div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
              <table>
                <colgroup>
                  <col width="25%">
                  <col width="*">
                </colgroup>
                <tbody>
                  <tr>
                    <th>이름</th>
                    <td>
                      ${member.name}
                    </td>
                  </tr>
                  <tr>
                    <th>주소</th>
                    <td>
                      ${member.jibunaddress} ${member.roadaddress}<br>${member.detailaddress}
                      <input class="selectAddress" value="T" type="hidden">
                      <input class="addressee_input" value="${member.name}" type="hidden">
                      <input class="address1_input" type="hidden" value="${member.jibunaddress}">
                      <input class="address2_input" type="hidden" value="${member.roadaddress}">
                      <input class="address3_input" type="hidden" value="${member.detailaddress}">                                          
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="addressInfo_input_div addressInfo_input_div_2">
              <table>
                <colgroup>
                  <col width="25%">
                  <col width="*">
                </colgroup>
                <tbody>
                  <tr>
                    <th>이름</th>
                    <td>
                      <input class="addressee_input">
                    </td>
                  </tr>
                  <tr>
                    <th>주소</th>
                    <td>
                    
                      <input class="selectAddress" value="F" type="hidden">
                      <input class="address1_input" readonly="readonly"> <a class="address_search_btn" onclick="execution_daum_address()">주소 찾기</a><br>
                      <input class="address2_input" readonly="readonly"><br>
                      <input class="address3_input" readonly="readonly">
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>      
<!-- 상품 정보 -->
<div class="orderGoods_div">
  <!-- 상품 종류 -->
  <div class="goods_kind_div">
    주문상품 <span class="goods_kind_div_kind"></span>종 <span class="goods_kind_div_count"></span>개
  </div>
  <!-- 상품 테이블 -->
  <table class="goods_subject_table">
    <colgroup>
      <col width="15%">
      <col width="45%">
      <col width="40%">
    </colgroup>
    <tbody>
      <tr>
        <th>이미지</th>
        <th>상품명</th>
        <th>판매가</th>
      </tr>
    </tbody>
  </table>
  <table class="goods_table">
    <colgroup>
      <col width="15%">
      <col width="45%">
      <col width="40%">
    </colgroup>         
    <tbody>
      <c:forEach items="${orderList}" var="ol">
        <tr>
          <td>
              <img>
          </td>
          <td>${ol.prdtTitle}</td>
          <td class="goods_table_price_td">
            <fmt:formatNumber value="${ol.salePrice}" pattern="#,### 원" /> | 수량 ${ol.prdtQty}개
            <br><fmt:formatNumber value="${ol.totalPrice}" pattern="#,### 원" />
            <br>-<fmt:formatNumber value="${ol.totalCoupon}" pattern="#,### 원" />
            <input type="hidden" class="individual_prdtRealPrice_input" value="${ol.prdtRealPrice}">
            <input type="hidden" class="individual_salePrice_input" value="${ol.salePrice}">
            <input type="hidden" class="individual_prdtQty_input" value="${ol.prdtQty}">
            <input type="hidden" class="individual_totalPrice_input" value="${ol.salePrice * ol.prdtQty}">
            <input type="hidden" class="individual_coupon_input" value="${ol.coupon}">
            <input type="hidden" class="individual_totalCoupon_input" value="${ol.totalCoupon}">
            <input type="hidden" class="individual_prdtNum_input" value="${ol.prdtNum}">            
          </td>
        </tr>             
      </c:forEach>

    </tbody>
  </table>
</div>  
        <!-- 주문 종합 정보 -->
        <div class="total_info_div">
          <!-- 가격 종합 정보 -->
          <div class="total_info_price_div">
            <ul>
              <li>
                <span class="price_span_label">상품 금액</span>
                <span class="totalPrice_span"></span>원
              </li>
              <li>
                <span class="price_span_label">할인금액</span>
                <span class="usePoint_span"></span>원
              </li>
              <li class="price_total_li">
                <strong class="price_span_label total_price_label">최종 결제 금액</strong>
                <strong class="strong_red">
                  <span class="total_price_red finalTotalPrice_span">
                  </span>원
                </strong>
              </li>
            </ul>
          </div>
          <!-- 버튼 영역 -->
          <div class="total_info_btn_div">
            <a class="order_btn">결제하기</a>
          </div>
        </div>        
        
        
       <!-- 주문 요청 form -->
      <form class="order_form" action="" method="post">
        <!-- 주문자 회원번호 -->
        <input name="memberId" value="${member.num}" type="hidden">
        <!-- 주소록 & 받는이-->
        <input name="addressee" type="hidden">
        <input name="memberAddr1" type="hidden">
        <input name="memberAddr2" type="hidden">
        <input name="memberAddr3" type="hidden">
        <!-- 사용 포인트 -->
        <!-- 상품 정보 -->
      </form>
        
      </div>  



  </div>

<script>
/* 다음 주소 연동 */
function execution_daum_address(){
 		console.log("동작");
	   new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                 	// 추가해야할 코드
                    // 주소변수 문자열과 참고항목 문자열 합치기
                      addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
             	// 제거해야할 코드
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".address1_input").val(data.zonecode);
                $(".address2_input").val(addr);				
                // 커서를 상세주소 필드로 이동한다.
                $(".address3_input").attr("readonly", false);
                $(".address3_input").focus();	 
	            
	            
	        }
	    }).open();  	
	
	   
 $(document).ready(function() {
	  /* 종합 정보 섹션 정보 삽입 */
  execution_daum_address(); 	   
 
  
});
}

</script>	


<%@ include file="../layout/footer.jsp"%>