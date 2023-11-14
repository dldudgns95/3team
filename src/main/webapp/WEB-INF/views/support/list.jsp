<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
  <jsp:param value="공지사항" name="title"/>
</jsp:include>

<div class="wrap wrap_8">

  <div class="text-center mb-3">
    <a href="${contextPath}/support/write.form">
        <button type="button" class="btn btn-dark">새글작성</button>
    </a>
</div>
  
  <div class="table-responsive">
    <table class="table align-middle">
      <thead>
        <tr>
          <td>번호</td>
          <td>제목</td>
          <td>내용</td>
          <td>첨부파일</td>
          <td>등록일</td>
        </tr>
      </thead>
 	<tbody>
        <c:forEach items="${supportList}" var="s" varStatus="vs">
          <tr class="align-bottom">
            <td>${beginNo - vs.index}</td>
            <!-- 제목에 상세보기 요청 -->
            <td><a href="${contextPath}/supoort/detail.do?annNo=${s.annNum}">${s.annTitle}</a></td>
            <td>${s.annContent}</td>
            <td>${s.annFile}</td>
            <td>${s.annDate}</td>
          </tr>
        </c:forEach>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="paging">${paging}</td>
        </tr>
      </tfoot>
    </table>
  </div>
</div>
<!--  <script>

  const fnAddResult = () => {
    let addResult = '${addResult}';  // '', '1', '0'
    if(addResult !== ''){
      if(addResult === '1'){
        alert('공지사항이 작성되었습니다.');
      } else {
        alert('공지사항 작성이 실패했습니다.');
      }
    }
  }
  
  const fnRemoveResult = () => {
    let removeResult = '${removeResult}';  // '', '1', '0'
    if(removeResult !== ''){
      if(removeResult === '1'){
        alert('공지사항이 삭제되었습니다.');
        $('#upload_list').empty();
      } else {
        alert('공지사항 삭제가 실패했습니다.');
      }
    }
  }

  fnAddResult();
  fnRemoveResult();
  
</script>
!-->
<%@ include file="../layout/footer.jsp" %>
