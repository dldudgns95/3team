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
  .blind {
    display: none;
  }
 
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
    <form method="get" action="${contextPath}/admin/search.do">
      <select name="column">
        <option value="NAME">회원이름</option>
        <option value="EMAIL">이메일</option>
        <option value="MOBILE">핸드폰</option>
      </select>
      <input type="text" name="searchText"  placeholder="검색어 입력" class="mb-3">
      <button type="submit" id="btn_search">검색</button>
      <a href="${contextPath}/admin/userList.do"><button type="button" id="btn_memLIst">전체 회원 목록</button></a>
    </form>
  </div>



  <hr>
  삭제 알람창 안뜸
  로그인 방법 : 0 일반가입, 1 네이버 간편 가입
  회원 등급 : (0 일반,1 정지, 2 탈퇴, 9 관리) 기본설정은 0
  
  <div>
    <table border="1">
      <thead>
        <tr>
          <td>순번</td>
          <td>회원이름</td>
          <td>이메일</td>
          <td>핸드폰</td>
          <td>구매누적금액</td>
          <td>로그인방법</td>
          <td>회원등급</td>
          <td>강제탈퇴</td>
        </tr>
      </thead>
      <tbody>      
        <c:forEach items="${memList}" var="m" varStatus="vs" >
          <tr>
            <td>${beginNo - vs.index}</td>

            <td><a href="${contextPath}/admin/userEdit.do?userId=${m.num}">${m.name}</a></td>
            <td>${m.email}</td>
            <td>${m.mobile}</td>
            <td>${m.orderDto.orderTotalPrice}</td>
            <td>${m.status}</td>
            <td>${m.auth}</td>
            <td>
              <!-- 회원삭제버튼 -->
              <form class="frm_remove" method="post" action="${contextPath}/admin/useRemove.do" style="display: inline;">
                  <input type="hidden" name="num" value="${m.num}">
                  <button type="submit">삭제</button>
              </form>
            </td>
          </tr>
          
          <tr class="blind write_tr">
            <td colspan="5">



          </tr>
        </c:forEach>
      </tbody>
      <tfoot>
        <tr>
           <td colspan="5">${paging}</td>
        </tr>
      </tfoot>
    </table>
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
  
  const fnRemoveResult = () => {
	    let removeResult = '${removeResult}';
	    if(removeResult !== ''){
	      if(removeResult === '1'){
	        alert('회원이 삭제되었습니다.');
	      } else {
	        alert('회원이 삭제되지 않았습니다.');
	      }
	    }
	  }
	  
  fnRemove();
  fnRemoveResult();
  

  </script>

<%@ include file="../../layout/footer.jsp" %>