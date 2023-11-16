<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="1:1 문의화면" name="title"/>
</jsp:include>

  <!-- 나중에 바꾸기 -->
  <div><h1>1:1 문의</h1></div>
  
  <div>
    <table class="table">
      <thead>
        <tr>
          <td>번호</td>
          <td>제목</td>
          <td>작성자</td>
          <td>답변상태</td>
          <td>작성일</td>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${qnaList}" var="qna">
          <tr>
            <td>${qna.askNum}</td>
            <td><a href="${contextPath}/main/qnaDetail.do?askNum=${qna.askNum}">${qna.askTitle}</a></td>
            <td>${qna.memberDto.name}</td>
            <td><c:if test="${qna.askState eq 0}">답변대기중</c:if><c:if test="${qna.askState eq 1}">답변완료</c:if></td>
            <td>${qna.askDate}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
  
  <c:if test="${not empty sessionScope.member}">
    <div>
      <form action="${contextPath}/main/qnaWrite.form">
        <button type="submit" id="btn_write" class="btn btn-primary">문의글 작성하기</button>
      </form>
    </div>
  </c:if>
  
<%@ include file="../layout/footer.jsp"%>