<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />


<jsp:include page="../layout/header.jsp">
  <jsp:param value="주문내역" name="title"/>
</jsp:include>
<style>
    /* 점 없애기 */
    li {
        list-style: none;
    }
    div.parent {
        padding-left: 50px;
        display: flex;
        justify-content: flex-start;
    }    
    div.child1 {
        width: 10%;
    }
</style>
<div class="parent">
<div class="child1"> 
<h1>내 정보</h1>
	<ul>
		<li><a href="${contextPath}/member/orderlist.do">주문내역</a></li>
		<li><a href="${contextPath}/member/qnalist.do">문의내역</a></li>
		<li><a href="${contextPath}/cart/list.do">장바구니</a></li>
		<li><a href="${contextPath}/main/zzimList.do?num=${sessionScope.member.num}">찜한삼품</a></li>
		<li><a href="${contextPath}/member/mypageedit.form">개인정보 수정</a></li>
		<li><a href="${contextPath}/member/memberoutform.do">회원 탈퇴</a></li>
	</ul>
</div>
<h1 class="text-center title"> 주문내역</h1>
		<c:if test="${empty list}">
		  <div class="result-display">주문내역이 없습니다.</div>	
		</c:if>

        <c:if test="${count > 0}">
          <div class="list">
            <div class="list-num">주문 번호</div>
            <div class="list-list">주문 목록</div>
            <div class="list-price">총 가격</div>
            <div class="list-date">주문 날짜</div>
            <div class="list-status">배송 상태</div>
          </div>
          
          <c:forEach var="zzim" items="${list}">
            <ul class="list">
              <li class="list-num"><a href="${pageContext.request.contextPath}/member/memberEdit.do?orderNum=${zzim.order_num}">${zzim.order_num}</a></li>
              <li class="list-list-data"><a href="${pageContext.request.contextPath}/member/memberEdit.do?orderNum=${zzim.order_num}">${zzim.product_name}</a></li>
              <li class="list-price">${zzim.product_price}원</li>
              <li class="list-date">${zzim.order_date}</li>
			  <c:if test="${zzim.order_status==0}"><li class="list-status-1">주문 완료</li></c:if>
              <c:if test="${zzim.order_status==1}"><li class="list-status-2">배송중</li></c:if>
              <c:if test="${zzim.order_status==2}"><li class="list-status-3">배송 완료</li></c:if>
            </ul>
          </c:forEach>
          
        </c:if> 
        
</div>
</div>

<%@ include file="../layout/footer.jsp" %>