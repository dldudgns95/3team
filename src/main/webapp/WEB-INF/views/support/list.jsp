<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="dt" value="<%=System.currentTimeMillis()%>" />

<jsp:include page="../layout/header.jsp">
    <jsp:param value="공지사항" name="title"/>
</jsp:include>
   

    <style>
        .notice-section {
            background-color: #f2f2f2; /* 연한 회색 배경색 */
            padding: 10px; /* 내부 여백 설정 */
        }

        .table thead th {
            font-weight: bold;
       }
       
       .wrap_8 {
         display: flex;
       }
       
       .table-responsive table {
         margin-left: 200px;
       	 width: 800px;
       }
    </style>


	
        <div class="right-div">

            <div class="wrap wrap_8">
            <div><jsp:include page="../supportMenu/menu.jsp" ></jsp:include></div>
              <div class="table-responsive">
                    <table class="table align-middle table-hover">
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>내용</th>
                                <th>등록일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${supportList}" var="s" varStatus="vs">
                                <tr class="align-bottom">
                                    <td>${beginNo - vs.index}</td>
                                    <!-- 제목에 상세보기 요청 -->
                                    <td><a href="${contextPath}/support/detail.do?annNum=${s.annNum}">${s.annTitle}</a></td>
                                    <td>${s.annContent}</td>
                                    <td>${s.annDate}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="5" class="text-center">${paging}</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>

            </div>
                <div class="text-right mb-3">
                <!-- auth9(관리자)만 새글작성 보이게 -->
                <c:if test="${sessionScope.member.auth == 9}">  
                    <a href="${contextPath}/support/write.form">
                        <button type="button" class="btn btn-dark">새글작성</button>
                    </a>
                  </c:if>   
                </div>

        </div>
    </div>



<script>
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
  
  fnAddResult();
  </script>
 <!--  
  const fnRemoveResult = () => {
	    let removeResult = '${removeResult}';  // '', '1', '0'
	    if(removeResult != ''){
	      if(removeResult === '1'){
	     alert('게시글이 삭제되었습니다.');
	         $('#upload_list').empty();
	      } else {
	     alert('게시글 삭제가 실패하였습니다.');
	      }
	    }  
	   }

  
  fnRemoveResult();
  

!-->


<%@ include file="../layout/footer.jsp" %>