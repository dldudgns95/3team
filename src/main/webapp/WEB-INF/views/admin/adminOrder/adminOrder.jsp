<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

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

  <h1 class="head">주문관리</h1>
  
  <div class="table-responsive">
    <table border="1" class="table align-middle">
     <thead>
         <tr>
          <td>주문번호</td>
          <td>회원번호</td>
          <td>구매금액</td>
          <td>주문날짜</td>
          <td>결제방법</td>
          <td>배송방법</td>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${orderList}" var="order">
        <tr>
          <td>${order.orderNum}</td>
          <td>${order.num}</td>
          <td>${order.orderTotalPrice}</td>
          <td>${order.orderDate}</td>
          <td>${order.payMethod}</td>
          <td>${order.deleveryMethod}</td>
         </tr>
        </c:forEach>
      </tbody>
      <tbody>

      </tbody>
    </table>
  </div>
  

  

  

<%@ include file="../../layout/footer.jsp" %>