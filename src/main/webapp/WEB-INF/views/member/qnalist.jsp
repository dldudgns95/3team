<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />


<jsp:include page="../layout/header.jsp">
  <jsp:param value="문의내역" name="title"/>
</jsp:include>
<style>
    /* 점 없애기 */
    li {
        list-style: none;
    }
    
    div.child1 {
        width: 10%;
    }
    div.parent {
        padding-left: 50px;
        display: flex;
        justify-content: flex-start;
    }    
    div.child2 {
        width: 70%;
        display: flex;
        justify-content: center;
        
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
<div class="child2">
<h1 class="text-center"> 문의내역</h1>
</div>
</div>

<%@ include file="../layout/footer.jsp" %>