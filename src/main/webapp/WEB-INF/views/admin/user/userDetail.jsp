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


  <h1 class="head">회원관리</h1>
  


  <div>
    <form method="get" action="${contextPath}/admin/search.do">
      <select name="column">
        <option value="NAME">회원이름</option>
        <option value="EMAIL">이메일</option>
        <option value="MOBILE">핸드폰</option>
      </select>
      <input type="text" name="searchText"  placeholder="검색어 입력" class="mb-3">
      <button type="submit" id="btn_search">검색</button>
      <a href="${contextPath}/admin/userList.do"><button type="button" id="btn_memLIst">전체 회원 목록</button></a>
    </form>
  </div>

          <td>순번</td>
          <td>회원이름</td>
          <td>이메일</td>
          <td>핸드폰</td>
          <td>구매누적금액</td>
          <td>로그인방법</td>
          <td>회원등급</td>

 <!-- 회원 상세 보기 -->
  <div>
    <h3>${mem.num}번 회원</h3>
    <div>회원이름</div>
  </div>
  
  

  <script>
  
  

  </script>

<%@ include file="../../layout/footer.jsp" %>