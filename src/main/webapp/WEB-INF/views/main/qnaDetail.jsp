<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="${qnaDetail.askNum}번 문의게시글" name="title"/>
</jsp:include>

  <!-- 나중에 바꾸기 -->
  <div><h1>${qnaDetail.askNum}번 문의게시글</h1></div>
  
  <div>
    <div><h3>${qnaDetail.askTitle}</h3></div>
    <div>작성자:${qnaDetail.memberDto.name}</div>
    <div>작성일:${qnaDetail.askDate}</div>
    <div>${qnaDetail.askContent}</div>
  </div>
  
  <hr>
  
  <div><h3>첨부파일</h3></div>
  <div>
    <c:if test="${empty qnaDetail.askFile}">
      첨부파일 없음
    </c:if>
    <c:if test="${not empty qnaDetail.askFile}">
      ${qnaDetail.askFile}
    </c:if>
  </div>
  
  

<%@ include file="../layout/footer.jsp"%>