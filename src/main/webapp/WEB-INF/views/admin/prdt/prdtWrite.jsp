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
    <form method="post" action="${contextPath}/admin/addPrdt.do">
      <h1 class="head">상품작성</h1>
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
        <label for="prdt_info">제품  정보</label>
        <textarea name="contents" id="contents" style="display: none;"></textarea>
        <div id="toolbar-container"></div>
        <div id="ckeditor"></div>
      </div>
      
    <div class="writer_btn">
      <input type="hidden" name="userNo" value="${sessionScope.user.userNo}">
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
  
  const fnBlogAdd = () => {
    $('#frm_admin_add').submit(() => {
      $('#contents').val($('#ckeditor').html());
    })
  }
  
  fnCkeditor();
  fnAdminAdd();
  
</script>
  

  

</body>
</html>