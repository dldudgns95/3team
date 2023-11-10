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

<style>
  .sub_menu {
    display: flex;
    justify-content: space-between;
  }
</style>
<div>

<h1 class="title">로그인</h1>
 <form method="post" action="${contextPath}/member/login.do">
  
    <div class="mb-3 row">
      <label for="email" class="col-sm-3 col-form-label">아이디</label>
      <div class="col-sm-9"><input type="text" name="email" id="email" placeholder="이메일" class="form-control"></div>
    </div>
    
    <div class="mb-3 row">      
      <label for="pw" class="col-sm-3 col-form-label">비밀번호</label>
      <div class="col-sm-9"><input type="password" name="pw" id="pw" placeholder="●●●●" class="form-control"></div>
    </div>
    
    <div class="d-grid gap-2 mb-3">
      <input type="hidden" name="referer" value="${referer}">
      <button class="btn btn-primary btn-lg" type="submit">로그인</button>
    </div>
    
  </form>
  
  <ul class="sub_menu">
    <li><a href="${contextPath}">회원가입</a>
    <li><a href="${contextPath}">아이디/비밀번호 찾기</a>
  </ul>
  
  <hr class="my-4">
  
  <div class="text-center">
    <a href="${naverLoginURL}">
      <img src="${contextPath}/resources/images/btnG_축약형.png" width="200px">
    </a>
  </div>
</div>
</body>
</html>