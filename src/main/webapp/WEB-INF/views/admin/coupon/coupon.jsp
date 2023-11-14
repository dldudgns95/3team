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
  

  <div>
    <form action="">
      <table border="1">
        <thead>
          <tr>
            <td>쿠폰 이름</td>
            <td>쿠폰 정보</td>
            <td>쿠폰 가격</td>
            <td>최소주문가격</td>
            <td>시작일</td>
            <td>종료일</td>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
          </tr>
        </tbody>
      </table>
      <button>쿠폰등록</button>
    </form>
  </div>
  

  

<%@ include file="../../layout/footer.jsp" %>