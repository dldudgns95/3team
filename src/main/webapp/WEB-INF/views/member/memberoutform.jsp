<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />


<jsp:include page="../layout/header.jsp">
  <jsp:param value="회원탈퇴" name="title"/>
</jsp:include>



<style>
    /* 점 없애기 */
    li {
        list-style: none;
    }
</style>

<h1>내 정보</h1>
	<ul>
		<li><a href="${contextPath}/member/orderlist.do">주문내역</a></li>
		<li><a href="${contextPath}/member/qnalist.do">문의내역</a></li>
		<li><a href="${contextPath}/cart/list.do">장바구니</a></li>
		<li><a href="${contextPath}/member/zimlist.do">찜한삼품</a></li>
		<li><a href="${contextPath}/member/mypageedit.form">개인정보 수정</a></li>
		<li><a href="${contextPath}/member/memberoutform.do">회원 탈퇴</a></li>
	</ul>
	
<div class="text-center">
<h1>회원 탈퇴</h1>
      <ul>
	      <li>
		      <form method="post" action="memberout.do" >
		            <button type="submit" class="btn btn-dark">탈퇴하기</button>
		      </form>
		  </li>
  	    <li><button class="btn btn-dark" onclick="location.href='${contextPath}/main.do'">취소</button></li>
      </ul>
</div>

<%@ include file="../layout/footer.jsp" %>