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
  
  <div>
    <div class="prdt_image" width="200px" height="250px">
      <img src="../resources/images/top/t1.jpg"></a>
    </div>
    <div class="prdt_info" width="225px" height="285px">
      맨투맨
    </div>
    
  </div>



</body>
</html>