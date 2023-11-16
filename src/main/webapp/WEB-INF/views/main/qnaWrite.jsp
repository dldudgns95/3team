<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="문의글 작성화면" name="title"/>
</jsp:include>

  <!-- 나중에 바꾸기 -->
  <div><h1>1:1 문의글 작성하기</h1></div>
  
  <form action="${contextPath}/main/qnaWrite.do" method="post" enctype="multipart/form-data">
    <div class="mb-3 row">
      <label for="name" class="col-sm-2 col-form-label">작성자</label>
      <div class="col-sm-10">
        <input type="text" readonly class="form-control-plaintext" id="name" value="${sessionScope.member.name}">
      </div>
    </div>
    <div class="mb-3">
      <label for="askTitle" class="form-label">문의 제목</label>
      <input type="text" class="form-control" id="askTitle" name="askTitle">
    </div>
    <div class="mb-3">
      <label for="askContent" class="form-label">문의 내용</label>
      <textarea class="form-control" id="askContent" name="askContent" rows="3"></textarea>
    </div>
    <hr>
    <div class="mb-3">
      <label for="askFile" class="form-label">파일첨부하기</label>
      <input class="form-control" type="file" id="askFile" name="askFile">
    </div>
    <hr>
    <input type="hidden" name="num" value="${sessionScope.member.num}">
    <button type="submit" class="btn btn-primary btn-lg">문의글 작성 완료</button>
  </form>
  
<%@ include file="../layout/footer.jsp"%>