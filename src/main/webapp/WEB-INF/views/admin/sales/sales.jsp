<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<jsp:include page="../../layout/header.jsp">
  <jsp:param value="관리자페이지" name="title"/>
</jsp:include>
<style>
 
 .head {
 margin: 60px;
 text-align: center;
 color: rgb(40 40 40);
 }

.icon_main {
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 20px 5px 20px 30px;
  color: rgb(40 40 40);
}

.icon_main .icon {
  font-size: 20px;
}


.icon_main .fa-solid {
  font-size: 30px; 
  margin: 30px 20px 20px 40px;
  
}

</style>

<%
    // 현재 날짜를 가져오기
    java.util.Calendar calendar = java.util.Calendar.getInstance();
    
    // 현재 날짜에서 7일 전 날짜로 설정
    calendar.add(java.util.Calendar.DAY_OF_MONTH, -7);
    
    // 날짜 형식을 지정
    String pattern = "yyyy-MM-dd";
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(pattern);
    
    // 일주일 전 날짜를 문자열로 변환
    String oneWeekAgo = sdf.format(calendar.getTime());
%>

  <h1 class="head">매출관리</h1>
  
  <h3>매출 조회 기간 : <%= oneWeekAgo %>부터 현재까지</h3>
  

  

</body>
</html>