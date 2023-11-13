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
    <select>
      <option>제품명</option>
      <option>번호</option>
    </select>
    <input type="text" >
    <button type="button">검색</button>
  </div>

  
  <div>
    <a href="${contextPath}/admin/prdtWrite.form">
      <button type="button" class="btn btn-outline-primary" >제품 등록</button>
    </a>
    <a href="${contextPath}/admin/prdtWrite.form">
      <button type="button" class="btn btn-outline-primary" >제품 카테고리 등록</button>
    </a>    
  </div>
  
  <hr>

  <div class="table-responsive">
   <form method="post" action="${contextPath}/admin/prdtEdit.form" id="frm_admin_edit">
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
            <td>${p.productImageDto.filesystemName}</td>
            <td>${p.prdtName}</td>
            <td>${p.prdtStock}</td>
            
            
            <td><a href="${contextPath}/admin/prdtEdit.form?prdtNum=${p.prdtNum}"><button type="button" id="btn_edit">수정</button></a></td>
            <td><button type="button" id="btn_delete">삭제</button></td>
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

var frmBtn = $('#btn_edit');


const fnPrdtEdit = () => {
    $('#btn_edit').click((ev) => {
      

    })



const fnAddResult = () => {
	  let addResult = '${addResult}';
	  if(addResult !== ''){
		  if(addResult === '1'){
			  alert('게시글이 등록되었습니다.');
		  } else {
			  alert('게시글이 등록되지 않았습니다.');
		  }
	  }
}





  
  const fnRemove = () => {
	  $('.btn_delete').submit((ev) => {
		  if(!confirm('게시글을 삭제할까요?')){
			  ev.preventDefault();
			  return;
		  }
	  })
  }
  
  const fnRemoveResult = () => {
	    let removeResult = '${removeResult}';
	    if(removeResult !== ''){
	      if(removeResult === '1'){
	        alert('게시글이 삭제되었습니다.');
	      } else {
	        alert('게시글이 삭제되지 않았습니다.');
	      }
	    }
	  }
  
  fnPrdtEdit();
  fnAddResult();
  fnRemove();
  fnRemoveResult();

</script>

<%@ include file="../../layout/footer.jsp" %>