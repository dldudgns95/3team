<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<style>
  .ck.ck-editor {
    max-width: 1000px;
  }
  .ck-editor__editable {
    min-height: 400px;
  }
  .ck-content {
    color: gray;
  }
</style>

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
  
  
<div class="wrap wrap_8">
  
  <div class="search text-center mb-3">
   <form action="${contextPath}/admin/searchPrdt.do" method="get">
      <select name="column">
        <option value="PRDT_NAME">제품명</option>
        <option value="PRDT_NUM">번호</option>
      </select>
      <input type="text" name="searchText" placeholder="검색어를 입력하세요." class="mb-3"> 
      <button type="submit">검색</button>
     <a href="${contextPath}/admin/prdtList.do"><button type="button" id="btn_memLIst">전체 제품 목록</button></a>
    </form>
  </div>

  
  <div>
    <a href="${contextPath}/admin/prdtWrite.form">
      <button type="button" class="btn btn-outline-primary" >제품 등록</button>
    </a>
    
    <a href="${contextPath}/admin/prdtWrite.form">
      <button type="button" class="btn btn-outline-primary" >제품 카테고리 등록</button>
    </a>    
    <a href="${contextPath}/admin/cpList.do">
      <button type="button" class="btn btn-outline-primary" >쿠폰 등록</button>
    </a>        
  </div>
  
  <hr>

  <div class="table-responsive">
   <form id="frm_btn" method="post">
    <table border="1" class="table align-middle">
      <thead>
        <tr>
          <td>제품번호</td>
          <td>제품사진</td>
          <td>제품이름</td>
          <td>제품재고</td>
          <td>수정</td>
          <td>삭제</td>
        </tr>
      </thead>
      <tbody>
      
        <c:forEach items="${prdtList}" var="p">
          <tr>
          
            <td>${p.prdtNum}</td>
            <td>${productImageDto.filesystemName}</td>
            <td>${p.prdtName}</td>
            <td>${p.prdtStock}</td>
            
            
            <td><a href="${contextPath}/admin/prdtEdit.form?prdtNum=${p.prdtNum}"><button type="button" id="btn_edit">수정</button></a></td>
            <td><a href="${contextPath}/admin/remove.do?prdtNum=${p.prdtNum}"><button type="button" id="btn_remove">삭제</button></a></td>         
         
          </tr>
        </c:forEach>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="4">${paging}</td>
        </tr>
      </tfoot>
    </table>
  </form>
  </div>
</div>



<script>
const fnRemove = () => {
	  $('.frm_remove').submit((ev) => {
		  if(!confirm('회원을 삭제할까요?')){
			  ev.preventDefault();
			  return;
		  }
	  })
}

fnRemove();

</script>


<%@ include file="../../layout/footer.jsp" %>