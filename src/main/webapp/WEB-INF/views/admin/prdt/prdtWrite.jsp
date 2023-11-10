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


  <h1 class="head">상품작성</h1>
  
  <div  class="mb-3">
    <form method="post" action="">
      <div  class="mb-3">
        <label for="prdt_num">제품 번호</label>
        <input type="text" name="prdt_num">
      </div>
      <div  class="mb-3">
        <label for="prdt_num">제품 이름</label>
        <input type="text" name="prdt_num">
      </div>
      <div  class="mb-3">
        <label for="prdt_title">제품 타이틀</label>
        <input type="text" name="prdt_title">
      </div>
      <div  class="mb-3">
        <label for="prdt_real_price">제품 가격</label>
        <input type="text" name="prdt_real_price">
      </div>
      <div  class="mb-3">
        <label for="prdt_info">제품 정보</label>
        <textarea rows="10" cols="50" name="prdt_info" class="mb-3"></textarea>
      </div>
    </form>
  
  </div>
  
  

  

  

</body>
</html>