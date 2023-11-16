<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/decoupled-document/ckeditor.js"></script>

<jsp:include page="../../layout/header.jsp">
  <jsp:param value="관리자페이지" name="title"/>
</jsp:include>
<style>

 .head {
 margin: 60px;
 text-align: center;
 color: rgb(40 40 40); 
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


  
  <div  class="wrap wrap_9">
  <c:if test="${9 == sessionScope.member.auth}">
    <form id="frm_admin_modify"  method="post" action="${contextPath}/admin/modifyPrdt.do">
    
    <h1 style="text-align: center;">${prdt.prdtName} 상품 편집</h1>
    

      <div class="mb-3">
          <label for="prdtName">제품 이름</label>
          <input type="text" name="prdtName" class="form-control" value="${prdt.prdtName}">
      </div>
      <div class="mb-3">
          <label for="prdtTitle">제품 타이틀</label>
          <input type="text" name="prdtTitle" class="form-control" value="${prdt.prdtTitle}">
      </div>
      <div class="mb-3">
          <label for="prdtRealPrice">제품 가격(숫자만 입력 가능합니다.)</label>
          <input type="text" name="prdtRealPrice" class="form-control" value="${prdt.prdtRealPrice}" oninput="this.value = this.value.replace(/\D/g,'');">
      </div>
      <div>
          <label for="prdtInfo">제품 정보</label>
          <textarea name="prdtInfo" id="prdtInfo" style="display: none;"></textarea>
          <div id="toolbar-container"></div>
          <div id="ckeditor">${prdt.prdtInfo}</div>
      </div>

    <div>
      <input type="hidden" name="prdtNum" value="${prdt.prdtNum}">
      <button class="btn btn-primary col-12" type="submit">수정완료</button>
    </div>
    
    
    </form>
   </c:if>
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

const fnAdminModify = () => {
  $('#frm_admin_modify').submit(() => {
    $('#prdtInfo').val($('#ckeditor').html());
  })
}

fnCkeditor();
fnAdminModify();
  
  
</script>

  

  

<%@ include file="../../layout/footer.jsp" %>