<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis() %>" />

<jsp:include page="../layout/header.jsp">
    <jsp:param value="${support.annNum}번 공지사항" name="title"/>
</jsp:include>

<style>
    .btn-primary {
        background-color: #000; /* 검정색 배경색 */
        color: #fff; /* 흰색 글자색 */
    }
</style>

<div>
    <h1>${support.annTitle}</h1>
    <div>번호 : ${support.annNum}</div>
    <div>내용 : ${support.annContent}</div>
    <div>등록일 : ${support.annDate}</div>
</div>

<!-- 관리자만 편집/삭제를 수행할 수 있다. -->
<c:if test="${sessionScope.member.auth == 9}"> <!-- 로그인한 회원 정보 -->
    <form id="frm_btn" method="post">
        <input type="hidden" name="blogNo" value="${support.annNum}">
        <input type="hidden" name="title" value="${support.annTitle}">
        <input type="hidden" name="contents" value='${support.annContent}'>
        <button type="button" id="btn_edit" class="btn btn-outline-dark">편집</button>
        <button type="button" id="btn_remove" class="btn btn-outline-dark">삭제</button>
    </form>
</c:if>
 
  <script>
  <!--편집-->
  	var frmBtn = $('#frm_btn');
  
  	const fnEditSupport = () => {
  	  $('#btn_edit').click(() => {
  		frmBtn.attr('action', '${contextPath}/support/edit.form');
  		frmBtn.submit();
  	  })
  	}
  	<!--삭제-->
  	const fnRemoveBlog= () => {
    $('#btn_remove').click(() => {
   	if(confirm(' 삭제할까요?')){
  		  frmBtn.attr('action', '${contextPath}/support/remove.do');
  		  frmBtn.submit();
   	}  
    })
  	}
  	
  	
  	fnEditSupport();
  	fnRemoveSupport();
  </script>






<%@ include file="../layout/footer.jsp" %>