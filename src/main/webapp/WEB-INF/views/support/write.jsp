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

<div>
	<h1>공지 작성화면</h1>
	
</div>

<div>
  <form id="frm_blog_add" method="post" action="${contextPath}/blog/addBlog.do">
</div>  













 
 
<%@ include file="../layout/footer.jsp" %>
