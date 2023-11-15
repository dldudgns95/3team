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

<h1>내 정보</h1>
	<ul>
		<li><a href="${contextPath}/member/orderlist.do">주문내역</a></li>
		<li><a href="${contextPath}/member/qnalist.do">문의내역</a></li>
		<li><a href="${contextPath}/member/cart.do">장바구니</a></li>
		<li><a href="${contextPath}/member/zimlist.do">찜한삼품</a></li>
		<li><a href="${contextPath}/member/mypageedit.form">개인정보 수정</a></li>
		<li><a href="${contextPath}/member/memberoutform.do">회원 탈퇴</a></li>
	</ul>
	
<div>
<h1>회원 탈퇴</h1>

</div>
<div class="page">
  <div class="page_outer"> 
    <div class="page_inner">

      <form class="memberOut_form" action="memberOut.do" method="post">
        <div class="page_input">
          <div class="page_input_box">
            <input type="text" name="id" class="input_style" id="id" maxlength="12" autocomplete="off" placeholder="아이디를 입력해주세요">
          </div>
          <div class="page_input_box">
            <input type="password" name="passwd" class="input_style" id="passwd" maxlength="12" placeholder="비밀번호를 입력해주세요">
          </div>
        </div>

        <div class="page_button2">
          <div class="page_button_box">
            <input type="submit" class="button3" id="login" value="탈퇴하기">
          </div>
          <div class="page_button_box">
            <input type="button" class="button4" value="취소" onclick="location.href='${pageContext.request.contextPath}/main.do'">
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<%@ include file="../layout/footer.jsp" %>