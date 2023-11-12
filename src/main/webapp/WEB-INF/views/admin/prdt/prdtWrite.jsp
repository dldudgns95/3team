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
 
 
  .ck.ck-editor {
    max-width: 700px;
  }
  .ck-editor__editable {
    min-height: 400px;
  }
  .ck-content {
    color: gray;
  }
  .writer_btn {
    margin: 10px auto;
    
  }
</style>


  
  <div  class="mb-3">
    <form id="frm_admin_add"  method="post" action="${contextPath}/admin/addPrdt.do">
      <h1 class="head">제품작성</h1>
      <div class="mb-3">
          <label for="categoryNum">카테고리</label>
          <select name="categoryNum">
              <option value="0">::선택::</option>
              <option value="1">아우터</option>
              <option value="2">상의</option>
              <option value="3">하의</option>
              <option value="4">기타</option>
          </select>
      </div>
      <div class="mb-3">
          <label for="prdtNum">제품 번호</label>
          <input type="text" name="prdtNum">
      </div>
      <div class="mb-3">
          <label for="prdtName">제품 이름</label>
          <input type="text" name="prdtName">
      </div>
      <div class="mb-3">
          <label for="prdtTitle">제품 타이틀</label>
          <input type="text" name="prdtTitle">
      </div>
      <div class="mb-3">
          <label for="prdtRealPrice">제품 가격</label>
          <input type="text" name="prdtRealPrice">
      </div>
      <div class="mb-3">
          <label for="prdtStock">제품 재고</label>
          <input type="text" name="prdtStock">
      </div>
      <div class="mb-3">
          <label for="prdtInfo">제품 정보</label>
          <textarea name="prdtInfo" id="prdtInfo" style="display: none;"></textarea>
          <div id="toolbar-container"></div>
          <div id="ckeditor"></div>
      </div>

      
    <div class="writer_btn">
      <button class="btn btn-primary col-3" type="submit">작성완료</button>
    </div>
    
    
    </form>
  
  </div>
  
  
<script>

  const fnCkeditor = () => {
    DecoupledEditor
      .create(document.getElementById('ckeditor'), {
        ckfinder: {
          // 이미지 업로드 경로
          uploadUrl: '${contextPath}/admin/imageUpload.do'         
        }
      })
      .then(editor => {
        const toolbarContainer = document.getElementById('toolbar-container');
        toolbarContainer.appendChild(editor.ui.view.toolbar.element);
      })
      .catch(error => {
        console.error(error);
      });
  }
  
  const fnAdminAdd = () => {
	  $('#frm_admin_add').submit((ev) => {
      if($('#prdtNum').val() === ''){
        alert('제목은 반드시 입력해야 합니다.');
        ev.preventDefault();
        return;
      }
		  $('#prdtInfo').val($('#ckeditor').html());
	  })
  }
  
  fnCkeditor();
  fnAdminAdd();
  
</script>
  

  

</body>
</html>