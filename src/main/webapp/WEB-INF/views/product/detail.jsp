<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="제품상세페이지" name="title"/>
</jsp:include>

  <style>
  .prdt_info {
    padding-left: "10px";
  }
  
  </style>
  
  <div>
    <span><strong> 빅 트위치 루즈핏 맨투맨 핑크 </strong></span>
    <div class="prdt_image">
      <img src="../resources/images/top/t1.jpg">
    </div>
    <div class="prdt_info">
      <p class="title_box">Product Info</p>
      맨투맨
    </div>
    
    <hr>
    
    
  </div>



</body>
</html>