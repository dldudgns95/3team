<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../../layout/header.jsp">
  <jsp:param value="관리자페이지" name="title"/>
</jsp:include>
<style>

 .head {
 margin: 60px;
 text-align: center;
 color: rgb(40 40 40);
 }
 
 
 
 .search{
 justify-content: center;
 }
</style>


  <h1 class="head">상품 목록</h1>
  
  
  
  <div class="search">
    <select>
      <option>상품명</option>
      <option>번호</option>
    </select>
    <input type="text">
    <button type="button">검색</button>
  </div>

  
  <div>
    <a href="${contextPath}/admin/write.form">
      <button type="button" >상품등록....</button>
    </a>
  </div>

  

</body>
</html>