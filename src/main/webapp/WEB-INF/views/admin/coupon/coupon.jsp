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


  <h1 class="head">쿠폰</h1>
  
      <div><a href="${contextPath}/admin/cpWrite.form"><button type="button" id="btn_cpWrite" class="btn btn-secondary">쿠폰등록</button></a></div>

  <div class="table-responsive">
      <table border="1" class="table align-middle">
        <thead>
          <tr>
            <td>쿠폰 이름</td>
            <td>쿠폰 정보</td>
            <td>쿠폰 가격</td>
            <td>최소주문가격</td>
            <td>시작일</td>
            <td>종료일</td>
            <td>수정</td>
            <td>삭제</td>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${cpList}" var="c">
              <form action="${contextPath}/admin/cpRemove.do" method="post">
                  <tr>
                      <td>${c.cpName}</td>
                      <td>${c.cpInfo}</td>
                      <td>${c.cpPrice}</td>
                      <td>${c.cpMin}</td>
                      <td>${c.startAt}</td>
                      <td>${c.endAt}</td>
                      <td><a href="${contextPath}/admin/editCp.form?cpNum=${c.cpNum}"><button type="button" class="btn btn-secondary">수정</button></a></td>
                      <td>
                          <input type="hidden" name="cpNum" value="${c.cpNum}">
                          <button type="submit" class="btn btn-secondary" id="btb_removeCp">삭제</button>
                      </td>
                  </tr>
              </form>
          </c:forEach>
        </tbody>

        <tfoot>
          <tr>
            <td colspan="6">${paging}</td>
          </tr>
        </tfoot>
      </table>
      
  </div>
  
  
  
  <script>
  
  const fnRemove = () => {
	  $('#btb_removeCp').click((ev) => {
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
  
  fnRemove();
  fnRemoveResult();
  
  </script>
  

<%@ include file="../../layout/footer.jsp" %>

