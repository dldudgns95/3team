<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="회원가입" name="title"/>
</jsp:include>

<div>
 <h1>환영합니다</h1>
 <h2>위드에 가입하시려면 약관에 동의해 주세요.</h2>
 
 <form id="frm_agree" action="${contextPath}/user/join.form">


    <div class="form-check mt-3">
      <input type="checkbox" name="service" class="form-check-input chk_each" id="service">
      <label class="form-check-label" for="service">
        서비스 이용약관 동의(필수)
      </label>
    </div>
    <div>
      <textarea rows="5" class="form-control">제발 동의해</textarea>
    </div>
    
    <div class="form-check mt-3">
      <input type="checkbox" name="event" class="form-check-input chk_each" id="event">
      <label class="form-check-label" for="event">
        이벤트 알림 동의(선택)
      </label>
    </div>
    <div>
      <textarea rows="5" class="form-control">동의해줬으면 좋겠어</textarea>
    </div>
  
    <div class="form-check mt-3">
      <input type="checkbox" class="form-check-input" id="chk_all">
      <label class="form-check-label" for="chk_all">
        모두 동의합니다
      </label>
    </div>

    <div class="d-grid gap-2 col-2 mx-auto">
      <button type="submit" class="btn btn-dark">다음</button>
    </div>
    
  </form>
 
</div>
