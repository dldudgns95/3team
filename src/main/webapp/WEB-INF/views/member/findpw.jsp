<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="비밀번호 찾기" name="title"/>
</jsp:include>

<script src="${contextPath}/resources/js/findpw.js?dt=${dt}"></script>

<h1 class="text-center">임시 비밀번호 발급</h1>
<form id="updatepw" action="${contextPath}/member/sendPw.do" method="post">
    <div class="row mb-2">
      <label for="email" class="col-sm-3 col-form-label">이메일</label>
      <div class="col-sm-6"><input type="text" name="email" id="email" placeholder="이메일" class="form-control"></div>
      <div class="col-sm-3 d-grid gap-2"><button type="button" id="btn_get_code" class="btn btn-dark">인증코드받기</button></div>
      <div class="col-sm-3"></div>
      <div class="col-sm-9" id="msg_email"></div>
    </div>
</form>
    <div class="row mb-2">
      <div class="col-sm-8"><input type="text" id="code" class="form-control" placeholder="인증코드입력" disabled></div>
      <div class="col-sm-4 d-grid gap-2"><button type="button" class="btn btn-dark" id="btn_verify_code" disabled>인증하기</button></div>
    </div>

<%@ include file="../layout/footer.jsp" %>
