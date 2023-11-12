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
 
 
 
 .search{
 justify-content: center;
 }
</style>


  <h1 class="head">상품 목록</h1>
  
  
  
  <div class="search">
    <select>
      <option>제품명</option>
      <option>번호</option>
    </select>
    <input type="text" >
    <button type="button">검색</button>
  </div>

  http://localhost:8080/withmall/admin/prdtWrite.form
  
  <div>
    <a href="${contextPath}/admin/prdtWrite.form">
      <button type="button" >제품 등록....</button>
    </a>
    <a href="${contextPath}/admin/prdtWrite.form">
      <button type="button" >제품 카테고리 등록</button>
    </a>    
  </div>
  
  <hr>

  <div>
    <table border="1">
      <thead>
        <tr>
          <td>제품번호</td>
          <td>제품사진</td>
          <td>제품이름</td>
          <td>제품재고</td>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${prdtList}" var="p">
          <tr>
            <td><a href="${contextPath}/adim/prtdEdit?=${p.prdtNum}">${p.prdtNum}</a></td>
            <td>${p.productImageDto.filesystemName}</td>
            <td>${p.prdtName}</td>
            <td>${p.prdtStock}</td>
          </tr>
        </c:forEach>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="4">${paging}</td>
        </tr>
      </tfoot>
    </table>
  </div>

  

</body>
</html>