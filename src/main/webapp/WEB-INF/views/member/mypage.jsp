<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />


<jsp:include page="../layout/header.jsp">
  <jsp:param value="마이페이지" name="title"/>
</jsp:include>
<div>
<h1>내 정보</h1>
	<ul>
		<li>주문내역</li>
		<li>문의내역</li>
		<li>장바구니</li>
		<li>찜한삼품</li>
		<li><a href="${contextPath}/member/mypageedit.form">개인정보 수정</a></li>
		<li><a href="${contextPath}/member/memberoutform.do">회원 탈퇴</a></li>
	</ul>
</div>

</body>
</html>