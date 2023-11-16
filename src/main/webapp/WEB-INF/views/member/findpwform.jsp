<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />


<jsp:include page="../layout/header.jsp">
  <jsp:param value="비밀번호찾아드림" name="title"/>
</jsp:include>
<script type="text/javascript">
	$(function(){
		$('#findPw_form').submit(function(){
			if($('#name').val().trim()==''){
				alert('이름을 입력하세요');
				$('#name').val('').focus();
				return false;
			}
			if($('#email').val().trim()==''){
				alert('이메일을 입력하세요');
				$('#email').val('').focus();
				return false;
			}
			if(!/^[a-zA-Z가-힣]+$/.test($('#name').val())){
				alert('이름은 영문자와 한글만 입력 가능합니다.');
				$('#name').val('').focus();
				return false;
			}
			if(!/^[a-zA-Z0-9.@]+$/.test($('#email').val())){
				alert('이메일은 영문자와 숫자만 입력 가능합니다.');
				$('#email').val('').focus();
				return false;
			}
		});
	});
</script>

 <h1 class="text-center">비밀번 찾기</h1> 

 <div>
    
      <form id="findPw_form" action="${contextPath}/member/findpw.form">
          <div>
              <input type="text" class="input_style" name="name" id="name" maxlength="30" placeholder="이름을 입력해주세요">
          </div>
          <div>
              <input type="email" name="email" class="input_style" id="email" maxlength="50" placeholder="이메일을 입력해주세요">
          </div>
      	  <div>
          <input type="submit" class="btn btn-dark" value="확인">
          </div>
          <div>
          <input type="button" class="btn btn-dark" value="취소" onclick="location.href='${contextPath}/member/login.form'">
          </div>
      </form>
    </div>

<%@ include file="../layout/footer.jsp" %>