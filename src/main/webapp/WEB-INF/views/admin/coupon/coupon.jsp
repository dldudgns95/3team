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


  <h1 class="head">쿠폰</h1>
  

  <div class="table-responsive">
    <form action="">
      <table border="1" class="table align-middle">
        <thead>
          <tr>
            <td>쿠폰 이름</td>
            <td>쿠폰 정보</td>
            <td>쿠폰 가격</td>
            <td>최소주문가격</td>
            <td>시작일</td>
            <td>종료일</td>
            <td>수정</td>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${cpList}" var="c">          
          <tr>
            <td>${c.cpName}</td>
            <td>${c.cpInfo}</td>
            <td>${c.cpPrice}</td>
            <td>${c.cpMin}</td>
            <td>${c.startAt}</td>
            <td>${c.endAt}</td>
            <td><a href="${contextPath}/admin/edtitCp.form"><button type="button" class="btn btn-secondary">수정</button></a></td>
          </tr>
          </c:forEach>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="6">${paging}</td>
          </tr>
        </tfoot>
      </table>
      <div><a href="${contextPath}/admin/cpWrite.form"><button type="button" id="btn_cpWrite" class="btn btn-secondary">쿠폰등록</button></a></div>
      
    </form>
  </div>
  
  
 
  <script>
  const fnCpWrite = () => {
	  
  } 
  
  </script>
  

<%@ include file="../../layout/footer.jsp" %>

