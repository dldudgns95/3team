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
  <hr>
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
  
  <div>
    <c:if test="${sessionScope.member.auth eq 9 && qnaDetail.askState eq 0}">
      <a href="${contextPath}/main/qnaAnswer.form?askNum=${qnaDetail.askNum}"><button type="button" class="btn btn-primary btn-lg">문의글 답변하기</button></a>
    </c:if>
  </div>
  
  <c:if test="${qnaDetail.askState eq 1}">
    <hr>
    <div class="padding_top">
      <hr>
      <div><h1>${qnaDetail.askNum}번 문의게시글 답변</h1></div>
      <div><h3>${boardAnswer.answerTitle}</h3></div>
      <div>${boardAnswer.answerContent}</div>
    </div>
  </c:if>
  
  
  
  

<%@ include file="../layout/footer.jsp"%>