<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../layout/header.jsp">
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

 a {
  text-decoration: none; 
  color: inherit;
}

</style>

  <h1 class="head">관리자 페이지</h1>
  
  
  
  
  <div class="icon_main">
    <a href="prdtList.do"><i class="fa-solid fa-tags icon"></i>상품등록</a>
    <a href="userList.do"><i class="fa-solid fa-user icon"></i>회원관리</a>
    <a href="cpList.do"><i class="fa-solid fa-calculator icon"></i>쿠폰등록</a>
    <a href="orderList.do"><i class="fa-solid fa-check-to-slot"></i>주문관리</a>
    <a href="list.do"><i class="fa-solid fa-headphones"></i>고객센터</a>
  </div>
  

  
    <div style="border: 1px solid rgb(40, 40, 40);"></div>
  

  

  

<%@ include file="../layout/footer.jsp" %>