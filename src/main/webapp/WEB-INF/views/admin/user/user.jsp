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
    <select>
      <option>회원번호</option>
      <option>이름</option>
    </select>
    <input type="text" >
    <button type="button">검색</button>
  </div>

  <hr>
  
  <div>
    <table border="1">
      <thead>
        <tr>
          <td>회원번호</td>
          <td>이름</td>
          <td>이메일</td>
          <td>상태</td>
          <td></td>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${userList}" var="u" varStatus="vs">
        
        </c:forEach>
      </tbody>
    </table>
  </div>
  

</body>
</html>