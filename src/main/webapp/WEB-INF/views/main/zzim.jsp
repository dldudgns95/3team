<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="메인화면" name="title"/>
</jsp:include>

  <!-- 나중에 바꾸기 -->
  <div><h1>찜한 목록</h1></div>
  
  <div class="main_list">
  <c:forEach items="${productList}" var="product">
    <div class="main_item">
      <a href="${contextPath}/product/detail.do?prdtNum=${product.productDto.prdtNum}">
       <c:if test="${product.productDto.prdtStock eq 0}">
          <div class="main_item_image background_image" style="background-image: url(${contextPath}${product.imagePath}/${product.filesystemName});">
            <img src="${contextPath}/resources/images/soldout.png" class="soldout">
          </div>
        </c:if>
        <c:if test="${product.productDto.prdtStock ne 0}">
          <div class="main_item_image">
            <img src="${contextPath}${product.imagePath}/${product.filesystemName}">
          </div>
        </c:if>
       <div>${product.productDto.prdtTitle}</div>
       <div><p>${product.productDto.prdtRealPrice}원</p></div>
     </a>
   </div>
  </c:forEach>
  </div>
  

  
  

<%@ include file="../layout/footer.jsp"%>