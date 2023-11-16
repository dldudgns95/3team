<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
    <jsp:param value="공지사항 작성" name="title"/>
</jsp:include>

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

<div>   
    <h1 style="text-align: center;">공지사항을 작성하세요</h1>
   <form method="post" action="${contextPath}/support/add.do" enctype="multipart/form-data">
    <!-- 제목 -->
    <div class="mb-3">
        <label for="title" class="form-label">제목</label>
        <input type="text" name="title" id="title" class="form-control">
    </div>
    
    <!-- 내용 -->
    <div class="mb-3">
        <label for="contents" class="form-label">내용</label>
        <textarea rows="3" cols="50" name="contents" id="contents" class="form-control"></textarea>
    </div>
    
    <!-- 첨부 -->
    <div class="mb-3">
        <label for="file" class="form-label">첨부</label>
        <input type="file" name="file" id="file" class="form-control">
    </div>
     
    <div class="d-grid gap-2">
        <!-- 작성완료 -->
        <button type="submit" class="btn btn-outline-primary">작성완료</button>
    </div>
    </form>  
</div>
  
<!-- 파일 업로드 -->  
<div id="file_list"></div>

<script>
    const fnFileCheck = () => {
        $('#files').change((ev) => {
            $('#file_list').empty();
            let maxSize = 1024 * 1024 * 100;
            let maxSizePerFile = 1024 * 1024 * 10;
            let totalSize = 0;
            let files = ev.target.files;
            for (let i = 0; i < files.length; i++) {
                totalSize += files[i].size;
                if (files[i].size > maxSizePerFile) {
                    alert('각 첨부파일의 최대 크기는 10MB입니다.');
                    $(ev.target).val('');
                    $('#file_list').empty();
                    return;
                }
                $('#file_list').append('<div>' + files[i].name + '</div>');
            }
            if (totalSize > maxSize) {
                alert('전체 첨부파일의 최대 크기는 100MB입니다.');
                $(ev.target).val('');
                $('#file_list').empty();
                return;
            }
        })
    }

    fnFileCheck();
</script>     
        
<%@ include file="../layout/footer.jsp" %>