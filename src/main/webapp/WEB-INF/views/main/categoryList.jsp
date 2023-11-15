<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="${categoryName}카테고리화면" name="title"/>
</jsp:include>

  <!-- 나중에 바꾸기 -->
    <div style="text-align: center;"><h1>"${categoryName}"카테고리에 대한 전체 검색</h1></div>
    <div style="width: 1500px;">
      <select name="orderBy" id="orderBy">
        <option value="new">최신순</option>
        <option value="hit">조회순</option>
        <option value="zzim">찜한순</option>
        <option value="topPrice">높은가격순</option>
        <option value="lowPrice">낮은가격순</option>
      </select>    
    </div>
  
  <div class="main_list">
    <c:forEach items="${productList}" var="product">
      <div class="main_item">
        <a href="${contextPath}/product/detail.do?prdtNum=${product.productDto.prdtNum}">
          <div class="main_item_image"><img src="${product.imagePath}/${product.filesystemName}"></div>
          <div>${product.productDto.prdtTitle}</div>
          <div><p>${product.productDto.prdtRealPrice}원</p></div>
        </a>
      </div>
    </c:forEach>
  </div>
  
  <script>
    $("select[name=orderBy]").change(function(){
      location.href='${contextPath}/main/list.do?categoryName=${categoryName}&orderBy=' + $(this).val();
    });
    
    const urlParams = new URL(location.href).searchParams;
    const orderBy = urlParams.get('orderBy');
    if(orderBy !== null) {
      const orderBySelect = document.getElementById('orderBy');
      orderBySelect.value = orderBy;
    }
  </script>
  
  

<%@ include file="../layout/footer.jsp"%>