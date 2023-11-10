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


  <h1 class="head">상품 작성</h1>
  
  <div>
    <form method="post" action="">
      <div>
        <label for="prdt_num">제품 번호</label>
        <input type="text" name="prdt_num">
      </div>
    </form>
  
  </div>
  
  

  

  

</body>
</html>