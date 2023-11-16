<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
    <jsp:param value="${support.annNum}번 게시글" name="title"/>
</jsp:include>
   

 
 <h1 style="text-alian: center;">공지사항 수정</h1>
 
 <div>
 <form id="frm_edit" method="post" action="${contextPath}/support/modify.do">
    <div>번호 : ${support.annNum}</div>
    <div>제목 : <input type="text" name="annTitle" value="${support.annTitle}"></div>
    <div>내용 : <textarea name="annContent">${support.annContent}</textarea></div>
    <img src="${contextPath}${support.annFile}">
    <div>등록일 : ${support.annDate}</div>
	<!-- 관리자만 편집/삭제를 수행할 수 있다. -->
    <!-- 로그인한 회원 정보 -->
    <c:if test="${sessionScope.member.auth == 9}">
        <input type="hidden" name="annNum" value="${support.annNum}">
        <button type="submit" id="btn_edit" class="btn btn-outline-dark">수정완료</button>
        <button type="button" id="btn_remove" class="btn btn-outline-dark">삭제</button>
        </c:if>
</form>
</div>


  
  

 
 
 

<%@ include file="../layout/footer.jsp" %>