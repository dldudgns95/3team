<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="네이버간편가입" name="title"/>
</jsp:include>
<style>
    /* 점 없애기 */
    li {
        list-style: none;
    }
</style>
<script>
  
  $(() => {
    fnNaverJoin();
  })
  
  const fnNaverJoin = () => {
    $('#frm_naver_join').submit((ev) => {
      if(!$('#service').is(':checked')){
        alert('이용약관에 동의하세요.');
        ev.preventDefault();
        return;
      }
    })
  }
  
</script>

<div class="wrap wrap_6">

  <h1 class="title">네이버 간편가입</h1>

  <form id="frm_naver_join" method="post" action="${contextPath}/member/naver/join.do">
    
    <div class="row mb-2">
      <label for="email" class="col-sm-3 col-form-label">이메일</label>
      <div class="col-sm-9"><input type="text" name="email" id="email" class="form-control" value="${naverProfile.email}" readonly></div>
    </div>
    
    <div class="row mb-2">
      <label for="name" class="col-sm-3 col-form-label">이름</label>
      <div class="col-sm-9"><input type="text" name="name" id="name" class="form-control" value="${naverProfile.name}" readonly></div>
    </div>

    <div class="row mb-2">
      <label for="mobile" class="col-sm-3 col-form-label">휴대전화번호</label>
      <div class="col-sm-9"><input type="text" name="mobile" id="mobile" class="form-control" value="${naverProfile.mobile}" readonly></div>
    </div>

    <div class="row mb-2">
      <label class="col-sm-3 form-label">성별</label>
      <div class="col-sm-3">
        <input type="radio" name="gender" value="M" id="man" class="form-check-input">
        <label class="form-check-label" for="man">남자</label>
      </div>
      <div class="col-sm-3">
        <input type="radio" name="gender" value="F" id="woman" class="form-check-input">
        <label class="form-check-label" for="woman">여자</label>
      </div>
    </div>
    <script>
      $(':radio[value=${naverProfile.gender}]').prop('checked', true);
    </script>

    <hr class="my-3">
    
    <div class="form-check mt-3">
      <input type="checkbox" name="service" class="form-check-input chk_each" id="service">
      <label class="form-check-label" for="service">
        서비스 이용약관 동의(필수)
      </label>
    </div>
    <div>
      <textarea rows="5" class="form-control">본 약관은 ...</textarea>
    </div>
    
    <div class="form-check mt-3">
      <input type="checkbox" name="event" class="form-check-input chk_each" id="event">
      <label class="form-check-label" for="event">
        이벤트 알림 동의(선택)
      </label>
    </div>
    <div>
      <textarea rows="5" class="form-control">본 약관은 ...</textarea>
    </div>
    
    <hr class="my-3">

    <div class="text-center">
      <button type="submit" class="btn btn-primary">회원가입하기</button>
    </div>
    
  </form>

</div>

<%@ include file="../layout/footer.jsp" %>