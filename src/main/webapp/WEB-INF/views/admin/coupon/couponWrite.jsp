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
    <form action="${contextPath}/admin/addCp.do" method="post">
      
      <div>
        <label for="cpName">쿠폰 이름</label>
        <input type="text" name="cpName" class="form-control">
      </div>
      <div>
        <label for="cpInfo">쿠 폰 정보</label>
        <input type="text" name="cpInfo" class="form-control">
      </div>
      <div>
        <label for="cpPrice">쿠폰 가격</label>
        <input type="text" name="cpPrice" class="form-control">
      </div>
      <div>
        <label for="cpMin">최소주문가격</label>
        <input type="text" name="cpMin" class="form-control">
      </div>
      <div>
        <label for="startAt">시작일</label>
        <input type="text" name="startAt" class="form-control" placeholder="ex) 2023-12-25">
      </div>
      <div>
        <label for="endAt">종료일</label>
        <input type="text" name="endAt" class="form-control" placeholder="ex) 2023-12-25">
      </div>
      
      <div>
        <a><button type="submit" class="btn btn-secondary">쿠폰 작성 완료</button></a>
      </div>
            
    </form>
  </div>
  
 
  

<%@ include file="../../layout/footer.jsp" %>

