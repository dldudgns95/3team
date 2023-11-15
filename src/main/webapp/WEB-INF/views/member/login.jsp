<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />


<jsp:include page="../layout/header.jsp">
  <jsp:param value="로그인" name="title"/>
</jsp:include>

<div class="text-center">

<h1 class="title">로그인하세요</h1>
 <form method="post" action="${contextPath}/member/login.do">
  
    <div class="text-center mb-1 row">
      <label for="email" class="col-sm-3 col-form-label">아이디</label>
      <div class="col-sm-2"><input type="text" name="email" id="email" placeholder="이메일" class="form-control"></div>
    </div>
    <div class="text-center mb-1 row ">      
      <label for="pw" class="col-sm-3 col-form-label">비밀번호</label>
      <div class="col-sm-2"><input type="password" name="pw" id="pw" placeholder="●●●●" class="form-control"></div>
    </div>
    <div class="mb-1 row">
      <input type="hidden" name="referer" value="${referer}">
      <button class="btn btn-dark d-grid gap-2 col-2 mx-auto" type="submit">로그인</button>
    </div>
    </form> 
    </div>

   	<div class="btn-container text-center">
        <a href="${contextPath}/member/agree.form"><button class="btn btn-dark"> 회원가입</button></a>
 	 	<a href="${contextPath}"><button class="btn btn-dark">아이디/비밀번호 찾기</button></a>
  	</div>
    <div class="text-center mt-1">
    	<a href="${naverLoginURL}">
      <img src="${contextPath}/resources/images/btnG_축약형.png" width="200px">
    </a>
  </div>


<%@ include file="../layout/footer.jsp" %>
