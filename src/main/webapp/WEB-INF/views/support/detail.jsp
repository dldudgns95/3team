<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis() %>" />
   
<jsp:include page="../layout/header.jsp">
<!-- 무슨코드인지 물어보기 -->
  <jsp:param value="${ann.annNo}번 공지사항" name="title"/>
</jsp:include>

	<!-- 블로그 상세보기 -->
	<!-- 상세보기 첨부파일도 보여야 하는지 ??? -->
  <div>
   <h1>${support.title}</h1>
   <div>번호 : ${support.annNum}</div>
   <div>내용 : ${support.annContent}</div>
   <div>첨부파일 : ${support.annFile}</div>
   <div>등록일 : ${support.annDate}</div>
   <div>













<%@ include file="../layout/footer.jsp" %>
