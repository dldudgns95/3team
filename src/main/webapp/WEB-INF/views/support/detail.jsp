<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis() %>" />
   
<jsp:include page="../layout/header.jsp">
  <jsp:param value="${support.annNum}번 공지사항" name="title"/>
</jsp:include>

	<!-- 블로그 상세보기 -->
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
    <div>첨부파일 : ${support.annFile}</div>
    <div>등록일 : ${support.annDate}</div>
</div>

<div style="margin-left:1px;">
    <a href="/support/list" class="btn btn-primary">목록</a>
</div>

<%@ include file="../layout/footer.jsp" %>
