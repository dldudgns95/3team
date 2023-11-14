<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="공지사항 작성" name="title"/>
</jsp:include>

<style>
  .ck.ck-editor {
    max-width: 1000px;
  }
  .ck-editor__editable {
    min-height: 400px;
  }
  .ck-content {
    color: gray;
  }
</style>

<div>
  <form id="frm_support_add" method="post" action="${contextPath}/support/addSupport.do">
    
    <h1 style="text-align: center;">공지사항을 작성하세요</h1>
    
    <div>
      <label for="title">제목</label>
      <input type="text" name="title" id="title" class="form-control">      
    </div>
    
    <div>
      <label for="contents">내용</label>
      <textarea name="content" id="content" style="display: none;"></textarea>  <!-- ckEditor 아이디와맞춰야함 -->
      <div id="toolbar-container"></div>
      <div id="ckeditor"></div>
    </div>
  
    <div class="d-grid gap-2 col-6 mx-auto">
      <button type="submit" class="btn btn-outline-dark">작성완료</button>
    </div>
    
    
  </form>
</div>

<div>
  <form id="frm_support_add" method="post" action="${contextPath}/support/addSupport.do">
  
</div>  













 
 
<%@ include file="../layout/footer.jsp" %>
